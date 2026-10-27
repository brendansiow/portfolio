<script lang="ts">
	import type { Education, Certificate } from '$lib/types';
	let { education, certificates }: { education: Education[]; certificates: Certificate[] } =
		$props();
</script>

<div class="shell section">
	<div class="section-head">
		<div>
			<span class="eyebrow">05 / Education</span>
			<h2>A foundation in software.</h2>
		</div>
	</div>
	<div class="education-grid">
		{#each education.slice(0, 2) as item (item.id)}<article class="education-card glass">
				<span class="eyebrow">{item.duration}</span>
				<h3>{item.degree}</h3>
				<p>{item.institution}</p>
				{#if item.gpa}<span class="honour">{item.gpa}</span>{/if}
			</article>{/each}
	</div>
	{#each education.slice(2) as item (item.id)}<div class="education-other">
			<strong>{item.institution} · {item.degree}</strong><span>{item.duration} · {item.gpa}</span>
		</div>{/each}{#each certificates as item (item.id)}<div class="education-other">
			<strong>{item.name}</strong><span
				>{item.issuer}{#if item.date}
					· {item.date}{/if}</span
			>
		</div>{/each}
</div>
