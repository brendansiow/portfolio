import { defineConfig } from '@playwright/test';

export default defineConfig({
	testDir: './tests',
	testMatch: 'portfolio.spec.ts',
	fullyParallel: true,
	forbidOnly: !!process.env.CI,
	retries: 0,
	workers: 2,
	reporter: [['list'], ['html', { open: 'never' }]],
	use: {
		baseURL: 'http://127.0.0.1:4399',
		browserName: 'chromium',
		trace: 'retain-on-failure',
		screenshot: 'only-on-failure'
	},
	webServer: {
		command: 'npm run preview -- --host 127.0.0.1 --port 4399 --strictPort',
		url: 'http://127.0.0.1:4399',
		reuseExistingServer: false
	}
});
