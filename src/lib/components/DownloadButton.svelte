<script lang="ts">
	import Button from '$lib/components/ui/button.svelte';
	import { Download } from 'lucide-svelte';

	let isGenerating = $state(false);

	async function downloadResume() {
		isGenerating = true;

		try {
			const element = document.getElementById('resume-pdf');
			if (!element) {
				throw new Error('Resume PDF element not found');
			}

			const html2pdf = (await import('$lib/html2pdf-wrapper.js')).default;

			const opt = {
				margin: 0,
				filename: 'brendan-siow-resume.pdf',
				image: { type: 'jpeg', quality: 0.95 },
				html2canvas: {
					scale: 2,
					useCORS: true,
					backgroundColor: '#ffffff',
					logging: false
				},
				jsPDF: {
					unit: 'mm',
					format: 'a4',
					orientation: 'portrait',
					putOnlyUsedFonts: true
				}
			};

			await html2pdf().set(opt).from(element).save();
		} catch (error) {
			console.error('Error generating PDF:', error);
			alert('Failed to generate PDF. Please try again.');
		} finally {
			isGenerating = false;
		}
	}
</script>

<div class="fixed bottom-5 right-5 z-50">
	<Button
		onclick={downloadResume}
		disabled={isGenerating}
		class="glass h-11 w-11 rounded-full border-white/25 p-0 text-slate-700 transition hover:bg-white/60 dark:border-slate-700/40 dark:text-slate-100 dark:hover:bg-slate-800/60"
		aria-label="Download Resume as PDF"
		title={isGenerating ? 'Generating PDF...' : 'Download resume'}
	>
		{#if isGenerating}
			<div
				class="h-5 w-5 animate-spin rounded-full border-2 border-slate-500 border-t-transparent dark:border-slate-200"
			></div>
		{:else}
			<Download class="h-5 w-5" />
		{/if}
	</Button>
</div>
