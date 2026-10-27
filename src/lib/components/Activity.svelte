<script lang="ts">
	import { portfolioData } from '$lib/data';
	import { ArrowUpRight } from 'lucide-svelte';
</script>

<div class="shell section">
	<div class="section-head">
		<div>
			<span class="eyebrow">04 / Beyond the day job</span>
			<h2>Room to experiment.</h2>
		</div>
	</div>
	{#each portfolioData.activities as activity (activity.id)}<article class="activity-card glass">
			<div class="activity-award">{activity.achievement}<span>{activity.category}</span></div>
			<div>
				<h3>{activity.title}</h3>
				<p>{activity.description}</p>
				<a class="work-visit" href={activity.url} target="_blank" rel="noopener noreferrer"
					>Read about the project <ArrowUpRight size={16} aria-hidden="true" /></a
				>
			</div>
		</article>{/each}
</div>
