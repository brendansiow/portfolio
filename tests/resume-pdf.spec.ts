import { test, expect } from '@playwright/test';
import { readFile } from 'node:fs/promises';
import { PNG } from 'pngjs';
import content from '../src/lib/content/portfolio.json' with { type: 'json' };
import { readPdf, renderPdfPage, compareSurfaces, OPS } from './pdf-utils';

const resumeProjects = content.projects.filter((project) => project.includeInResume);
const normalize = (text: string) => text.replace(/\s+/g, '');

for (const theme of ['dark']) {
	test(`${theme} PDF retains content, links, page geometry and clean surfaces`, async () => {
		const testInfo = test.info();
		const bytes = await readFile('private/output/resume.pdf');
		const doc = await readPdf(bytes);
		try {
			const metadata = JSON.parse(await readFile(`.resume-artifacts/${theme}.json`, 'utf8'));
			expect(doc.numPages, 'Each designed sheet must fit one A4 page').toBe(metadata.length);
			expect(doc.numPages).toBe(5 + Math.ceil(resumeProjects.length / 8));
			const texts: string[] = [];
			const links: string[] = [];
			for (let number = 1; number <= doc.numPages; number++) {
				const page = await doc.getPage(number);
				const viewport = page.getViewport({ scale: 1 });
				expect(viewport.width).toBeCloseTo(595, 0);
				expect(viewport.height).toBeCloseTo(842, 0);
				const text = await page.getTextContent();
				texts.push(text.items.map((item) => ('str' in item ? item.str : '')).join(' '));
				if (number >= 4 && number < 4 + Math.ceil(resumeProjects.length / 8)) {
					const projects = resumeProjects.slice((number - 4) * 8, (number - 3) * 8);
					for (const project of projects)
						expect(
							normalize(texts[number - 1]),
							'Projects must share their assigned page'
						).toContain(normalize(project.title));
					if (projects.length === 8) {
						const lastTitle = text.items.find(
							(item) => 'str' in item && normalize(item.str) === normalize(projects[7].title)
						);
						expect(lastTitle, 'The final row must remain visible').toBeDefined();
						if (lastTitle && 'transform' in lastTitle)
							expect(
								viewport.height - lastTitle.transform[5],
								'The last project row should appear in the lower half of the page'
							).toBeGreaterThan(viewport.height * 0.55);
					}
				}
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
				expect(geometry.paper).toBe('#111');
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
			expect(texts[0]).toContain('About');
			expect(texts[1]).toContain('Experience');
			expect(texts[2]).toContain('Experience, continued.');
			expect(texts[3]).toContain('Selected work');
			expect(texts.at(-2)).toContain('Skills');
			expect(texts.at(-1)).toContain('Education & recognition');
			const text = normalize(texts.join(' '));
			for (const job of content.workExperience) {
				expect(text).toContain(normalize(job.company));
				for (const line of job.description) expect(text).toContain(normalize(line));
			}
			for (const project of resumeProjects) {
				expect(text).toContain(normalize(project.title));
				expect(text).toContain(normalize(project.description));
			}
			for (const project of content.projects.filter((project) => !project.includeInResume)) {
				expect(text, 'Website-only project must not change the resume').not.toContain(
					normalize(project.title)
				);
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
	const metadata = JSON.parse(await readFile('.resume-artifacts/dark.json', 'utf8'));
	const geometry = metadata[0];
	const reference = await readFile(`.resume-artifacts/${geometry.background}`);
	const image = PNG.sync.read(reference);
	// Simulate an unwanted bright strip on the dark page.
	for (let y = 300; y < 348; y++) {
		for (let x = 20; x < image.width - 20; x++) {
			const offset = (y * image.width + x) * 4;
			for (let channel = 0; channel < 3; channel++) image.data[offset + channel] = 255;
		}
	}
	const difference = compareSurfaces(PNG.sync.write(image), reference, geometry);
	expect(difference.ratio).toBeGreaterThan(0.002);
});
