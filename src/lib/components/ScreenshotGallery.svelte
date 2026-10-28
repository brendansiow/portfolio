<script lang="ts">
	import { onMount } from 'svelte';
	import { base } from '$app/paths';
	import { ArrowLeft, ArrowRight, ArrowUpRight } from 'lucide-svelte';
	import type { ProjectApp } from '$lib/types';
	let { app }: { app: ProjectApp } = $props();
	let strip: HTMLUListElement;
	let hasOverflow = $state(false);
	let atStart = $state(true);
	let atEnd = $state(false);
	function update() {
		hasOverflow = strip.scrollWidth > strip.clientWidth + 2;
		atStart = strip.scrollLeft <= 2;
		atEnd = strip.scrollLeft + strip.clientWidth >= strip.scrollWidth - 2;
	}
	onMount(() => {
		const observer = new ResizeObserver(update);
		observer.observe(strip);
		update();
		return () => observer.disconnect();
	});
	function move(direction: number) {
		strip.scrollBy({
			left: direction * strip.clientWidth * 0.8,
			behavior: matchMedia('(prefers-reduced-motion: reduce)').matches ? 'instant' : 'smooth'
		});
	}
</script>

<section class="screenshot-gallery" aria-label={`${app.name} app preview`}>
	<div class="app-gallery-heading">
		<h4>{app.name}</h4>
		<a
			href={app.storeUrl}
			target="_blank"
			rel="noopener noreferrer"
			aria-label={`${app.name} on Google Play (opens in a new tab)`}
			>Google Play <ArrowUpRight size={16} aria-hidden="true" /></a
		>
	</div>
	<ul
		class="app-screenshots"
		bind:this={strip}
		onscroll={update}
		aria-label={`${app.name} screenshots`}
	>
		{#each app.screenshots as screen (screen.src)}
			<li>
				<a
					class="app-screenshot"
					href={`${base}/${screen.src}`}
					target="_blank"
					rel="noopener noreferrer"
					aria-label={`View ${screen.alt} full size (opens in a new tab)`}
					style:width={`calc(var(--screen-height) * ${screen.width / screen.height})`}
				>
					<img
						src={`${base}/${screen.src}`}
						alt={screen.alt}
						width={screen.width}
						height={screen.height}
						loading="lazy"
						decoding="async"
					/>
				</a>
			</li>
		{/each}
	</ul>
	<div class="app-gallery-footer">
		<p>Current Google Play previews</p>
		{#if hasOverflow}
			<div class="gallery-controls">
				<button
					type="button"
					onclick={() => move(-1)}
					disabled={atStart}
					aria-label={`Previous screenshots for ${app.name}`}
					><ArrowLeft size={18} aria-hidden="true" /></button
				>
				<button
					type="button"
					onclick={() => move(1)}
					disabled={atEnd}
					aria-label={`Next screenshots for ${app.name}`}
					><ArrowRight size={18} aria-hidden="true" /></button
				>
			</div>
		{/if}
	</div>
</section>
