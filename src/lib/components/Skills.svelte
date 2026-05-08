<script lang="ts">
	import type { Skill } from '$lib/types';
	import { Monitor, Server, Database, Settings, Code } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';

	interface Props {
		data: Skill[];
	}

	let { data }: Props = $props();

	const totalSkills = $derived(data.reduce((acc, category) => acc + category.skills.length, 0));

	const iconMap: Record<string, typeof Monitor> = {
		Frontend: Monitor,
		Backend: Server,
		Database: Database,
		'DevOps & Tools': Settings,
		Languages: Code
	};
</script>

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">Capabilities</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">
			Skills and technical range
		</h2>
	</div>

	<div class="grid auto-rows-[minmax(180px,auto)] gap-4 md:grid-cols-3">
		{#each data as skillCategory (skillCategory.category)}
			{@const Icon = iconMap[skillCategory.category] ?? Code}
			<Card
				class="glass flex flex-col rounded-[1.75rem] border-white/30 {skillCategory.category ===
					'Frontend' || skillCategory.category === 'Backend'
					? 'md:row-span-2'
					: ''}"
			>
				<CardContent class="flex h-full flex-col p-5 pt-5">
					<div class="mb-4 flex items-center gap-3">
						<div
							class="flex h-10 w-10 items-center justify-center rounded-full bg-white/50 dark:bg-slate-800/60"
						>
							<Icon class="h-5 w-5 text-slate-700 dark:text-slate-100" />
						</div>
						<h3 class="text-base font-semibold text-slate-900 dark:text-slate-100">
							{skillCategory.category}
						</h3>
					</div>

					<div class="flex flex-wrap gap-2">
						{#each skillCategory.skills as skill (skill)}
							<span
								class="rounded-full border border-white/30 bg-white/40 px-3 py-1.5 text-xs font-medium text-slate-700 dark:border-slate-700/40 dark:bg-slate-800/50 dark:text-slate-200"
								>{skill}</span
							>
						{/each}
					</div>
				</CardContent>
			</Card>
		{/each}

		<!-- Technical Snapshot wide card -->
		<Card class="glass-strong col-span-1 rounded-[1.75rem] border-white/30 md:col-span-3">
			<CardContent class="p-6 pt-6">
				<h3 class="text-lg font-semibold text-slate-900 dark:text-slate-100">Technical Snapshot</h3>
				<div class="mt-5 grid grid-cols-2 gap-6 md:grid-cols-4">
					<div class="text-center">
						<div class="text-3xl font-bold text-slate-900 dark:text-slate-100">5+</div>
						<div class="mt-1 text-xs text-slate-600 dark:text-slate-300">Years experience</div>
					</div>
					<div class="text-center">
						<div class="text-3xl font-bold text-slate-900 dark:text-slate-100">{totalSkills}+</div>
						<div class="mt-1 text-xs text-slate-600 dark:text-slate-300">Technologies</div>
					</div>
					<div class="text-center">
						<div class="text-3xl font-bold text-slate-900 dark:text-slate-100">50+</div>
						<div class="mt-1 text-xs text-slate-600 dark:text-slate-300">Projects built</div>
					</div>
					<div class="text-center">
						<div class="text-3xl font-bold text-slate-900 dark:text-slate-100">1</div>
						<div class="mt-1 text-xs text-slate-600 dark:text-slate-300">
							Design systems mindset
						</div>
					</div>
				</div>
			</CardContent>
		</Card>
	</div>
</div>
