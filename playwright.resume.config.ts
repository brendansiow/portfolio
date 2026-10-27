import { defineConfig } from '@playwright/test';

// Explicit local-only suite. Its PDF screenshots are never uploaded by deployment CI.
export default defineConfig({
	testDir: './tests',
	testMatch: 'resume-pdf.spec.ts',
	workers: 2,
	outputDir: 'private/test-results',
	reporter: [['list'], ['html', { outputFolder: 'private/test-report', open: 'never' }]]
});
