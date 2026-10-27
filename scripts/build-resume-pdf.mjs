#!/usr/bin/env node
// Local-only resume export. Neither this renderer nor its files are part of the website.
import { spawn } from 'node:child_process';
import { mkdir, rename, rm } from 'node:fs/promises';
import { resolve } from 'node:path';
import { chromium } from 'playwright';
import { flattenResumeBackgrounds } from './flatten-resume-backgrounds.mjs';

const vite = resolve('node_modules/vite/bin/vite.js');
const port = Number(process.env.RESUME_PORT || 4321);
const baseUrl = `http://127.0.0.1:${port}`;
let server;
let browser;

try {
	{
		// Never silently reuse another process: that could generate a stale resume.

		server = spawn(
			process.execPath,
			[
				vite,
				'--config',
				'scripts/resume.vite.config.mjs',
				'--host',
				'127.0.0.1',
				'--port',
				String(port),
				'--strictPort'
			],
			{ stdio: ['ignore', 'pipe', 'inherit'] }
		);
		await new Promise((ready, reject) => {
			const timeout = setTimeout(() => reject(new Error('Preview startup timed out')), 30000);
			const fail = (error) => {
				clearTimeout(timeout);
				reject(error);
			};
			server.once('error', fail);
			server.once('exit', (code) => fail(new Error(`Preview exited (${code}); check RESUME_PORT`)));
			server.stdout.on('data', (chunk) => {
				process.stdout.write(chunk);
				if (chunk.toString().includes('Local:')) {
					clearTimeout(timeout);
					ready();
				}
			});
		});
	}
	browser = await chromium.launch();

	await mkdir(resolve('private/output'), { recursive: true });
	{
		const theme = 'light';
		const filename = 'resume.pdf';
		const output = resolve('private/output', filename);
		const context = await browser.newContext({
			colorScheme: theme,
			deviceScaleFactor: 2,
			viewport: { width: 794, height: 1123 }
		});
		// Initialize the same theme store the website uses before hydration.
		await context.addInitScript((value) => localStorage.setItem('theme', value), theme);
		try {
			const page = await context.newPage();
			const errors = [];
			page.on('pageerror', (error) => errors.push(error.message));
			const response = await page.goto(baseUrl, {
				waitUntil: 'networkidle'
			});
			if (!response?.ok()) throw new Error('Resume HTML is unavailable');
			await page.locator('#resume-pdf').waitFor();
			await page.evaluate(async (value) => {
				document.documentElement.classList.toggle('dark', value === 'dark');
				await document.fonts.ready;
				await Promise.all(Array.from(document.images, (image) => image.decode()));
			}, theme);
			await page.emulateMedia({ media: 'print' });
			if (errors.length) throw new Error(`Resume renderer failed: ${errors.join('; ')}`);
			// Fail before writing any new file rather than silently clipping growing JSON content.
			await page.locator('.resume-sheet').evaluateAll((sheets) => {
				for (const [index, sheet] of sheets.entries()) {
					const bounds = sheet.getBoundingClientRect();
					const footer = sheet.querySelector('.sheet-footer').getBoundingClientRect();
					const content = Array.from(sheet.querySelectorAll('*')).filter(
						(element) => !element.closest('.sheet-footer')
					);
					const overflow = content.some((element) => {
						const rect = element.getBoundingClientRect();
						return (
							rect.bottom > footer.top - 6 || rect.left < bounds.left || rect.right > bounds.right
						);
					});
					if (overflow || sheet.scrollHeight > sheet.clientHeight + 1)
						throw new Error(
							`Resume page ${index + 1} overflows. Adjust ResumePDF.svelte pagination before exporting.`
						);
				}
			});
			await flattenResumeBackgrounds(page, theme);
			// CSS owns pagination; text stays selectable and links stay clickable.
			await page.pdf({
				path: `${output}.tmp`,
				format: 'A4',
				printBackground: true,
				preferCSSPageSize: true,
				tagged: true
			});
			await rename(`${output}.tmp`, output);
			await rm(resolve('private/output/resume-dark.pdf'), { force: true });
			console.log(`Resume generated (${theme}): ${output}`);
		} finally {
			await context.close();
		}
	}
} finally {
	await browser?.close();
	server?.kill('SIGTERM');
}
