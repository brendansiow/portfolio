<script lang="ts">
	import ResumePDF from '$lib/components/ResumePDF.svelte';
	import { ArrowLeft, Printer } from 'lucide-svelte';

	function printResume() {
		window.print();
	}
</script>

<svelte:head>
	<title>Résumé · Brendan Siow</title>
	<meta name="description" content="Résumé — Brendan Siow, Senior Software Engineer" />
</svelte:head>

<div class="resume-page">
	<div class="resume-toolbar">
		<a href="/" class="tool-link">
			<ArrowLeft class="h-4 w-4" />
			<span>Back to site</span>
		</a>
		<button onclick={printResume} class="tool-link tool-print">
			<Printer class="h-4 w-4" />
			<span>Print / Save PDF</span>
		</button>
	</div>

	<div class="resume-wrap">
		<ResumePDF />
	</div>
</div>

<style>
	.resume-page {
		min-height: 100vh;
		padding: 1.5rem 1rem 4rem;
	}

	.resume-toolbar {
		width: min(820px, 100%);
		margin: 0 auto 1.25rem;
		display: flex;
		justify-content: space-between;
		align-items: center;
		gap: 1rem;
	}

	.tool-link {
		display: inline-flex;
		align-items: center;
		gap: 0.4rem;
		padding: 0.5rem 0.95rem;
		border-radius: 999px;
		font-size: 0.82rem;
		font-weight: 600;
		color: var(--text);
		background: rgba(255, 255, 255, 0.45);
		border: 0.5px solid rgba(160, 200, 255, 0.45);
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.6);
		backdrop-filter: blur(12px);
		text-decoration: none;
		cursor: pointer;
		transition: background 0.2s;
	}

	.tool-link:hover {
		background: rgba(255, 255, 255, 0.65);
	}

	:global(.dark) .tool-link {
		color: var(--text);
		background: rgba(30, 42, 65, 0.5);
		border-color: rgba(100, 140, 200, 0.25);
		box-shadow: inset 0 1px 0 rgba(255, 255, 255, 0.06);
	}

	:global(.dark) .tool-link:hover {
		background: rgba(40, 55, 85, 0.6);
	}

	.resume-wrap {
		width: min(820px, 100%);
		margin: 0 auto;
		border-radius: 1.6rem;
		overflow: hidden;
		box-shadow: 0 24px 70px rgba(15, 23, 42, 0.12);
	}

	:global(.dark) .resume-wrap {
		box-shadow: 0 24px 70px rgba(2, 6, 23, 0.5);
	}

	@media print {
		.resume-page {
			padding: 0;
		}
		.resume-toolbar,
		.resume-wrap {
			margin: 0;
			width: 100%;
			max-width: none;
			border-radius: 0;
			box-shadow: none;
			overflow: visible;
		}
		.resume-toolbar {
			display: none;
		}
	}
</style>