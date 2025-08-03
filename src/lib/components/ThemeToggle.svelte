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
	class="fixed top-4 right-4 z-50 bg-white/80 dark:bg-slate-800/80 backdrop-blur-sm border border-gray-200 dark:border-gray-700 hover:bg-gray-100 dark:hover:bg-slate-700"
	aria-label="Toggle theme"
>
	{#if $theme === 'light'}
		<Moon class="h-4 w-4" />
	{:else}
		<Sun class="h-4 w-4" />
	{/if}
</Button>