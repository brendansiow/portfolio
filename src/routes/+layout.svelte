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

<div class="relative min-h-screen overflow-x-clip">
	<div class="mesh-gradient" aria-hidden="true">
		<div class="mesh-blob mesh-blob-1"></div>
		<div class="mesh-blob mesh-blob-2"></div>
		<div class="mesh-blob mesh-blob-3"></div>
		<div class="mesh-blob mesh-blob-4"></div>
	</div>

	<ThemeToggle />
	<main>
		{@render children?.()}
	</main>
</div>
