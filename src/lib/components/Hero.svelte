<script lang="ts">
	import type { PersonalInfo, WorkExperience } from '$lib/types';
	import { ArrowUpRight, Building2 } from 'lucide-svelte';
	let { data, experience }: { data: PersonalInfo; experience: WorkExperience[] } = $props();
	const current = experience.find((job) => !job.earlyCareer);
</script>

<div class="shell" id="top">
	<section class="hero" id="about">
		<div class="hero-copy">
			<p class="eyebrow"><span class="dot"></span>{data.title} · Kuala Lumpur</p>
			<h1>{data.headlineLead} <span class="faint">{data.headlineAccent}</span></h1>
			<p class="intro">{data.heroSummary}</p>
			<div class="actions">
				<a class="button primary" href="#projects"
					>Explore my work <ArrowUpRight size={18} aria-hidden="true" /></a
				><a class="button secondary" href={`mailto:${data.email}`}
					>Say hello <ArrowUpRight size={18} aria-hidden="true" /></a
				>
			</div>
		</div>
		<div class="hero-art">
			<div class="art-grid" aria-hidden="true"></div>
			<div class="orb" aria-hidden="true"></div>
			<aside class="identity-card glass" aria-label={`About ${data.name}`}>
				<div class="card-top">
					<span class="eyebrow">A little about me</span>
					<div class="card-dots" aria-hidden="true"><i></i><i></i><i></i></div>
				</div>
				<h2 class="identity-name" aria-label={data.name}>
					{#each data.name.split(' ') as part (part)}<span>{part}</span>{/each}
				</h2>
				<p class="identity-role">{data.title}</p>
				<p class="identity-bio">{data.aboutSummary}</p>
				<div class="card-bottom"><span>{data.focus.join(' / ').toUpperCase()}</span></div>
			</aside>
			{#if current}
				<div class="floating-tag glass">
					<div class="tag-icon" aria-hidden="true"><Building2 size={17} /></div>
					<div>
						<b>Currently at {current.company}</b><small>{current.duration.toUpperCase()}</small>
					</div>
				</div>
			{/if}
		</div>
	</section>
</div>
