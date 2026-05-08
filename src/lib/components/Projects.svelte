<script lang="ts">
	import type { Project } from '$lib/types';
	import { ArrowUpRight, Github, Sparkles, Smartphone } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';
	import Badge from '$lib/components/ui/badge.svelte';
	import Button from '$lib/components/ui/button.svelte';

	interface Props {
		data: Project[];
	}

	let { data }: Props = $props();

	const featuredProjects = $derived(data.filter((project) => project.featured));
	const moreProjects = $derived(data.filter((project) => !project.featured));
</script>

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">Selected Work</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">Selected product work</h2>
		<p
			class="mx-auto mt-4 max-w-2xl text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base"
		>
			A few representative projects across platform engineering, payments, and fintech delivery.
		</p>
	</div>

	<!-- Featured projects bento -->
	<div class="grid gap-4 md:grid-cols-3">
		{#each featuredProjects as project, index (project.id)}
			<Card
				class="glass-strong h-full overflow-hidden rounded-[1.75rem] border-white/30 {index === 0
					? 'md:col-span-2 md:row-span-2'
					: 'md:row-span-1'}"
			>
				<CardContent class="flex h-full flex-col p-0">
					<div class="border-b border-white/25 p-5 dark:border-slate-700/40 md:p-6">
						<div class="flex items-start justify-between gap-4">
							<div class="flex items-start gap-3">
								{#if project.logoUrl}
									<div
										class="hidden h-10 w-10 shrink-0 items-center justify-center overflow-hidden rounded-2xl border border-white/40 bg-white/70 p-2 shadow-sm md:flex dark:border-slate-700/50 dark:bg-slate-900/60"
									>
										<img
											src={project.logoUrl}
											alt={project.title}
											class="h-full w-full object-contain"
										/>
									</div>
								{/if}
								<div>
									<div class="mb-2 flex items-center gap-2">
										<Badge variant="secondary">Featured</Badge>
										{#if index === 0}
											<Badge variant="outline">Primary</Badge>
										{/if}
									</div>
									<h3
										class="text-xl font-semibold tracking-tight text-slate-900 dark:text-slate-100 md:text-2xl"
									>
										{project.title}
									</h3>
								</div>
							</div>
							<div
								class="hidden rounded-2xl border border-white/40 bg-white/35 p-2.5 text-slate-700 shadow-[0_8px_24px_rgba(15,23,42,0.06)] backdrop-blur md:block dark:border-slate-700/50 dark:bg-slate-900/45 dark:text-slate-100"
							>
								<Sparkles class="h-4 w-4" />
							</div>
						</div>
						<p class="mt-3 text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base">
							{project.description}
						</p>
					</div>

					<div class="flex flex-1 flex-col gap-4 p-5 md:p-6">
						<div
							class="rounded-[1.5rem] border border-white/30 bg-white/40 p-4 dark:border-slate-700/45 dark:bg-slate-900/40"
						>
							<div class="flex items-center gap-3">
								{#if project.logoUrl}
									<div
										class="flex h-9 w-9 items-center justify-center overflow-hidden rounded-2xl border border-white/40 bg-white/75 p-1.5 dark:border-slate-700/50 dark:bg-slate-950/60"
									>
										<img
											src={project.logoUrl}
											alt={project.title}
											class="h-full w-full object-contain"
										/>
									</div>
								{/if}
								<div>
									<p class="text-xs font-medium text-slate-500 dark:text-slate-400">
										Project context
									</p>
									<p class="mt-0.5 text-xs text-slate-700 dark:text-slate-200">
										Production-facing engineering with real users and delivery constraints.
									</p>
								</div>
							</div>
							<p class="mt-3 text-xs font-medium text-slate-500 dark:text-slate-400">Tech stack</p>
							<div class="mt-2 flex flex-wrap gap-2">
								{#each project.technologies as tech (tech)}
									<Badge variant="outline">{tech}</Badge>
								{/each}
							</div>
						</div>

						<div class="mt-auto flex flex-wrap gap-3">
							{#if project.liveUrl}
								<Button href={project.liveUrl} target="_blank" rel="noopener noreferrer">
									{#snippet children()}
										View product
										<ArrowUpRight class="ml-2 h-4 w-4" />
									{/snippet}
								</Button>
							{/if}
							{#if project.storeUrl}
								<Button
									variant="outline"
									href={project.storeUrl}
									target="_blank"
									rel="noopener noreferrer"
								>
									{#snippet children()}
										<Smartphone class="mr-2 h-4 w-4" />
										Play Store
									{/snippet}
								</Button>
							{/if}
							{#if project.githubUrl}
								<Button
									variant="outline"
									href={project.githubUrl}
									target="_blank"
									rel="noopener noreferrer"
								>
									{#snippet children()}
										<Github class="mr-2 h-4 w-4" />
										Source
									{/snippet}
								</Button>
							{/if}
						</div>
					</div>
				</CardContent>
			</Card>
		{/each}
	</div>

	{#if moreProjects.length > 0}
		<div class="mt-4 grid gap-4 md:grid-cols-2 xl:grid-cols-4">
			{#each moreProjects as project (project.id)}
				<Card class="glass rounded-[1.5rem] border-white/30">
					<CardContent class="flex h-full flex-col p-5 pt-5">
						<div class="flex items-start justify-between gap-4">
							<h3 class="text-lg font-semibold text-slate-900 dark:text-slate-100">
								{project.title}
							</h3>
							<div
								class="rounded-xl bg-white/45 p-2 text-slate-700 dark:bg-slate-800/60 dark:text-slate-100"
							>
								<ArrowUpRight class="h-4 w-4" />
							</div>
						</div>
						<p class="mt-2 flex-1 text-sm leading-7 text-slate-600 dark:text-slate-300">
							{project.description}
						</p>
						<div class="mt-4 flex flex-wrap gap-2">
							{#each project.technologies as tech (tech)}
								<Badge>{tech}</Badge>
							{/each}
						</div>
						<div class="mt-4 flex flex-wrap gap-3">
							{#if project.liveUrl}
								<a
									href={project.liveUrl}
									target="_blank"
									rel="noopener noreferrer"
									class="text-sm font-medium text-slate-700 hover:text-slate-900 dark:text-slate-200 dark:hover:text-white"
								>
									View product
								</a>
							{/if}
							{#if project.storeUrl}
								<a
									href={project.storeUrl}
									target="_blank"
									rel="noopener noreferrer"
									class="inline-flex items-center gap-1 text-sm font-medium text-slate-700 hover:text-slate-900 dark:text-slate-200 dark:hover:text-white"
								>
									<Smartphone class="h-3.5 w-3.5" />
									Play Store
								</a>
							{/if}
							{#if project.githubUrl}
								<a
									href={project.githubUrl}
									target="_blank"
									rel="noopener noreferrer"
									class="text-sm font-medium text-slate-500 hover:text-slate-900 dark:text-slate-400 dark:hover:text-white"
								>
									GitHub
								</a>
							{/if}
						</div>
					</CardContent>
				</Card>
			{/each}
		</div>
	{/if}
</div>
