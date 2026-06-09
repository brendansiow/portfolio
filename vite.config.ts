import { sveltekit } from '@sveltejs/kit/vite';
import { defineConfig } from 'vite';

export default defineConfig({
	plugins: [sveltekit()],
	server: {
		host: '0.0.0.0',
		allowedHosts: true
	},
	optimizeDeps: {
		include: ['html2pdf.js']
	},
	define: {
		self: 'globalThis'
	}
});
