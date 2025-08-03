<script lang="ts">
	import type { PersonalInfo } from '$lib/types';
	import { MapPin, Github, Linkedin, Mail } from 'lucide-svelte';
	import Button from '$lib/components/ui/button.svelte';

	interface Props {
		data: PersonalInfo;
	}

	let { data }: Props = $props();
</script>

<div class="min-h-screen flex items-center justify-center px-4 pt-16">
	<div class="max-w-4xl mx-auto text-center">
		<!-- Profile Image -->
		<div class="mb-8 flex justify-center">
			<div class="relative">
				<div class="w-32 h-32 md:w-40 md:h-40 rounded-full overflow-hidden glass border-4 border-white/30 floating">
					{#if data.profileImage}
						<img 
							src={data.profileImage} 
							alt={data.name} 
							class="w-full h-full object-cover"
						/>
					{:else}
						<div class="w-full h-full bg-gradient-to-br from-blue-400 to-purple-600 flex items-center justify-center">
							<span class="text-white text-4xl font-bold">
								{data.name.split(' ').map(n => n[0]).join('')}
							</span>
						</div>
					{/if}
				</div>
				<div class="absolute -inset-1 bg-gradient-to-r from-blue-400 via-purple-500 to-pink-500 rounded-full opacity-75 blur animate-pulse"></div>
			</div>
		</div>

		<!-- Name and Title -->
		<h1 class="text-4xl md:text-6xl lg:text-7xl font-bold text-white mb-4">
			{data.name}
		</h1>
		
		<h2 class="text-xl md:text-2xl lg:text-3xl text-blue-200 mb-6 font-light">
			{data.title}
		</h2>

		<!-- Bio -->
		<p class="text-lg md:text-xl text-white/80 mb-8 max-w-3xl mx-auto leading-relaxed">
			{data.bio}
		</p>

		<!-- Location -->
		<div class="flex items-center justify-center text-white/70 mb-8">
			<MapPin class="w-5 h-5 mr-2" />
			{data.location}
		</div>

		<!-- CTA Buttons -->
		<div class="flex flex-col sm:flex-row gap-4 justify-center items-center">
			<Button
				variant="default"
				size="lg"
				onclick={(e) => {
					e.preventDefault();
					document.querySelector('#contact')?.scrollIntoView({ behavior: 'smooth' });
				}}
				class="glass border border-white/30 hover:border-white/50"
			>
				{#snippet children()}Get In Touch{/snippet}
			</Button>
			
			<Button
				variant="outline"
				size="lg"
				onclick={(e) => {
					e.preventDefault();
					document.querySelector('#projects')?.scrollIntoView({ behavior: 'smooth' });
				}}
				class="border-white/30 text-white hover:glass"
			>
				{#snippet children()}View My Work{/snippet}
			</Button>
		</div>

		<!-- Social Links -->
		<div class="flex justify-center space-x-6 mt-12">
			<a href={data.github} target="_blank" rel="noopener noreferrer" class="text-white/70 hover:text-white transition-colors" aria-label="GitHub Profile">
				<Github class="w-6 h-6" />
			</a>
			
			<a href={data.linkedin} target="_blank" rel="noopener noreferrer" class="text-white/70 hover:text-white transition-colors" aria-label="LinkedIn Profile">
				<Linkedin class="w-6 h-6" />
			</a>
			
			<a href={`mailto:${data.email}`} class="text-white/70 hover:text-white transition-colors" aria-label="Send Email">
				<Mail class="w-6 h-6" />
			</a>
		</div>
	</div>
</div>