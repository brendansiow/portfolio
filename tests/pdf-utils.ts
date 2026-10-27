import { createCanvas, DOMMatrix, ImageData, Path2D } from '@napi-rs/canvas';
import { PNG } from 'pngjs';
import type { PDFPageProxy } from 'pdfjs-dist';
import { fileURLToPath } from 'node:url';

Object.assign(globalThis, {
	DOMMatrix: globalThis.DOMMatrix ?? DOMMatrix,
	ImageData: globalThis.ImageData ?? ImageData,
	Path2D: globalThis.Path2D ?? Path2D
});
const { getDocument, OPS } = await import('pdfjs-dist/legacy/build/pdf.mjs');

export { OPS };

export async function readPdf(bytes: Buffer) {
	return getDocument({
		data: new Uint8Array(bytes),
		standardFontDataUrl:
			fileURLToPath(new URL('../node_modules/pdfjs-dist/standard_fonts/', import.meta.url)) + '/',
		useSystemFonts: false
	}).promise;
}

export async function renderPdfPage(page: PDFPageProxy) {
	const viewport = page.getViewport({ scale: (96 / 72) * 2 });
	const canvas = createCanvas(Math.ceil(viewport.width), Math.ceil(viewport.height));
	await page.render({
		canvas: null,
		canvasContext: canvas.getContext('2d') as unknown as CanvasRenderingContext2D,
		viewport
	}).promise;
	return canvas.toBuffer('image/png');
}

// Compare only surfaces, excluding text/icons and a small antialiasing margin.
// No committed font-dependent screenshots: the reference is the exact background embedded at build.
export function compareSurfaces(actualBytes: Buffer, expectedBytes: Buffer, geometry: Geometry) {
	const actual = PNG.sync.read(actualBytes);
	const expected = PNG.sync.read(expectedBytes);
	let checked = 0;
	let different = 0;
	for (let y = 8; y < expected.height - 8; y += 3) {
		for (let x = 8; x < expected.width - 8; x += 3) {
			const cssX = (x / expected.width) * geometry.width;
			const cssY = (y / expected.height) * geometry.height;
			if (
				geometry.masks.some(
					(rect) =>
						cssX >= rect.x - 3 &&
						cssX <= rect.x + rect.width + 3 &&
						cssY >= rect.y - 3 &&
						cssY <= rect.y + rect.height + 3
				)
			)
				continue;
			// Ignore intended sharp edges (pill outlines, card rims, separators).
			// A seam is a new edge within an otherwise smooth reference surface.
			const source = (y * expected.width + x) * 4;
			const offsets = [-3 * expected.width, 3 * expected.width, -3, 3];
			if (
				offsets.some((offset) =>
					[0, 1, 2].some(
						(channel) =>
							Math.abs(
								expected.data[source + channel] - expected.data[source + offset * 4 + channel]
							) > 3
					)
				)
			)
				continue;

			const actualX = Math.round((x / expected.width) * geometry.width * 2);
			const actualY = Math.round((y / expected.height) * geometry.height * 2);
			if (actualX >= actual.width || actualY >= actual.height) continue;
			const target = (actualY * actual.width + actualX) * 4;
			checked++;
			// PDF page dimensions round differently from CSS pixels. Match within a
			// two-pixel neighborhood so rounded-edge antialiasing is not a seam.
			let matches = false;
			for (let dy = -2; dy <= 2 && !matches; dy++) {
				for (let dx = -2; dx <= 2 && !matches; dx++) {
					const neighbor = ((y + dy) * expected.width + x + dx) * 4;
					matches = [0, 1, 2].every(
						(channel) =>
							Math.abs(expected.data[neighbor + channel] - actual.data[target + channel]) <= 10
					);
				}
			}
			if (!matches) different++;
		}
	}
	return { checked, different, ratio: different / Math.max(checked, 1) };
}

interface Geometry {
	width: number;
	height: number;
	masks: { x: number; y: number; width: number; height: number }[];
}
