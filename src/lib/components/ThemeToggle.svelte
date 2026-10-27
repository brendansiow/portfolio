<script lang="ts">
	import { onMount } from 'svelte';
	import { theme } from '$lib/theme';
	import { Sun, Moon } from 'lucide-svelte';
	onMount(() => theme.init());
</script>

<button
	class="theme"
	type="button"
	onclick={theme.toggle}
	aria-label="Toggle theme"
	aria-pressed={$theme === 'dark'}
	title={$theme === 'dark' ? 'Switch to light mode' : 'Switch to dark mode'}
>
	{#if $theme === 'dark'}<Sun aria-hidden="true" />{:else}<Moon aria-hidden="true" />{/if}
</button>
