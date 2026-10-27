import { test, expect } from '@playwright/test';
import { readdir } from 'node:fs/promises';
import content from '../src/lib/content/portfolio.json' with { type: 'json' };

for (const theme of ['light', 'dark'] as const) {
	for (const viewport of [
		{ width: 320, height: 844 },
		{ width: 768, height: 1000 },
		{ width: 1440, height: 1000 },
		{ width: 390, height: 844 }
	]) {
		test(`${theme} public portfolio at ${viewport.width}px`, async ({ browser, baseURL }) => {
			const context = await browser.newContext({ colorScheme: theme, viewport, baseURL });
			const page = await context.newPage();
			const errors: string[] = [];
			page.on('pageerror', (error) => errors.push(error.message));
			const missing: string[] = [];
			page.on('response', (response) => {
				if (response.url().startsWith(baseURL!) && response.status() >= 400)
					missing.push(response.url());
			});
			await page.goto('/');
			await expect(page.locator('html')).toHaveClass(theme === 'dark' ? /dark/ : /^(?!.*dark)/);
			await expect(page.locator('h1')).toHaveText(content.personalInfo.headline);
			await expect(
				page.getByRole('complementary', { name: `About ${content.personalInfo.name}` })
			).toContainText(content.personalInfo.aboutSummary);
			for (const job of content.workExperience)
				await expect(page.locator('#experience')).toContainText(job.company);
			for (const project of content.projects)
				await expect(page.locator('#projects')).toContainText(project.title);
			await expect(page.locator('a[href*="resume"], a[download]')).toHaveCount(0);
			await expect(page.locator('#resume-pdf')).toHaveCount(0);
			await expect(page.locator('#education, a[href="#education"]')).toHaveCount(0);
			expect(await page.evaluate(() => document.documentElement.scrollWidth <= innerWidth)).toBe(
				true
			);
			expect(errors).toEqual([]);
			expect(missing).toEqual([]);
			await context.close();
		});
	}
}

test('resume files and source routes are absent from public hosting', async ({ request }) => {
	for (const path of [
		'/resume',
		'/resume/',
		'/resume.html',
		'/resume.pdf',
		'/resume-dark.pdf',
		'/private/output/resume.pdf',
		'/private/output/resume-dark.pdf',
		'/private/resume/index.html'
	]) {
		const response = await request.get(path);
		expect(response.status(), `${path} must not be accessible`).toBe(404);
	}
	const files = await readdir('build', { recursive: true });
	expect(files.filter((file) => /\.pdf$/i.test(file) || /(^|\/)private(\/|$)/.test(file))).toEqual(
		[]
	);
});

test('theme toggle persists after reload', async ({ page }) => {
	await page.addInitScript(() => localStorage.setItem('theme', 'light'));
	await page.goto('/');
	await expect(page.locator('html')).not.toHaveClass(/dark/);
	await page.getByRole('button', { name: 'Toggle theme' }).click();
	await expect(page.locator('html')).toHaveClass(/dark/);
	const restored = await page.context().newPage();
	await restored.goto('/');
	await expect(restored.locator('html')).toHaveClass(/dark/);
	await restored.reload();
	await expect(restored.locator('html')).toHaveClass(/dark/);
	await restored.getByRole('button', { name: 'Toggle theme' }).click();
	await expect(restored.locator('html')).not.toHaveClass(/dark/);
});

test('public content and contact work without JavaScript', async ({ browser, baseURL }) => {
	const context = await browser.newContext({ javaScriptEnabled: false, baseURL });
	const page = await context.newPage();
	await page.goto('/');
	await expect(page.locator('h1')).toHaveText(content.personalInfo.headline);
	await expect(page.locator('#contact a[href^="mailto:"]')).toBeVisible();
	await expect(page.locator('a[href*="resume"], a[download]')).toHaveCount(0);
	await context.close();
});

test('floating desktop navigation reaches every section and tracks the active section', async ({
	page
}) => {
	await page.setViewportSize({ width: 1440, height: 1000 });
	await page.goto('/');
	const header = page.locator('.floating-header');
	const navigation = page.getByRole('navigation', { name: 'Main navigation', exact: true });
	await expect(navigation.getByRole('link')).toHaveCount(6);
	const initial = (await header.boundingBox())!;
	await navigation.getByRole('link', { name: 'Skills', exact: true }).click();
	await expect(page).toHaveURL(/#skills$/);
	await expect(navigation.getByRole('link', { name: 'Skills', exact: true })).toHaveAttribute(
		'aria-current',
		'location'
	);
	const scrolled = (await header.boundingBox())!;
	expect(Math.abs(initial.y - scrolled.y)).toBeLessThan(1);
	expect(await page.evaluate(() => scrollY)).toBeGreaterThan(500);
	for (const link of await navigation.getByRole('link').all()) {
		const href = (await link.getAttribute('href'))!;
		await expect(page.locator(href)).toHaveCount(1);
	}
});

test('mobile navigation exposes all sections, closes after selection, and supports Escape', async ({
	page
}) => {
	await page.setViewportSize({ width: 390, height: 844 });
	await page.goto('/');
	const menu = page.locator('.mobile-nav');
	const toggle = page.getByLabel('Navigation menu');
	await toggle.click();
	const navigation = page.getByRole('navigation', { name: 'Mobile navigation' });
	await expect(navigation).toBeVisible();
	await expect(navigation.getByRole('link')).toHaveCount(6);
	await navigation.getByRole('link', { name: 'Activity', exact: true }).click();
	await expect(page).toHaveURL(/#activity$/);
	await expect(menu).not.toHaveAttribute('open', '');
	await toggle.click();
	await page.keyboard.press('Escape');
	await expect(menu).not.toHaveAttribute('open', '');
	await expect(toggle).toBeFocused();
});

test('company logos load and typography follows the monochrome design', async ({ page }) => {
	await page.goto('/');
	for (const image of await page.locator('img').all()) {
		await image.scrollIntoViewIfNeeded();
		await expect
			.poll(() =>
				image.evaluate(
					(element) =>
						(element as HTMLImageElement).complete && (element as HTMLImageElement).naturalWidth > 0
				)
			)
			.toBe(true);
	}
	for (const image of await page.locator('.company-logo').all()) {
		expect(await image.getAttribute('src')).toMatch(/\.png$/);
		if ((await image.getAttribute('src'))?.includes('ifast-wordmark')) {
			expect(
				await image.evaluate(
					(element) =>
						(element as HTMLImageElement).naturalWidth / element.getBoundingClientRect().width
				)
			).toBeGreaterThanOrEqual(2);
		}
		const appearance = await image.evaluate((element) => ({
			border: getComputedStyle(element).borderWidth,
			shadow: getComputedStyle(element).boxShadow,
			background: getComputedStyle(element).backgroundColor
		}));
		expect(appearance).toEqual({ border: '0px', shadow: 'none', background: 'rgba(0, 0, 0, 0)' });
	}

	const fonts = await page.evaluate(() => ({
		title: getComputedStyle(document.querySelector('h1')!).fontFamily,
		body: getComputedStyle(document.body).fontFamily,
		root: getComputedStyle(document.documentElement).backgroundColor
	}));
	expect(fonts.title).toMatch(/mono|Menlo/i);
	expect(fonts.body).toMatch(/Helvetica/);
	const channels = fonts.root.match(/\d+/g)!.map(Number);
	expect(channels[0]).toBe(channels[1]);
	expect(channels[1]).toBe(channels[2]);
});
