<script lang="ts">
	import type { PersonalInfo } from '$lib/types';
	import { Mail, Phone, MapPin, CheckCircle, Building, Code, Heart } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';

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
		<Card class="glass border-white/30">
			<CardContent class="p-8">
				{#snippet children()}
					<h3 class="text-2xl font-bold text-white mb-6">Who I Am</h3>
					<p class="text-white/80 text-lg leading-relaxed mb-6">
						{data.bio}
					</p>
					
					<div class="space-y-4">
						<div class="flex items-center text-white/70">
							<Mail class="w-5 h-5 mr-3 text-blue-400" />
							<span>{data.email}</span>
						</div>
						
						<div class="flex items-center text-white/70">
							<Phone class="w-5 h-5 mr-3 text-blue-400" />
							<span>{data.phone}</span>
						</div>
						
						<div class="flex items-center text-white/70">
							<MapPin class="w-5 h-5 mr-3 text-blue-400" />
							<span>{data.location}</span>
						</div>
					</div>
				{/snippet}
			</CardContent>
		</Card>

		<!-- Stats/Highlights -->
		<div class="space-y-6">
			<Card class="glass border-white/30">
				<CardContent class="p-6">
					{#snippet children()}
						<div class="flex items-center justify-between">
							<div>
								<h4 class="text-3xl font-bold text-white">5+</h4>
								<p class="text-white/70">Years Experience</p>
							</div>
							<div class="w-12 h-12 bg-gradient-to-br from-blue-400 to-purple-600 rounded-lg flex items-center justify-center">
								<CheckCircle class="w-6 h-6 text-white" />
							</div>
						</div>
					{/snippet}
				</CardContent>
			</Card>

			<Card class="glass border-white/30">
				<CardContent class="p-6">
					{#snippet children()}
						<div class="flex items-center justify-between">
							<div>
								<h4 class="text-3xl font-bold text-white">50+</h4>
								<p class="text-white/70">Projects Completed</p>
							</div>
							<div class="w-12 h-12 bg-gradient-to-br from-green-400 to-blue-600 rounded-lg flex items-center justify-center">
								<Building class="w-6 h-6 text-white" />
							</div>
						</div>
					{/snippet}
				</CardContent>
			</Card>

			<Card class="glass border-white/30">
				<CardContent class="p-6">
					{#snippet children()}
						<div class="flex items-center justify-between">
							<div>
								<h4 class="text-3xl font-bold text-white">10+</h4>
								<p class="text-white/70">Technologies Mastered</p>
							</div>
							<div class="w-12 h-12 bg-gradient-to-br from-purple-400 to-pink-600 rounded-lg flex items-center justify-center">
								<Code class="w-6 h-6 text-white" />
							</div>
						</div>
					{/snippet}
				</CardContent>
			</Card>

			<Card class="glass border-white/30">
				<CardContent class="p-6">
					{#snippet children()}
						<div class="flex items-center justify-between">
							<div>
								<h4 class="text-3xl font-bold text-white">24/7</h4>
								<p class="text-white/70">Passion for Coding</p>
							</div>
							<div class="w-12 h-12 bg-gradient-to-br from-yellow-400 to-red-600 rounded-lg flex items-center justify-center">
								<Heart class="w-6 h-6 text-white" />
							</div>
						</div>
					{/snippet}
				</CardContent>
			</Card>
		</div>
	</div>
</div>