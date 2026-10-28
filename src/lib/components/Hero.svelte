<script lang="ts">
	import { base } from '$app/paths';
	import type { PersonalInfo, WorkExperience } from '$lib/types';
	import { ArrowUpRight, Building2, MapPin, Linkedin, Download } from 'lucide-svelte';
	let {
		data,
		experience,
		resumeFilename
	}: { data: PersonalInfo; experience: WorkExperience[]; resumeFilename: string } = $props();
	const current = experience.find((job) => !job.earlyCareer);
</script>

<div class="shell" id="top">
	<section class="hero" id="about" tabindex="-1">
		<div class="hero-copy">
			<p class="eyebrow"><span class="dot"></span>{data.title} · Kuala Lumpur</p>
			<h1>{data.headlineLead} <span class="faint">{data.headlineAccent}</span></h1>
			<p class="intro">{data.heroSummary}</p>
			<div class="actions">
				<a class="button primary" href="#projects"
					>Explore my work <ArrowUpRight size={18} aria-hidden="true" /></a
				><a
					class="button secondary resume-download"
					href={`${base}/${resumeFilename}`}
					download={resumeFilename}
					type="application/pdf"
					aria-label="Download resume (PDF)"
					>Resume (PDF) <Download size={18} aria-hidden="true" /></a
				><a
					class="button secondary"
					href={data.linkedin}
					target="_blank"
					rel="noopener noreferrer"
					aria-label="Say hello on LinkedIn (opens in a new tab)"
					>Say hello <Linkedin size={18} aria-hidden="true" /></a
				>
			</div>
		</div>
		<div class="hero-art">
			<aside class="identity-card glass" aria-label={`About ${data.name}`}>
				<div class="identity-top">
					<span class="identity-avatar" aria-hidden="true">{data.initials}</span>
					<span class="identity-location"
						><MapPin size={14} aria-hidden="true" />{data.shortLocation}</span
					>
				</div>
				<h2 class="identity-name">{data.name}</h2>
				<p class="identity-role">{data.title}</p>
				<p class="identity-bio">{data.aboutSummary}</p>
				{#if current}
					<a
						class="identity-current"
						href="#experience"
						aria-label={`View experience at ${current.company}`}
					>
						<Building2 size={18} aria-hidden="true" />
						<span
							><span class="identity-current-company">Currently at {current.company}</span><span
								class="identity-current-date">{current.duration}</span
							></span
						>
						<ArrowUpRight class="identity-current-arrow" size={16} aria-hidden="true" />
					</a>
				{/if}
			</aside>
		</div>
	</section>
</div>
