<script lang="ts">
	import type { Education, Certificate } from '$lib/types';

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
				<svg class="w-8 h-8 mr-3 text-blue-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l9-5-9-5-9 5 9 5z"></path>
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 14l6.16-3.422a12.083 12.083 0 01.665 6.479A11.952 11.952 0 0012 20.055a11.952 11.952 0 00-6.824-2.998 12.078 12.078 0 01.665-6.479L12 14z"></path>
				</svg>
				Education
			</h3>

			<div class="space-y-6">
				{#each education as edu}
					<div class="glass p-6 rounded-xl">
						<div class="flex flex-col md:flex-row md:items-start md:justify-between mb-4">
							<div>
								<h4 class="text-xl font-bold text-white mb-1">{edu.degree}</h4>
								<h5 class="text-lg text-blue-200 mb-2">{edu.institution}</h5>
								<p class="text-white/70 text-sm flex items-center mb-2">
									<svg class="w-4 h-4 mr-1" fill="currentColor" viewBox="0 0 20 20">
										<path fill-rule="evenodd" d="M5.05 4.05a7 7 0 119.9 9.9L10 18.9l-4.95-4.95a7 7 0 010-9.9zM10 11a2 2 0 100-4 2 2 0 000 4z" clip-rule="evenodd"></path>
									</svg>
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
					</div>
				{/each}
			</div>
		</div>

		<!-- Certificates Section -->
		<div>
			<h3 class="text-2xl md:text-3xl font-bold text-white mb-8 flex items-center">
				<svg class="w-8 h-8 mr-3 text-purple-400" fill="none" stroke="currentColor" viewBox="0 0 24 24">
					<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M9 12l2 2 4-4M7.835 4.697a3.42 3.42 0 001.946-.806 3.42 3.42 0 014.438 0 3.42 3.42 0 001.946.806 3.42 3.42 0 013.138 3.138 3.42 3.42 0 00.806 1.946 3.42 3.42 0 010 4.438 3.42 3.42 0 00-.806 1.946 3.42 3.42 0 01-3.138 3.138 3.42 3.42 0 00-1.946.806 3.42 3.42 0 01-4.438 0 3.42 3.42 0 00-1.946-.806 3.42 3.42 0 01-3.138-3.138 3.42 3.42 0 00-.806-1.946 3.42 3.42 0 010-4.438 3.42 3.42 0 00.806-1.946 3.42 3.42 0 013.138-3.138z"></path>
				</svg>
				Certificates
			</h3>

			<div class="space-y-4">
				{#each certificates as cert}
					<div class="glass p-6 rounded-xl group hover:bg-white/15 transition-all duration-300">
						<div class="flex items-start justify-between">
							<div class="flex-1">
								<h4 class="text-lg font-bold text-white mb-1">{cert.name}</h4>
								<p class="text-blue-200 mb-2">{cert.issuer}</p>
								<div class="flex items-center text-white/70 text-sm">
									<svg class="w-4 h-4 mr-1" fill="none" stroke="currentColor" viewBox="0 0 24 24">
										<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z"></path>
									</svg>
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
									aria-label="View {cert.title} certificate"
								>
									<svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
										<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 6H6a2 2 0 00-2 2v10a2 2 0 002 2h10a2 2 0 002-2v-4M14 4h6m0 0v6m0-6L10 14"></path>
									</svg>
								</a>
							{/if}
						</div>
					</div>
				{/each}
			</div>
		</div>
	</div>
</div>