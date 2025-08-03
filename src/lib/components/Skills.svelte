<script lang="ts">
	import type { Skill } from '$lib/types';
	import { Monitor, Server, Database, Settings, CheckCircle, Code } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';

	interface Props {
		data: Skill[];
	}

	let { data }: Props = $props();

	// Color schemes for different skill categories
	const colorSchemes = [
		'from-blue-400 to-blue-600',
		'from-purple-400 to-purple-600',
		'from-green-400 to-green-600',
		'from-yellow-400 to-yellow-600',
		'from-pink-400 to-pink-600',
		'from-indigo-400 to-indigo-600',
		'from-red-400 to-red-600',
		'from-teal-400 to-teal-600'
	];
</script>

<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
	<div class="text-center mb-16">
		<h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Skills & Technologies</h2>
		<div class="w-24 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
	</div>

	<div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
		{#each data as skillCategory, categoryIndex}
			<Card class="glass border-white/30 group hover:bg-white/15 transition-all duration-300">
				<CardContent class="p-6">
					{#snippet children()}
						<!-- Category Header -->
						<div class="flex items-center mb-6">
							<div class="w-12 h-12 bg-gradient-to-br {colorSchemes[categoryIndex % colorSchemes.length]} rounded-lg flex items-center justify-center mr-4">
								{#if skillCategory.category === 'Frontend'}
									<Monitor class="w-6 h-6 text-white" />
								{:else if skillCategory.category === 'Backend'}
									<Server class="w-6 h-6 text-white" />
								{:else if skillCategory.category === 'Database'}
									<Database class="w-6 h-6 text-white" />
								{:else if skillCategory.category === 'DevOps & Tools'}
									<Settings class="w-6 h-6 text-white" />
								{:else if skillCategory.category === 'Testing'}
									<CheckCircle class="w-6 h-6 text-white" />
								{:else}
									<Code class="w-6 h-6 text-white" />
								{/if}
							</div>
							<h3 class="text-xl font-bold text-white">{skillCategory.category}</h3>
						</div>

						<!-- Skills List -->
						<div class="space-y-3">
							{#each skillCategory.skills as skill}
								<div class="flex items-center group/skill">
									<div class="flex-1">
										<div class="flex items-center justify-between mb-1">
											<span class="text-white/90 font-medium">{skill}</span>
										</div>
										<!-- Skill Bar -->
										<div class="w-full bg-white/10 rounded-full h-2">
											<div 
												class="bg-gradient-to-r {colorSchemes[categoryIndex % colorSchemes.length]} h-2 rounded-full transition-all duration-1000 ease-out"
												style="width: {Math.floor(Math.random() * 30) + 70}%"
											></div>
										</div>
									</div>
								</div>
							{/each}
						</div>
					{/snippet}
				</CardContent>
			</Card>
		{/each}
	</div>

	<!-- Skills Summary -->
	<div class="mt-16 text-center">
		<Card class="glass border-white/30">
			<CardContent class="p-8">
				{#snippet children()}
					<h3 class="text-2xl font-bold text-white mb-6">Technical Proficiency</h3>
					<div class="grid grid-cols-2 md:grid-cols-4 gap-8">
						<div class="text-center">
							<div class="text-3xl font-bold text-blue-400 mb-2">5+</div>
							<div class="text-white/70">Years Experience</div>
						</div>
						<div class="text-center">
							<div class="text-3xl font-bold text-purple-400 mb-2">{data.reduce((acc, category) => acc + category.skills.length, 0)}+</div>
							<div class="text-white/70">Technologies</div>
						</div>
						<div class="text-center">
							<div class="text-3xl font-bold text-green-400 mb-2">50+</div>
							<div class="text-white/70">Projects Built</div>
						</div>
						<div class="text-center">
							<div class="text-3xl font-bold text-yellow-400 mb-2">100+</div>
							<div class="text-white/70">Commits/Month</div>
						</div>
					</div>
				{/snippet}
			</CardContent>
		</Card>
	</div>
</div>