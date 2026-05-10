<script lang="ts">
	import { onMount } from 'svelte';
	import Button from '$lib/components/ui/button.svelte';
	import { Download } from 'lucide-svelte';
	import { toPng } from 'html-to-image';
	import { jsPDF } from 'jspdf';

	let isGenerating = $state(false);

	async function downloadResume() {
		isGenerating = true;

		try {
			const element = document.getElementById('portfolio-content');
			if (!element) {
				throw new Error('Portfolio content not found');
			}

			const clonedElement = element.cloneNode(true) as HTMLElement;

			// Strip interactive elements
			clonedElement.querySelectorAll('nav, .fixed, button, [role="button"]').forEach((el) => el.remove());

			// Inline computed styles and strip classes to avoid oklch parsing issues
			const originalElements = element.querySelectorAll('*');
			const cloneElements = clonedElement.querySelectorAll('*');
			cloneElements.forEach((cloneEl, i) => {
				const origEl = originalElements[i];
				if (!origEl) return;
				const computed = window.getComputedStyle(origEl);
				const style = (cloneEl as HTMLElement).style;

				// Inline key layout and visual properties
				const props = [
					'color',
					'backgroundColor',
					'backgroundImage',
					'border',
					'borderTop',
					'borderRight',
					'borderBottom',
					'borderLeft',
					'borderRadius',
					'padding',
					'margin',
					'fontFamily',
					'fontSize',
					'fontWeight',
					'lineHeight',
					'textAlign',
					'display',
					'flexDirection',
					'alignItems',
					'justifyContent',
					'gap',
					'width',
					'maxWidth',
					'position',
					'top',
					'left',
					'right',
					'bottom',
					'boxShadow'
				];
				props.forEach((prop) => {
					const val = computed.getPropertyValue(prop);
					if (val) {
						try {
							style.setProperty(prop, val, 'important');
						} catch {
							// ignore unsupported props
						}
					}
				});

				style.transform = 'none';
				style.animation = 'none';
				style.backdropFilter = 'none';
				style.backgroundAttachment = 'scroll';
				style.transition = 'none';

				// Remove class names so html-to-image doesn't re-apply oklch styles
				cloneEl.removeAttribute('class');
			});

			clonedElement.style.position = 'relative';
			clonedElement.style.width = '794px';
			clonedElement.style.margin = '0';
			clonedElement.style.padding = '20px';
			clonedElement.style.background = 'white';
			clonedElement.style.color = '#0f172a';
			clonedElement.style.fontFamily = "'Plus Jakarta Sans', sans-serif";
			clonedElement.className = '';

			document.body.appendChild(clonedElement);

			// Capture as PNG using html-to-image (supports modern CSS natively)
			const dataUrl = await toPng(clonedElement, {
				pixelRatio: 2,
				width: 794,
				style: {
					margin: '0',
					padding: '20px'
				}
			});

			document.body.removeChild(clonedElement);

			// Create PDF from image
			const img = new Image();
			img.src = dataUrl;
			await new Promise((resolve) => (img.onload = resolve));

			const pdf = new jsPDF({
				unit: 'px',
				format: [794, img.height * (794 / img.width)],
				orientation: 'portrait',
				putOnlyUsedFonts: true
			});

			pdf.addImage(dataUrl, 'PNG', 0, 0, 794, img.height * (794 / img.width));
			pdf.save('brendan-siow-resume.pdf');
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
