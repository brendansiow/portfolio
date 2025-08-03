<script lang="ts">
	import type { WorkExperience } from '$lib/types';

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
					<div class="glass p-6 md:p-8 rounded-2xl">
						<!-- Company and Duration -->
						<div class="flex flex-col md:flex-row md:items-center md:justify-between mb-4">
							<h3 class="text-xl md:text-2xl font-bold text-white">{experience.company}</h3>
							<span class="text-blue-300 font-medium">{experience.duration}</span>
						</div>

						<!-- Position and Location -->
						<div class="mb-4">
							<h4 class="text-lg font-semibold text-blue-200 mb-1">{experience.position}</h4>
							<p class="text-white/70 text-sm flex items-center">
								<svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
									<path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path>
								</svg>
								{experience.location}
							</p>
						</div>

						<!-- Description -->
						<ul class="space-y-2 mb-6">
							{#each experience.description as desc}
								<li class="text-white/80 text-sm md:text-base flex items-start">
									<svg class="w-4 h-4 mr-2 mt-1 text-blue-400 flex-shrink-0" fill="currentColor" viewBox="0 0 20 20">
										<path fill-rule="evenodd" d="M16.707 5.293a1 1 0 010 1.414l-8 8a1 1 0 01-1.414 0l-4-4a1 1 0 011.414-1.414L8 12.586l7.293-7.293a1 1 0 011.414 0z" clip-rule="evenodd"></path>
									</svg>
									{desc}
								</li>
							{/each}
						</ul>

						<!-- Technologies -->
						<div>
							<h5 class="text-white font-medium mb-3">Technologies Used:</h5>
							<div class="flex flex-wrap gap-2">
								{#each experience.technologies as tech}
									<span class="px-3 py-1 bg-white/10 border border-white/20 rounded-full text-white/90 text-sm">
										{tech}
									</span>
								{/each}
							</div>
						</div>
					</div>
				</div>
			</div>
		{/each}
	</div>
</div>