import { mkdir, writeFile } from 'node:fs/promises';
import { resolve } from 'node:path';

/** Flatten decoration only. PDF readers receive opaque pixels behind vector text and links. */
export async function flattenResumeBackgrounds(page, theme) {
	const directory = resolve('.resume-artifacts');
	await mkdir(directory, { recursive: true });
	const sheets = page.locator('.resume-sheet');
	const metadata = [];
	for (let index = 0; index < (await sheets.count()); index++) {
		const sheet = sheets.nth(index);
		// Capture each sheet at the origin to avoid fractional scroll clipping
		// accidentally including a thin strip from the previous sheet.
		const isolateSheet = await page.addStyleTag({
			content: `#resume-pdf .resume-sheet:not(:nth-child(${index + 1})) { display: none !important; }`
		});
		const geometry = await sheet.evaluate((element) => {
			const bounds = element.getBoundingClientRect();
			const masks = [];
			const addRect = (rect) =>
				masks.push({
					x: rect.left - bounds.left,
					y: rect.top - bounds.top,
					width: rect.width,
					height: rect.height
				});
			const walker = document.createTreeWalker(element, NodeFilter.SHOW_TEXT);
			while (walker.nextNode()) {
				if (!walker.currentNode.textContent.trim()) continue;
				const range = document.createRange();
				range.selectNodeContents(walker.currentNode);
				for (const rect of range.getClientRects()) addRect(rect);
			}
			for (const visual of element.querySelectorAll('svg, img, li'))
				addRect(visual.getBoundingClientRect());
			return {
				width: bounds.width,
				height: bounds.height,
				masks,
				paper: getComputedStyle(document.documentElement).getPropertyValue('--paper').trim(),
				bodyFont: getComputedStyle(element).fontFamily,
				headingFont: getComputedStyle(element.querySelector('h1, h2')).fontFamily
			};
		});
		const hideContent = await page.addStyleTag({
			content: `
			#resume-pdf *, #resume-pdf *::marker { color: transparent !important; -webkit-text-fill-color: transparent !important; text-shadow: none !important; }
			#resume-pdf svg { visibility: hidden !important; }
		`
		});
		let background;
		try {
			background = await sheet.screenshot({ animations: 'disabled', omitBackground: false });
		} finally {
			await hideContent.evaluate((element) => element.remove());
			await isolateSheet.evaluate((element) => element.remove());
		}
		const filename = `${theme}-${index + 1}.png`;
		await writeFile(resolve(directory, filename), background);
		metadata.push({ ...geometry, background: filename });
		await sheet.evaluate((element, data) => {
			element.style.backgroundImage = `url(data:image/png;base64,${data})`;
		}, background.toString('base64'));
	}
	await page.addStyleTag({
		content: `
		#resume-pdf img { visibility: hidden !important; }
		#resume-pdf .resume-sheet { background-size: 100% 100% !important; background-repeat: no-repeat !important; }
		#resume-pdf .resume-sheet * {
			background: none !important; border-color: transparent !important;
			box-shadow: none !important; filter: none !important; backdrop-filter: none !important;
		}
	`
	});
	await writeFile(resolve(directory, `${theme}.json`), JSON.stringify(metadata, null, 2));
}
