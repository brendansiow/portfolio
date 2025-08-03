<script lang="ts">
	import '../app.css';
	import favicon from '$lib/assets/favicon.svg';
	import ThemeToggle from '$lib/components/ThemeToggle.svelte';

	let { children } = $props();
</script>

<svelte:head>
	<link rel="icon" href={favicon} />
	<title>Portfolio - Professional Web Developer</title>
	<meta name="description" content="A portfolio showcasing web development skills and projects" />
</svelte:head>

<ThemeToggle />

<main class="min-h-screen">
	{@render children?.()}
</main>
