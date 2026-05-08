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

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">Learning</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">Education and credentials</h2>
	</div>

	<div class="grid gap-4 md:grid-cols-2">
		<div class="flex flex-col gap-4">
			<div class="mb-2 flex items-center gap-2">
				<GraduationCap class="h-5 w-5 text-slate-600 dark:text-slate-300" />
				<h3 class="text-lg font-semibold text-slate-900 dark:text-slate-100">Education</h3>
			</div>
			{#each education as edu (edu.id)}
				<Card class="glass rounded-[1.5rem] border-white/30">
					<CardContent class="p-5 pt-5">
						<div class="flex flex-col justify-between gap-2 sm:flex-row sm:items-start">
							<div>
								<h4 class="text-base font-bold text-slate-900 dark:text-slate-100">
									{edu.degree}
								</h4>
								<p class="mt-0.5 text-sm text-slate-600 dark:text-slate-300">{edu.institution}</p>
								<div
									class="mt-1 flex items-center gap-1.5 text-xs text-slate-500 dark:text-slate-400"
								>
									<MapPin class="h-3.5 w-3.5" />
									{edu.location}
								</div>
							</div>
							<div class="text-xs text-slate-500 dark:text-slate-400 sm:text-right">
								<span class="font-medium">{edu.duration}</span>
								{#if edu.gpa}
									<p class="mt-0.5">{edu.gpa}</p>
								{/if}
							</div>
						</div>
						{#if edu.description}
							<p class="mt-3 text-sm leading-6 text-slate-600 dark:text-slate-300">
								{edu.description}
							</p>
						{/if}
					</CardContent>
				</Card>
			{/each}
		</div>

		<div class="flex flex-col gap-4">
			<div class="mb-2 flex items-center gap-2">
				<Award class="h-5 w-5 text-slate-600 dark:text-slate-300" />
				<h3 class="text-lg font-semibold text-slate-900 dark:text-slate-100">Certificates</h3>
			</div>
			{#each certificates as cert (cert.id)}
				<Card
					class="glass rounded-[1.5rem] border-white/30 transition hover:bg-white/60 dark:hover:bg-slate-800/60"
				>
					<CardContent class="p-5 pt-5">
						<div class="flex items-start justify-between">
							<div class="flex-1">
								<h4 class="text-base font-bold text-slate-900 dark:text-slate-100">
									{cert.name}
								</h4>
								<p class="mt-0.5 text-sm text-slate-600 dark:text-slate-300">{cert.issuer}</p>
								<div
									class="mt-1 flex items-center gap-1.5 text-xs text-slate-500 dark:text-slate-400"
								>
									<Calendar class="h-3.5 w-3.5" />
									{cert.date}
								</div>
								{#if cert.credentialId}
									<p class="mt-1 text-xs text-slate-500 dark:text-slate-400">
										ID: {cert.credentialId}
									</p>
								{/if}
							</div>
							{#if cert.credentialUrl}
								<a
									href={cert.credentialUrl}
									target="_blank"
									rel="noopener noreferrer"
									class="ml-3 rounded-xl p-2 text-slate-600 transition hover:bg-white/50 dark:text-slate-300 dark:hover:bg-slate-700/50"
									aria-label="View {cert.name} certificate"
								>
									<ExternalLink class="h-4 w-4" />
								</a>
							{/if}
						</div>
					</CardContent>
				</Card>
			{/each}
		</div>
	</div>
</div>
