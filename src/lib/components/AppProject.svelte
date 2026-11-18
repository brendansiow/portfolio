<script lang="ts">
	import type { Project } from '$lib/types';
	import ScreenshotGallery from '$lib/components/ScreenshotGallery.svelte';
	import TechnologyLogos from '$lib/components/TechnologyLogos.svelte';
	let { project }: { project: Project } = $props();
</script>

<article class="app-project glass" aria-label={project.title}>
	<div class="app-project-summary">
		<h3>{project.title}</h3>
		<p>{project.description}</p>
		<TechnologyLogos technologies={project.technologies} />
	</div>
	<div class="app-project-galleries" class:multiple-apps={(project.apps?.length || 0) > 1}>
		{#each project.apps || [] as app (app.storeUrl || app.liveUrl)}<ScreenshotGallery
				{app}
			/>{/each}
	</div>
</article>
