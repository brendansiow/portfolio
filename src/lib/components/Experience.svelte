<script lang="ts">
	import type { WorkExperience } from '$lib/types';
	import { MapPin, Check } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';
	import Badge from '$lib/components/ui/badge.svelte';

	interface Props {
		data: WorkExperience[];
	}

	let { data }: Props = $props();
</script>

<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
	<div class="text-center mb-16">
		<h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Work Experience</h2>
		<div class="w-24 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
	</div>

	<div class="relative">
		<!-- Timeline line -->
		<div class="absolute left-4 md:left-1/2 transform md:-translate-x-1/2 w-0.5 h-full bg-gradient-to-b from-blue-400 to-purple-600"></div>

		{#each data as experience, index}
			<div class="relative mb-12 md:mb-16">
				<!-- Timeline dot -->
				<div class="absolute left-2 md:left-1/2 transform md:-translate-x-1/2 w-4 h-4 bg-gradient-to-br from-blue-400 to-purple-600 rounded-full border-4 border-white/20"></div>

				<!-- Content -->
				<div class="ml-12 md:ml-0 md:w-1/2 {index % 2 === 0 ? 'md:mr-auto md:pr-8' : 'md:ml-auto md:pl-8'}">
					<Card class="glass border-white/30">
						<CardContent class="p-6 md:p-8">
							{#snippet children()}
								<!-- Company and Duration -->
								<div class="flex flex-col md:flex-row md:items-center md:justify-between mb-4">
									<h3 class="text-xl md:text-2xl font-bold text-white">{experience.company}</h3>
									<span class="text-blue-300 font-medium">{experience.duration}</span>
								</div>

								<!-- Position and Location -->
								<div class="mb-4">
									<h4 class="text-lg font-semibold text-blue-200 mb-1">{experience.position}</h4>
									<p class="text-white/70 text-sm flex items-center">
										<MapPin class="w-4 h-4 mr-1" />
										{experience.location}
									</p>
								</div>

								<!-- Description -->
								<ul class="space-y-2 mb-6">
									{#each experience.description as desc}
										<li class="text-white/80 text-sm md:text-base flex items-start">
											<Check class="w-4 h-4 mr-2 mt-1 text-blue-400 flex-shrink-0" />
											{desc}
										</li>
									{/each}
								</ul>

								<!-- Technologies -->
								<div>
									<h5 class="text-white font-medium mb-3">Technologies Used:</h5>
									<div class="flex flex-wrap gap-2">
										{#each experience.technologies as tech}
											<Badge variant="secondary" class="bg-white/10 border-white/20 text-white/90">
												{tech}
											</Badge>
										{/each}
									</div>
								</div>
							{/snippet}
						</CardContent>
					</Card>
				</div>
			</div>
		{/each}
	</div>
</div>