<script lang="ts">
	import CompanyLogo from '$lib/components/CompanyLogo.svelte';
	import type { Project } from '$lib/types';
	import { ArrowUpRight } from 'lucide-svelte';
	let { data }: { data: Project[] } = $props();
	const featured = $derived(data.filter((project) => project.featured));
	const others = $derived(data.filter((project) => !project.featured));
</script>

<div class="shell section">
	<div class="section-head">
		<div>
			<span class="eyebrow">01 / Selected work</span>
			<h2>Software for real-world problems.</h2>
		</div>
	</div>
	<div class="case-grid">
		{#each featured as project (project.id)}
			<article class="case-card glass">
				<div class="case-top">
					{#if project.logoUrl}
						<div class="case-logo" aria-hidden="true">
							<CompanyLogo src={project.logoUrl} darkSrc={project.logoDarkUrl} />
						</div>
					{/if}
				</div>
				<h3>{project.title}</h3>
				<p class="case-description">{project.description}</p>
				<div class="case-bottom">
					{#if project.technologies.length}<div class="work-tags">
							{#each project.technologies as tech (tech)}<span>{tech}</span>{/each}
						</div>{/if}
					{#if project.liveUrl}<a
							class="case-link"
							href={project.liveUrl}
							target="_blank"
							rel="noopener noreferrer"
							>Company website <ArrowUpRight size={16} aria-hidden="true" /></a
						>{/if}
				</div>
			</article>
		{/each}
	</div>

	<div class="more-work">
		{#each others as project (project.id)}<article class="project-note">
				<h3>{project.title}</h3>
				<p>{project.description}</p>
				{#if project.technologies.length}<div class="work-tags">
						{#each project.technologies as tech (tech)}<span>{tech}</span>{/each}
					</div>{/if}
				<div class="project-links">
					{#if project.githubUrl}<a
							href={project.githubUrl}
							target="_blank"
							rel="noopener noreferrer">Source code ↗</a
						>{/if}{#if project.storeUrl}<a
							href={project.storeUrl}
							target="_blank"
							rel="noopener noreferrer">Google Play ↗</a
						>{/if}
				</div>
			</article>{/each}
	</div>
</div>
