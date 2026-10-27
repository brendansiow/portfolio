import { test, expect } from '@playwright/test';
import { readFile } from 'node:fs/promises';
import { PNG } from 'pngjs';
import content from '../src/lib/content/portfolio.json' with { type: 'json' };
import { readPdf, renderPdfPage, compareSurfaces, OPS } from './pdf-utils';

const normalize = (text: string) => text.replace(/\s+/g, '');

for (const theme of ['light']) {
	test(`${theme} PDF retains content, links, page geometry and clean surfaces`, async () => {
		const testInfo = test.info();
		const filename = theme === 'dark' ? 'resume-dark.pdf' : 'resume.pdf';
		const bytes = await readFile(`private/output/${filename}`);
		const doc = await readPdf(bytes);
		try {
			const metadata = JSON.parse(await readFile(`.resume-artifacts/${theme}.json`, 'utf8'));
			expect(doc.numPages, 'Each designed sheet must fit one A4 page').toBe(metadata.length);
			expect(doc.numPages).toBe(3 + Math.ceil(content.projects.length / 4));
			const texts: string[] = [];
			const links: string[] = [];
			for (let number = 1; number <= doc.numPages; number++) {
				const page = await doc.getPage(number);
				const viewport = page.getViewport({ scale: 1 });
				expect(viewport.width).toBeCloseTo(595, 0);
				expect(viewport.height).toBeCloseTo(842, 0);
				const text = await page.getTextContent();
				texts.push(text.items.map((item) => ('str' in item ? item.str : '')).join(' '));
				links.push(
					...(await page.getAnnotations()).map((annotation) => annotation.url).filter(Boolean)
				);
				const operations = await page.getOperatorList();
				expect(operations.fnArray.filter((op) => op === OPS.paintImageXObject)).toHaveLength(1);

				const rendered = await renderPdfPage(page);
				await testInfo.attach(`${theme}-page-${number}`, {
					body: rendered,
					contentType: 'image/png'
				});
				const geometry = metadata[number - 1];
				expect(geometry.paper).toBe(theme === 'dark' ? '#111' : '#f2f2f2');
				expect(geometry.bodyFont).toContain('Helvetica');
				expect(geometry.headingFont).toContain('Maple Mono');
				const reference = await readFile(`.resume-artifacts/${geometry.background}`);
				const background = PNG.sync.read(reference);
				for (let offset = 3; offset < background.data.length; offset += 4) {
					if (background.data[offset] !== 255) throw new Error('Export background must be opaque');
				}
				const difference = compareSurfaces(rendered, reference, geometry);
				expect(difference.checked).toBeGreaterThan(20000);
				expect(
					difference.ratio,
					`${theme} page ${number}: ${JSON.stringify(difference)}`
				).toBeLessThan(0.002);
			}
			const text = normalize(texts.join(' '));
			for (const job of content.workExperience) {
				expect(text).toContain(normalize(job.company));
				for (const line of job.description) expect(text).toContain(normalize(line));
			}
			for (const project of content.projects) {
				expect(text).toContain(normalize(project.title));
				expect(text).toContain(normalize(project.description));
			}
			for (const education of content.education)
				expect(text).toContain(normalize(education.degree));
			for (const group of content.skills)
				for (const skill of group.skills) expect(text).toContain(normalize(skill));
			expect(text).toContain(normalize(content.personalInfo.name));
			expect(links).toContain(`mailto:${content.personalInfo.email}`);
			expect(links).toContain(content.personalInfo.linkedin);
			expect(links).toContain(content.personalInfo.github);
		} finally {
			await doc.cleanup();
		}
	});
}

test('surface comparison detects a horizontal band regression', async () => {
	const metadata = JSON.parse(await readFile('.resume-artifacts/light.json', 'utf8'));
	const geometry = metadata[0];
	const reference = await readFile(`.resume-artifacts/${geometry.background}`);
	const image = PNG.sync.read(reference);
	// Simulate the screenshot's unwanted dark strip across both hero cards.
	for (let y = 300; y < 348; y++) {
		for (let x = 20; x < image.width - 20; x++) {
			const offset = (y * image.width + x) * 4;
			for (let channel = 0; channel < 3; channel++) image.data[offset + channel] = 0;
		}
	}
	const difference = compareSurfaces(PNG.sync.write(image), reference, geometry);
	expect(difference.ratio).toBeGreaterThan(0.002);
});
