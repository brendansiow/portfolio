<script lang="ts">
	import type { Skill } from '$lib/types';

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
			<div class="glass p-6 rounded-xl group hover:bg-white/15 transition-all duration-300">
				<!-- Category Header -->
				<div class="flex items-center mb-6">
					<div class="w-12 h-12 bg-gradient-to-br {colorSchemes[categoryIndex % colorSchemes.length]} rounded-lg flex items-center justify-center mr-4">
						{#if skillCategory.category === 'Frontend'}
							<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9.75 17L9 20l-1 1h8l-1-1-.75-3M3 13h18M5 17h14a2 2 0 002-2V5a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
							</svg>
						{:else if skillCategory.category === 'Backend'}
							<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h14M5 12a2 2 0 01-2-2V6a2 2 0 012-2h14a2 2 0 012 2v4a2 2 0 01-2 2M5 12a2 2 0 00-2 2v4a2 2 0 002 2h14a2 2 0 002-2v-4a2 2 0 00-2-2m-2-4h.01M17 16h.01"></path>
							</svg>
						{:else if skillCategory.category === 'Database'}
							<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 7v10c0 2.21 3.582 4 8 4s8-1.79 8-4V7M4 7c0 2.21 3.582 4 8 4s8-1.79 8-4M4 7c0-2.21 3.582-4 8-4s8 1.79 8 4m0 5c0 2.21-3.582 4-8 4s-8-1.79-8-4"></path>
							</svg>
						{:else if skillCategory.category === 'DevOps & Tools'}
							<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10.325 4.317c.426-1.756 2.924-1.756 3.35 0a1.724 1.724 0 002.573 1.066c1.543-.94 3.31.826 2.37 2.37a1.724 1.724 0 001.065 2.572c1.756.426 1.756 2.924 0 3.35a1.724 1.724 0 00-1.066 2.573c.94 1.543-.826 3.31-2.37 2.37a1.724 1.724 0 00-2.572 1.065c-.426 1.756-2.924 1.756-3.35 0a1.724 1.724 0 00-2.573-1.066c-1.543.94-3.31-.826-2.37-2.37a1.724 1.724 0 00-1.065-2.572c-1.756-.426-1.756-2.924 0-3.35a1.724 1.724 0 001.066-2.573c-.94-1.543.826-3.31 2.37-2.37.996.608 2.296.07 2.572-1.065z"></path>
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
							</svg>
						{:else if skillCategory.category === 'Testing'}
							<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
							</svg>
						{:else}
							<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
								<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"></path>
							</svg>
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
			</div>
		{/each}
	</div>

	<!-- Skills Summary -->
	<div class="mt-16 text-center">
		<div class="glass p-8 rounded-2xl">
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
		</div>
	</div>
</div>