<script lang="ts">
	import type { PersonalInfo } from '$lib/types';

	interface Props {
		data: PersonalInfo;
	}

	let { data }: Props = $props();
</script>

<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
	<div class="text-center mb-16">
		<h2 class="text-4xl md:text-5xl font-bold text-white mb-4">About Me</h2>
		<div class="w-24 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
	</div>

	<div class="grid md:grid-cols-2 gap-12 items-center">
		<!-- Text Content -->
		<div class="glass p-8 rounded-2xl">
			<h3 class="text-2xl font-bold text-white mb-6">Who I Am</h3>
			<p class="text-white/80 text-lg leading-relaxed mb-6">
				{data.bio}
			</p>
			
			<div class="space-y-4">
				<div class="flex items-center text-white/70">
					<svg class="w-5 h-5 mr-3 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
					</svg>
					<span>{data.email}</span>
				</div>
				
				<div class="flex items-center text-white/70">
					<svg class="w-5 h-5 mr-3 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"></path>
					</svg>
					<span>{data.phone}</span>
				</div>
				
				<div class="flex items-center text-white/70">
					<svg class="w-5 h-5 mr-3 text-blue-400" fill="currentColor" viewBox="0 0 20 20">
						<path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path>
					</svg>
					<span>{data.location}</span>
				</div>
			</div>
		</div>

		<!-- Stats/Highlights -->
		<div class="space-y-6">
			<div class="glass p-6 rounded-xl">
				<div class="flex items-center justify-between">
					<div>
						<h4 class="text-3xl font-bold text-white">5+</h4>
						<p class="text-white/70">Years Experience</p>
					</div>
					<div class="w-12 h-12 bg-gradient-to-br from-blue-400 to-purple-600 rounded-lg flex items-center justify-center">
						<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
							<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4m6 2a9 9 0 11-18 0 9 9 0 0118 0z"></path>
						</svg>
					</div>
				</div>
			</div>

			<div class="glass p-6 rounded-xl">
				<div class="flex items-center justify-between">
					<div>
						<h4 class="text-3xl font-bold text-white">50+</h4>
						<p class="text-white/70">Projects Completed</p>
					</div>
					<div class="w-12 h-12 bg-gradient-to-br from-green-400 to-blue-600 rounded-lg flex items-center justify-center">
						<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
							<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M19 21V5a2 2 0 00-2-2H7a2 2 0 00-2 2v16m14 0h2m-2 0h-5m-9 0H3m2 0h5M9 7h1m-1 4h1m4-4h1m-1 4h1m-5 10v-5a1 1 0 011-1h2a1 1 0 011 1v5m-4 0h4"></path>
						</svg>
					</div>
				</div>
			</div>

			<div class="glass p-6 rounded-xl">
				<div class="flex items-center justify-between">
					<div>
						<h4 class="text-3xl font-bold text-white">10+</h4>
						<p class="text-white/70">Technologies Mastered</p>
					</div>
					<div class="w-12 h-12 bg-gradient-to-br from-purple-400 to-pink-600 rounded-lg flex items-center justify-center">
						<svg class="w-6 h-6 text-white" fill="none" stroke="currentColor" viewBox="0 0 24 24">
							<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 20l4-16m4 4l4 4-4 4M6 16l-4-4 4-4"></path>
						</svg>
					</div>
				</div>
			</div>

			<div class="glass p-6 rounded-xl">
				<div class="flex items-center justify-between">
					<div>
						<h4 class="text-3xl font-bold text-white">24/7</h4>
						<p class="text-white/70">Passion for Coding</p>
					</div>
					<div class="w-12 h-12 bg-gradient-to-br from-yellow-400 to-red-600 rounded-lg flex items-center justify-center">
						<svg class="w-6 h-6 text-white" fill="currentColor" viewBox="0 0 20 20">
							<path fill-rule="evenodd" d="M3.172 5.172a4 4 0 015.656 0L10 6.343l1.172-1.171a4 4 0 115.656 5.656L10 17.657l-6.828-6.829a4 4 0 010-5.656z" clip-rule="evenodd"></path>
						</svg>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>