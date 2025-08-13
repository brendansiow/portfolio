<script lang="ts">
	import type { Education, Certificate } from '$lib/types';
	import { GraduationCap, Award, MapPin, Calendar, ExternalLink } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';

	interface Props {
		education: Education[];
		certificates: Certificate[];
	}

	let { education, certificates }: Props = $props();
</script>

<div class="max-w-6xl mx-auto px-4 sm:px-6 lg:px-8">
	<div class="text-center mb-16">
		<h2 class="text-4xl md:text-5xl font-bold text-white mb-4">Education & Certificates</h2>
		<div class="w-24 h-1 bg-gradient-to-r from-blue-400 to-purple-600 mx-auto"></div>
	</div>

	<div class="grid lg:grid-cols-2 gap-12">
		<!-- Education Section -->
		<div>
			<h3 class="text-2xl md:text-3xl font-bold text-white mb-8 flex items-center">
				<GraduationCap class="w-8 h-8 mr-3 text-blue-400" />
				Education
			</h3>

			<div class="space-y-6">
				{#each education as edu}
					<Card class="glass border-white/30">
						<CardContent class="p-6">
							{#snippet children()}
								<div class="flex flex-col md:flex-row md:items-start md:justify-between mb-4">
									<div>
										<h4 class="text-xl font-bold text-white mb-1">{edu.degree}</h4>
										<h5 class="text-lg text-blue-200 mb-2">{edu.institution}</h5>
										<p class="text-white/70 text-sm flex items-center mb-2">
											<MapPin class="w-4 h-4 mr-1" />
											{edu.location}
										</p>
									</div>
									<div class="text-right">
										<span class="text-blue-300 font-medium">{edu.duration}</span>
										{#if edu.gpa}
											<p class="text-white/70 text-sm mt-1">GPA: {edu.gpa}</p>
										{/if}
									</div>
								</div>
								
								{#if edu.description}
									<p class="text-white/80">{edu.description}</p>
								{/if}
							{/snippet}
						</CardContent>
					</Card>
				{/each}
			</div>
		</div>

		<!-- Certificates Section -->
		<div>
			<h3 class="text-2xl md:text-3xl font-bold text-white mb-8 flex items-center">
				<Award class="w-8 h-8 mr-3 text-purple-400" />
				Certificates
			</h3>

			<div class="space-y-4">
				{#each certificates as cert}
					<Card class="glass border-white/30 group hover:bg-white/15 transition-all duration-300">
						<CardContent class="p-6">
							{#snippet children()}
								<div class="flex items-start justify-between">
									<div class="flex-1">
										<h4 class="text-lg font-bold text-white mb-1">{cert.name}</h4>
										<p class="text-blue-200 mb-2">{cert.issuer}</p>
										<div class="flex items-center text-white/70 text-sm">
											<Calendar class="w-4 h-4 mr-1" />
											{cert.date}
										</div>
										{#if cert.credentialId}
											<p class="text-white/60 text-xs mt-1">ID: {cert.credentialId}</p>
										{/if}
									</div>
									
									{#if cert.credentialUrl}
										<a 
											href={cert.credentialUrl} 
											target="_blank" 
											rel="noopener noreferrer"
											class="ml-4 p-2 text-blue-400 hover:text-blue-300 transition-colors"
											aria-label="View {cert.name} certificate"
										>
											<ExternalLink class="w-5 h-5" />
										</a>
									{/if}
								</div>
							{/snippet}
						</CardContent>
					</Card>
				{/each}
			</div>
		</div>
	</div>
</div>