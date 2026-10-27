import assert from 'node:assert/strict';
import { preview } from 'vite';
import { chromium } from 'playwright';

// Exercise the deployed subdirectory as well as the root-path portfolio suite.
const base = process.env.BASE_PATH || '';
const origin = 'http://127.0.0.1:4400';
const server = await preview({ preview: { host: '127.0.0.1', port: 4400, strictPort: true } });
let browser;
try {
	browser = await chromium.launch();
	const page = await browser.newPage();
	const failures = [];
	page.on('pageerror', (error) => failures.push(error.message));
	page.on('response', (response) => {
		if (response.url().startsWith(origin) && response.status() >= 400)
			failures.push(`${response.status()} ${response.url()}`);
	});
	await page.goto(`${origin}${base}/`, { waitUntil: 'networkidle' });
	assert.match(await page.title(), /Brendan Siow/);
	await page.locator('img').evaluateAll(async (images) => {
		for (const image of images) {
			image.loading = 'eager';
			await image.decode();
			if (!image.naturalWidth) throw new Error(`Broken logo: ${image.src}`);
		}
	});
	assert.deepEqual(failures, []);
	for (const path of ['/resume', '/resume.pdf', '/private/output/resume.pdf']) {
		const response = await page.request.get(`${origin}${base}${path}`);
		assert.equal(response.status(), 404, `Private resume exposed: ${path}`);
	}
	console.log(`GitHub Pages path verified: ${base || '/'}, including logos and resume privacy.`);
} finally {
	await browser?.close();
	await new Promise((resolve, reject) =>
		server.httpServer.close((error) => (error ? reject(error) : resolve()))
	);
}
