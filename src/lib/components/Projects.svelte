<script lang="ts">
	import type { Project } from '$lib/types';
	import { ExternalLink, Github, Building } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';
	import Badge from '$lib/components/ui/badge.svelte';
	import Button from '$lib/components/ui/button.svelte';

	interface Props {
		data: Project[];
	}

	let { data }: Props = $props();

	const featuredProjects = $derived(data.filter(project => project.featured));
	const otherProjects = $derived(data.filter(project => !project.featured));
</script>

<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
	<div class="text-center mb-16">
		<h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Featured Projects</h2>
		<div class="w-24 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
	</div>

	<!-- Featured Projects -->
	<div class="grid md:grid-cols-2 lg:grid-cols-2 gap-8 mb-16">
		{#each featuredProjects as project}
			<Card class="glass border-white/30 group hover:bg-white/15 transition-all duration-300">
				<CardContent class="p-6 md:p-8">
					{#snippet children()}
						<!-- Project Image -->
						{#if project.imageUrl}
							<div class="mb-6 rounded-lg overflow-hidden">
								<img 
									src={project.imageUrl} 
									alt={project.title}
									class="w-full h-48 object-cover group-hover:scale-105 transition-transform duration-300"
								/>
							</div>
						{:else}
							<div class="mb-6 h-48 bg-gradient-to-br from-blue-400/20 to-purple-600/20 rounded-lg flex items-center justify-center">
								<Building class="w-16 h-16 text-white/50" />
							</div>
						{/if}

						<!-- Project Info -->
						<h3 class="text-xl md:text-2xl font-bold text-white mb-3">{project.title}</h3>
						<p class="text-white/80 mb-6 leading-relaxed">{project.description}</p>

						<!-- Technologies -->
						<div class="mb-6">
							<div class="flex flex-wrap gap-2">
								{#each project.technologies as tech}
									<Badge variant="secondary" class="bg-white/10 border-white/20 text-white/90">
										{tech}
									</Badge>
								{/each}
							</div>
						</div>

						<!-- Project Links -->
						<div class="flex space-x-4">
							{#if project.liveUrl}
								<Button
									href={project.liveUrl}
									target="_blank"
									rel="noopener noreferrer"
									class="bg-gradient-to-r from-blue-500 to-purple-600 hover:from-blue-600 hover:to-purple-700"
								>
									{#snippet children()}
										<ExternalLink class="w-4 h-4 mr-2" />
										Live Demo
									{/snippet}
								</Button>
							{/if}

							{#if project.githubUrl}
								<Button
									variant="outline"
									href={project.githubUrl}
									target="_blank"
									rel="noopener noreferrer"
									class="border-white/30 text-white hover:bg-white/10"
								>
									{#snippet children()}
										<Github class="w-4 h-4 mr-2" />
										Code
									{/snippet}
								</Button>
							{/if}
						</div>
					{/snippet}
				</CardContent>
			</Card>
		{/each}
	</div>

	<!-- Other Projects -->
	{#if otherProjects.length > 0}
		<div class="text-center mb-12">
			<h3 class="text-2xl md:text-3xl font-bold text-white mb-4">Other Projects</h3>
			<div class="w-16 h-0.5 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
		</div>

		<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
			{#each otherProjects as project}
				<div class="glass p-6 rounded-xl group hover:bg-white/15 transition-all duration-300">
					<h4 class="text-lg font-bold text-white mb-3">{project.title}</h4>
					<p class="text-white/80 mb-4 text-sm leading-relaxed">{project.description}</p>

					<!-- Technologies -->
					<div class="mb-4">
						<div class="flex flex-wrap gap-1">
							{#each project.technologies.slice(0, 3) as tech}
								<Badge variant="secondary" class="bg-white/10 border-white/20 text-white/90 text-xs">
									{tech}
								</Badge>
							{/each}
							{#if project.technologies.length > 3}
								<span class="px-2 py-1 text-white/70 text-xs">+{project.technologies.length - 3} more</span>
							{/if}
						</div>
					</div>

					<!-- Project Links -->
					<div class="flex space-x-3">
						{#if project.liveUrl}
							<a 
								href={project.liveUrl} 
								target="_blank" 
								rel="noopener noreferrer"
								class="text-blue-400 hover:text-blue-300 transition-colors"
								aria-label="View live demo of {project.title}"
							>
								<ExternalLink class="w-5 h-5" />
							</a>
						{/if}

						{#if project.githubUrl}
							<a 
								href={project.githubUrl} 
								target="_blank" 
								rel="noopener noreferrer"
								class="text-white/70 hover:text-white transition-colors"
								aria-label="View source code for {project.title} on GitHub"
							>
								<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 24 24">
									<path d="M12 0c-6.626 0-12 5.373-12 12 0 5.302 3.438 9.8 8.207 11.387.599.111.793-.261.793-.577v-2.234c-3.338.726-4.033-1.416-4.033-1.416-.546-1.387-1.333-1.756-1.333-1.756-1.089-.745.083-.729.083-.729 1.205.084 1.839 1.237 1.839 1.237 1.07 1.834 2.807 1.304 3.492.997.107-.775.418-1.305.762-1.604-2.665-.305-5.467-1.334-5.467-5.931 0-1.311.469-2.381 1.236-3.221-.124-.303-.535-1.524.117-3.176 0 0 1.008-.322 3.301 1.23.957-.266 1.983-.399 3.003-.404 1.02.005 2.047.138 3.006.404 2.291-1.552 3.297-1.23 3.297-1.23.653 1.653.242 2.874.118 3.176.77.84 1.235 1.911 1.235 3.221 0 4.609-2.807 5.624-5.479 5.921.43.372.823 1.102.823 2.222v3.293c0 .319.192.694.801.576 4.765-1.589 8.199-6.086 8.199-11.386 0-6.627-5.373-12-12-12z"/>
								</svg>
							</a>
						{/if}
					</div>
				</div>
			{/each}
		</div>
	{/if}
</div>