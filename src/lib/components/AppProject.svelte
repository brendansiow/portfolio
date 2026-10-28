<script lang="ts">
	import type { Project } from '$lib/types';
	import ScreenshotGallery from '$lib/components/ScreenshotGallery.svelte';
	let { project }: { project: Project } = $props();
</script>

<article class="app-project glass" aria-label={project.title}>
	<div class="app-project-summary">
		<h3>{project.title}</h3>
		<p>{project.description}</p>
		<div class="work-tags">
			{#each project.technologies as technology (technology)}<span>{technology}</span>{/each}
		</div>
	</div>
	<div class="app-project-galleries" class:multiple-apps={(project.apps?.length || 0) > 1}>
		{#each project.apps || [] as app (app.storeUrl)}<ScreenshotGallery {app} />{/each}
	</div>
</article>
