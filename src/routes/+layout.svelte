<script lang="ts">
	import '../app.css';
	import { portfolioData } from '$lib/data';
	import mapleMono from '$lib/assets/fonts/MapleMono-Regular.woff2';
	import favicon from '$lib/assets/favicon.svg';
	let { children } = $props();
</script>

<svelte:head>
	<link rel="preload" href={mapleMono} as="font" type="font/woff2" crossorigin="anonymous" />
	<link rel="icon" href={favicon} />
	<title>{portfolioData.personalInfo.name} · {portfolioData.personalInfo.title}</title>
	<meta name="description" content={portfolioData.personalInfo.heroSummary} />
</svelte:head>
<a class="skip-link" href="#content">Skip to content</a>
<main id="content" tabindex="-1">{@render children?.()}</main>
