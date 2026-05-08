<script lang="ts">
	import { onMount } from 'svelte';
	import { theme } from '$lib/theme.js';
	import Button from '$lib/components/ui/button.svelte';
	import { Sun, Moon } from 'lucide-svelte';

	onMount(() => {
		theme.init();
	});
</script>

<Button
	variant="ghost"
	size="icon"
	onclick={theme.toggle}
	class="glass fixed right-5 top-5 z-50 border-white/25 text-slate-700 hover:bg-white/50 dark:border-slate-700/40 dark:text-slate-200 dark:hover:bg-slate-800/50"
	aria-label="Toggle theme"
>
	{#if $theme === 'light'}
		<Moon class="h-4 w-4" />
	{:else}
		<Sun class="h-4 w-4" />
	{/if}
</Button>
