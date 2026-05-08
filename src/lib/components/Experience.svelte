<script lang="ts">
	import type { WorkExperience } from '$lib/types';
	import { MapPin, Check, ArrowUpRight } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';
	import Badge from '$lib/components/ui/badge.svelte';

	interface Props {
		data: WorkExperience[];
	}

	let { data }: Props = $props();
</script>

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">Experience</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">Experience at a glance</h2>
	</div>

	<div class="grid gap-4 md:grid-cols-2">
		{#each data as experience, index (experience.id)}
			<Card class="glass rounded-[1.75rem] border-white/30 {index === 0 ? 'md:col-span-2' : ''}">
				<CardContent class="flex h-full flex-col p-6 pt-6 md:p-7">
					<div class="flex items-start justify-between gap-4">
						<div class="flex items-start gap-3">
							{#if experience.companyLogo}
								<div
									class="flex h-11 w-11 shrink-0 items-center justify-center overflow-hidden rounded-2xl border border-white/40 bg-white/70 p-2 dark:border-slate-700/50 dark:bg-slate-900/60"
								>
									<img
										src={experience.companyLogo}
										alt={experience.company}
										class="h-full w-full object-contain"
									/>
								</div>
							{/if}
							<div>
								<h3 class="text-lg font-bold text-slate-900 dark:text-slate-100 md:text-xl">
									{experience.position}
								</h3>
								<p class="mt-0.5 text-sm font-medium text-slate-600 dark:text-slate-300">
									{#if experience.companyUrl}
										<a
											href={experience.companyUrl}
											target="_blank"
											rel="noopener noreferrer"
											class="transition hover:text-slate-900 dark:hover:text-white"
											>{experience.company}</a
										>
									{:else}
										{experience.company}
									{/if}
								</p>
							</div>
						</div>
						<div class="text-xs font-medium text-slate-500 dark:text-slate-400">
							{experience.duration}
						</div>
					</div>

					<div class="mt-2 flex items-center gap-2 text-xs text-slate-600 dark:text-slate-300">
						<MapPin class="h-3.5 w-3.5" />
						{experience.location}
					</div>

					<ul class="mt-4 space-y-2">
						{#each experience.description.slice(0, index === 0 ? 4 : 2) as desc (desc)}
							<li
								class="flex items-start gap-2 text-sm leading-6 text-slate-600 dark:text-slate-300"
							>
								<Check class="mt-0.5 h-4 w-4 shrink-0 text-sky-600 dark:text-sky-300" />
								{desc}
							</li>
						{/each}
					</ul>

					<div class="mt-auto flex flex-wrap gap-2 pt-4">
						{#each experience.technologies.slice(0, index === 0 ? 6 : 4) as tech (tech)}
							<Badge variant="secondary">{tech}</Badge>
						{/each}
					</div>
				</CardContent>
			</Card>
		{/each}
	</div>
</div>
