<script lang="ts">
	import Button from '$lib/components/ui/button.svelte';
	import { Download } from 'lucide-svelte';

	let isGenerating = $state(false);

	function downloadResume() {
		isGenerating = true;

		// Small delay to show spinner before print dialog opens
		requestAnimationFrame(() => {
			requestAnimationFrame(() => {
				window.print();
				isGenerating = false;
			});
		});
	}
</script>

<div class="fixed bottom-5 right-5 z-50">
	<Button
		onclick={downloadResume}
		class="glass h-11 w-11 rounded-full border-white/25 p-0 text-slate-700 transition hover:bg-white/60 dark:border-slate-700/40 dark:text-slate-100 dark:hover:bg-slate-800/60"
		aria-label="Download Resume as PDF"
		title={isGenerating ? 'Opening print dialog...' : 'Download resume'}
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
