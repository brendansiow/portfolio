<script lang="ts">
	import CompanyLogo from '$lib/components/CompanyLogo.svelte';
	import type { WorkExperience } from '$lib/types';
	let { data }: { data: WorkExperience[] } = $props();
</script>

<div class="shell section">
	<div class="section-head">
		<div>
			<span class="eyebrow">02 / Experience</span>
			<h2>Where I’ve been building.</h2>
		</div>
	</div>
	<div class="experience-list">
		{#each data.filter((job) => !job.earlyCareer) as job (job.id)}<article class="experience">
				<span class="date">{job.duration}</span>
				<div class="experience-body">
					<div class="experience-title">
						{#if job.companyLogo}<div class="experience-logo">
								<CompanyLogo src={job.companyLogo} darkSrc={job.companyLogoDark} />
							</div>{/if}
						<div>
							<h3>
								{#if job.companyUrl}<a
										href={job.companyUrl}
										target="_blank"
										rel="noopener noreferrer">{job.company} ↗</a
									>{:else}{job.company}{/if}
							</h3>
							<p>{job.position}</p>
						</div>
					</div>
					<ul>
						{#each job.description as line (line)}<li>{line}</li>{/each}
					</ul>
					<div class="work-tags">
						{#each job.technologies as tech (tech)}<span>{tech}</span>{/each}
					</div>
				</div>
			</article>{/each}<span class="eyebrow earlier-label">Earlier experience</span
		>{#each data.filter((job) => job.earlyCareer) as job (job.id)}<article class="experience early">
				<span class="date">{job.duration}</span>
				<div>
					<h3>{job.company}</h3>
					<p>{job.position}</p>
				</div>
			</article>{/each}
	</div>
</div>
