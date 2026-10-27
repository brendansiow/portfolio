import { defineConfig } from 'vite';
import { svelte, vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import { resolve } from 'node:path';

// Separate from SvelteKit routes and bound only to loopback by the export script.
export default defineConfig({
	root: resolve('private/resume'),
	publicDir: resolve('static'),
	plugins: [svelte({ configFile: false, preprocess: vitePreprocess() })],
	resolve: {
		alias: {
			$lib: resolve('src/lib'),
			'$app/environment': resolve('private/resume/environment.ts'),
			'$app/paths': resolve('private/resume/paths.ts')
		}
	},
	server: { host: '127.0.0.1', fs: { allow: [resolve('.')] } }
});
