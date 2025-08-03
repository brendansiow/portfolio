<script lang="ts">
	import { onMount } from 'svelte';

	let html2pdf = $state<any>(null);
	let isGenerating = $state(false);

	onMount(async () => {
		// Dynamically import html2pdf library
		const { default: html2pdfLib } = await import('html2pdf.js');
		html2pdf = html2pdfLib;
	});

	async function downloadResume() {
		if (!html2pdf) {
			alert('PDF library not loaded yet. Please try again.');
			return;
		}

		isGenerating = true;

		try {
			// Get the portfolio content element
			const element = document.getElementById('portfolio-content');
			if (!element) {
				throw new Error('Portfolio content not found');
			}

			// Configure PDF options
			const options = {
				margin: 0.5,
				filename: 'resume.pdf',
				image: { type: 'jpeg', quality: 0.98 },
				html2canvas: { 
					scale: 2,
					useCORS: true,
					allowTaint: true
				},
				jsPDF: { 
					unit: 'in', 
					format: 'letter', 
					orientation: 'portrait' 
				}
			};

			// Generate and download PDF
			await html2pdf().set(options).from(element).save();
		} catch (error) {
			console.error('Error generating PDF:', error);
			alert('Failed to generate PDF. Please try again.');
		} finally {
			isGenerating = false;
		}
	}
</script>

<!-- Floating Download Button -->
<div class="fixed bottom-8 right-8 z-50">
	<button
		onclick={downloadResume}
		disabled={isGenerating || !html2pdf}
		class="group glass p-4 rounded-full text-white shadow-2xl hover:bg-white/20 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed"
		title="Download Resume as PDF"
	>
		{#if isGenerating}
			<svg class="w-6 h-6 animate-spin" fill="none" stroke="currentColor" viewBox="0 0 24 24">
				<circle class="opacity-25" cx="12" cy="12" r="10" stroke="currentColor" stroke-width="4"></circle>
				<path class="opacity-75" fill="currentColor" d="M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z"></path>
			</svg>
		{:else}
			<svg class="w-6 h-6 group-hover:scale-110 transition-transform duration-300" fill="none" stroke="currentColor" viewBox="0 0 24 24">
				<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 10v6m0 0l-3-3m3 3l3-3m2 8H7a2 2 0 01-2-2V5a2 2 0 012-2h5.586a1 1 0 01.707.293l5.414 5.414a1 1 0 01.293.707V19a2 2 0 01-2 2z"></path>
			</svg>
		{/if}
	</button>

	<!-- Tooltip -->
	<div class="absolute bottom-full right-0 mb-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none">
		<div class="glass px-3 py-2 rounded-lg text-white text-sm whitespace-nowrap">
			{isGenerating ? 'Generating PDF...' : 'Download Resume'}
			<div class="absolute top-full right-4 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-white/20"></div>
		</div>
	</div>
</div>

<!-- Print Styles -->
<style>
	@media print {
		/* Hide elements that shouldn't appear in PDF */
		:global(.fixed),
		:global(nav),
		:global(footer) {
			display: none !important;
		}

		/* Optimize spacing for print */
		:global(section) {
			page-break-inside: avoid;
			margin-bottom: 2rem !important;
		}

		/* Ensure text is readable */
		:global(.text-white) {
			color: #000 !important;
		}

		:global(.text-white\/80) {
			color: #333 !important;
		}

		:global(.text-white\/70) {
			color: #666 !important;
		}

		/* Simplify glass effects for print */
		:global(.glass) {
			background: rgba(255, 255, 255, 0.9) !important;
			border: 1px solid #e5e7eb !important;
			backdrop-filter: none !important;
		}

		/* Ensure proper page layout */
		:global(body) {
			background: white !important;
		}
	}
</style>