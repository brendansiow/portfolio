<script lang="ts">
	import { base } from '$app/paths';
	import { theme } from '$lib/theme';
	let {
		src,
		darkSrc,
		alt = '',
		loading = 'lazy'
	}: { src: string; darkSrc?: string; alt?: string; loading?: 'lazy' | 'eager' } = $props();
	// The iFAST asset is a reverse wordmark. Use a black silhouette on light surfaces.
	const reverse = $derived(src.endsWith('ifast-wordmark-sharp.png'));
</script>

<img
	class="company-logo"
	class:reverse-logo={reverse}
	class:monochrome-star={src.endsWith('mercedes-benz-symbol.png')}
	src={`${base}/${$theme === 'dark' && darkSrc ? darkSrc : src}`}
	{alt}
	{loading}
/>

<style>
	.company-logo {
		display: block;
		width: 100%;
		height: 100%;
		object-fit: contain;
		border: 0;
		border-radius: 0;
		background: none;
		box-shadow: none;
	}
	.reverse-logo {
		filter: brightness(0);
	}
	:global(.dark) .monochrome-star {
		filter: invert(1);
	}
	:global(.dark) .reverse-logo {
		filter: none;
	}
</style>
