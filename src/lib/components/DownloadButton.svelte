<script lang="ts">
	import { onMount } from 'svelte';
	import Button from '$lib/components/ui/button.svelte';
	import { Download } from 'lucide-svelte';

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

			// Clone the element to avoid modifying the original
			const clonedElement = element.cloneNode(true) as HTMLElement;
			
			// Remove elements that shouldn't be in PDF
			clonedElement.querySelectorAll('nav, .fixed, button, [role="button"]').forEach(el => el.remove());
			
			// Add PDF-specific styling
			clonedElement.style.position = 'relative';
			clonedElement.style.width = '100%';
			clonedElement.style.maxWidth = '210mm'; // A4 width
			clonedElement.style.margin = '0';
			clonedElement.style.padding = '20px';
			clonedElement.style.background = 'white';
			clonedElement.style.color = 'black';
			
			// Apply print-friendly styles to all children
			const allElements = clonedElement.querySelectorAll('*');
			allElements.forEach((el: any) => {
				if (el.style) {
					// Remove problematic styles
					el.style.position = el.style.position === 'fixed' ? 'static' : el.style.position;
					el.style.transform = 'none';
					el.style.animation = 'none';
					el.style.backdropFilter = 'none';
					el.style.backgroundAttachment = 'scroll';
					
					// Ensure text is readable
					if (el.style.color && (el.style.color.includes('white') || el.style.color.includes('transparent'))) {
						el.style.color = 'black';
					}
				}
			});

			// Temporarily add the cloned element to the document
			document.body.appendChild(clonedElement);

			// Configure PDF options with better settings
			const options = {
				margin: [10, 10, 10, 10], // [top, left, bottom, right] in mm
				filename: 'resume.pdf',
				image: { 
					type: 'jpeg', 
					quality: 0.95 
				},
				html2canvas: { 
					scale: 1, // Reduced scale for better performance
					useCORS: true,
					allowTaint: false,
					letterRendering: true,
					width: 794, // A4 width in pixels at 96dpi
					height: undefined, // Let it auto-calculate height
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

			// Generate and download PDF
			await html2pdf().set(options).from(clonedElement).save();
			
			// Remove the cloned element
			document.body.removeChild(clonedElement);
			
		} catch (error) {
			console.error('Error generating PDF:', error);
			alert('Failed to generate PDF. Please try again.');
		} finally {
			isGenerating = false;
		}
	}
</script>

<!-- Floating Download Button using shadcn-svelte Button -->
<div class="fixed bottom-8 right-8 z-50">
	<Button
		onclick={downloadResume}
		disabled={isGenerating || !html2pdf}
		class="group bg-primary text-primary-foreground shadow-2xl hover:bg-primary/90 transition-all duration-300 disabled:opacity-50 disabled:cursor-not-allowed h-12 w-12 rounded-full p-0"
		aria-label="Download Resume as PDF"
	>
		{#if isGenerating}
			<div class="w-5 h-5 animate-spin border-2 border-white border-t-transparent rounded-full"></div>
		{:else}
			<Download class="w-5 h-5 group-hover:scale-110 transition-transform duration-300" />
		{/if}
	</Button>

	<!-- Tooltip -->
	<div class="absolute bottom-full right-0 mb-2 opacity-0 group-hover:opacity-100 transition-opacity duration-300 pointer-events-none">
		<div class="bg-popover text-popover-foreground px-3 py-2 rounded-lg text-sm whitespace-nowrap border shadow-lg">
			{isGenerating ? 'Generating PDF...' : 'Download Resume'}
			<div class="absolute top-full right-4 w-0 h-0 border-l-4 border-r-4 border-t-4 border-transparent border-t-border"></div>
		</div>
	</div>
</div>

<!-- Enhanced Print Styles -->
<style>
	@media print {
		/* Hide elements that shouldn't appear in PDF */
		:global(.fixed),
		:global(nav),
		:global(footer),
		:global(button),
		:global([role="button"]) {
			display: none !important;
		}

		/* Page breaks */
		:global(.page-break-before) {
			page-break-before: always;
		}
		
		:global(.page-break-after) {
			page-break-after: always;
		}

		/* Optimize spacing for print */
		:global(section) {
			page-break-inside: avoid;
			margin-bottom: 1.5rem !important;
			padding: 0.5rem 0 !important;
		}

		:global(.py-20) {
			padding-top: 1rem !important;
			padding-bottom: 1rem !important;
		}

		/* Ensure text is readable */
		:global(.text-white),
		:global(.text-white\/80),
		:global(.text-white\/70),
		:global(.text-blue-200),
		:global(.text-blue-300) {
			color: #000 !important;
		}

		/* Simplify glass effects for print */
		:global(.glass),
		:global(.glass-dark) {
			background: rgba(255, 255, 255, 0.9) !important;
			border: 1px solid #e5e7eb !important;
			backdrop-filter: none !important;
		}

		/* Ensure proper page layout */
		:global(body) {
			background: white !important;
			font-size: 12pt !important;
			line-height: 1.4 !important;
		}

		/* Remove animations and transforms */
		:global(*) {
			animation: none !important;
			transform: none !important;
			transition: none !important;
		}

		/* Optimize images */
		:global(img) {
			max-width: 100% !important;
			height: auto !important;
		}

		/* Better spacing for lists */
		:global(ul), :global(ol) {
			page-break-inside: avoid;
		}

		:global(li) {
			page-break-inside: avoid;
			margin-bottom: 0.25rem !important;
		}
	}

	/* PDF-specific optimizations */
	:global(.pdf-optimized) {
		font-size: 14px;
		line-height: 1.5;
		color: #000;
		background: #fff;
	}
</style>