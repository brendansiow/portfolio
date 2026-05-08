<script lang="ts">
	import { onMount } from 'svelte';
	import Button from '$lib/components/ui/button.svelte';
	import { Download } from 'lucide-svelte';

	let html2pdf = $state<any>(null);
	let isGenerating = $state(false);

	onMount(async () => {
		const { default: html2pdfLib } = await import('html2pdf.js');
		html2pdf = html2pdfLib;
	});

	async function downloadResume() {
		if (!html2pdf) {
			alert('PDF generator still loading. Please try again in a moment.');
			return;
		}

		isGenerating = true;

		try {
			const element = document.getElementById('portfolio-content');
			if (!element) {
				throw new Error('Portfolio content not found');
			}

			const clonedElement = element.cloneNode(true) as HTMLElement;

			clonedElement
				.querySelectorAll('nav, .fixed, button, [role="button"]')
				.forEach((el) => el.remove());

			clonedElement.style.position = 'relative';
			clonedElement.style.width = '100%';
			clonedElement.style.maxWidth = '210mm';
			clonedElement.style.margin = '0';
			clonedElement.style.padding = '20px';
			clonedElement.style.background = 'white';
			clonedElement.style.color = 'black';

			const allElements = clonedElement.querySelectorAll('*');
			allElements.forEach((el: any) => {
				if (el.style) {
					el.style.position = el.style.position === 'fixed' ? 'static' : el.style.position;
					el.style.transform = 'none';
					el.style.animation = 'none';
					el.style.backdropFilter = 'none';
					el.style.backgroundAttachment = 'scroll';

					if (
						el.style.color &&
						(el.style.color.includes('white') || el.style.color.includes('transparent'))
					) {
						el.style.color = 'black';
					}
				}
			});

			document.body.appendChild(clonedElement);

			const options = {
				margin: [10, 10, 10, 10],
				filename: 'resume.pdf',
				image: {
					type: 'jpeg',
					quality: 0.95
				},
				html2canvas: {
					scale: 1,
					useCORS: true,
					allowTaint: false,
					letterRendering: true,
					width: 794,
					height: undefined,
					scrollX: 0,
					scrollY: 0
				},
				jsPDF: {
					unit: 'mm',
					format: 'a4',
					orientation: 'portrait',
					putOnlyUsedFonts: true,
					floatPrecision: 16
				},
				pagebreak: {
					mode: ['avoid-all', 'css', 'legacy'],
					before: '.page-break-before',
					after: '.page-break-after',
					avoid: ['img', 'table', 'tr', 'td', 'th']
				}
			};

			await html2pdf().set(options).from(clonedElement).save();

			document.body.removeChild(clonedElement);
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
		disabled={isGenerating || !html2pdf}
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

<style>
	@media print {
		:global(.fixed),
		:global(nav),
		:global(footer),
		:global(button),
		:global([role='button']) {
			display: none !important;
		}

		:global(.page-break-before) {
			page-break-before: always;
		}

		:global(.page-break-after) {
			page-break-after: always;
		}

		:global(section) {
			page-break-inside: avoid;
			margin-bottom: 1.5rem !important;
			padding: 0.5rem 0 !important;
		}

		:global(.py-20) {
			padding-top: 1rem !important;
			padding-bottom: 1rem !important;
		}

		:global(.text-white),
		:global(.text-white\/80),
		:global(.text-white\/70),
		:global(.text-blue-200),
		:global(.text-blue-300) {
			color: #000 !important;
		}

		:global(.glass),
		:global(.glass-strong) {
			background: rgba(255, 255, 255, 0.9) !important;
			border: 1px solid #e5e7eb !important;
			backdrop-filter: none !important;
		}

		:global(body) {
			background: white !important;
			font-size: 12pt !important;
			line-height: 1.4 !important;
		}

		:global(*) {
			animation: none !important;
			transform: none !important;
			transition: none !important;
		}

		:global(img) {
			max-width: 100% !important;
			height: auto !important;
		}

		:global(ul),
		:global(ol) {
			page-break-inside: avoid;
		}

		:global(li) {
			page-break-inside: avoid;
			margin-bottom: 0.25rem !important;
		}
	}

	:global(.pdf-optimized) {
		font-size: 14px;
		line-height: 1.5;
		color: #000;
		background: #fff;
	}
</style>
