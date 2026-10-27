import { test, expect } from '@playwright/test';
import AxeBuilder from '@axe-core/playwright';
import { readdir } from 'node:fs/promises';
import content from '../src/lib/content/portfolio.json' with { type: 'json' };

for (const theme of ['light', 'dark'] as const) {
	for (const viewport of [
		{ width: 320, height: 844 },
		{ width: 768, height: 1000 },
		{ width: 1440, height: 1000 },
		{ width: 390, height: 844 },
		{ width: 375, height: 812 },
		{ width: 1024, height: 900 },
		{ width: 844, height: 390 }
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

	await page.evaluate(() => document.fonts.ready);
	const fonts = await page.evaluate(() => ({
		loaded: document.fonts.check('400 32px "Maple Mono"'),
		title: getComputedStyle(document.querySelector('h1')!).fontFamily,
		body: getComputedStyle(document.body).fontFamily,
		root: getComputedStyle(document.documentElement).backgroundColor
	}));
	expect(fonts.title).toContain('Maple Mono');
	expect(fonts.loaded).toBe(true);
	expect(fonts.body).toMatch(/Helvetica/);
	const channels = fonts.root.match(/\d+/g)!.map(Number);
	expect(channels[0]).toBe(channels[1]);
	expect(channels[1]).toBe(channels[2]);
});

for (const theme of ['light', 'dark']) {
	for (const width of [390, 1440]) {
		test(`${theme} accessibility scan at ${width}px`, async ({ page }) => {
			await page.setViewportSize({ width, height: 1000 });
			await page.addInitScript((value) => localStorage.setItem('theme', value), theme);
			await page.goto('/');
			await page.locator('.more-work-disclosure > summary').click();
			const results = await new AxeBuilder({ page })
				.withTags(['wcag2a', 'wcag2aa', 'wcag21aa', 'wcag22aa'])
				.analyze();
			expect(
				results.violations.map((rule) => ({
					id: rule.id,
					nodes: rule.nodes.map((node) => ({ target: node.target, reason: node.failureSummary }))
				}))
			).toEqual([]);
		});
	}
}

test('more projects expand with the keyboard and work without JavaScript', async ({
	browser,
	baseURL
}) => {
	const context = await browser.newContext({ baseURL, javaScriptEnabled: false });
	const page = await context.newPage();
	await page.goto('/');
	const disclosure = page.locator('.more-work-disclosure');
	const summary = disclosure.locator('summary');
	await expect(summary).toContainText(
		String(content.projects.filter((project) => !project.featured).length)
	);
	const additional = page.locator('.project-note').first();
	await expect(additional).toBeHidden();
	await summary.focus();
	await page.keyboard.press('Enter');
	await expect(additional).toBeVisible();
	for (const project of content.projects.filter((project) => !project.featured))
		await expect(
			disclosure.getByRole('heading', { name: project.title, exact: true })
		).toBeVisible();
	await page.keyboard.press('Enter');
	await expect(additional).toBeHidden();
	await context.close();
});

test('mobile controls have comfortable targets and menu dismisses outside', async ({ page }) => {
	await page.setViewportSize({ width: 375, height: 812 });
	await page.goto('/');
	for (const control of [
		page.getByRole('button', { name: 'Toggle theme' }),
		page.getByLabel('Navigation menu')
	]) {
		const box = (await control.boundingBox())!;
		expect(box.width).toBeGreaterThanOrEqual(44);
		expect(box.height).toBeGreaterThanOrEqual(44);
	}
	await page.getByLabel('Navigation menu').click();
	await page.locator('.intro').click();
	await expect(page.locator('.mobile-nav')).not.toHaveAttribute('open', '');
	await page.getByLabel('Navigation menu').click();
	await page
		.getByRole('navigation', { name: 'Mobile navigation' })
		.getByRole('link', { name: 'Work', exact: true })
		.click();
	await expect(page.locator('#projects')).toBeFocused();
});

test('reduced motion disables scrolling and interface transitions', async ({ page }) => {
	await page.emulateMedia({ reducedMotion: 'reduce' });
	await page.goto('/');
	const motion = await page.evaluate(() => ({
		scroll: getComputedStyle(document.documentElement).scrollBehavior,
		transition: getComputedStyle(document.querySelector('.button')!).transitionDuration,
		animation: getComputedStyle(document.querySelector('.button')!).animationName
	}));
	expect(motion).toEqual({ scroll: 'auto', transition: '0s', animation: 'none' });
	await page.getByRole('link', { name: 'Skip to content' }).focus();
	const skip = (await page.getByRole('link', { name: 'Skip to content' }).boundingBox())!;
	expect(skip.y).toBeGreaterThanOrEqual(0);
	await page.keyboard.press('Enter');
	await expect(page.locator('#content')).toBeFocused();
});
