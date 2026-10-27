<script lang="ts">
	import type { Skill } from '$lib/types';
	let { data }: { data: Skill[] } = $props();
</script>

<div class="shell section">
	<div class="section-head">
		<div>
			<span class="eyebrow">03 / Skills</span>
			<h2>The tools behind the work.</h2>
		</div>
	</div>
	<div class="toolkit">
		{#each data.filter((group) => group.category !== 'Languages') as group (group.category)}<div>
				<h3>{group.category}</h3>
				<p>
					{#each group.skills as skill (skill)}{skill}<br />{/each}
				</p>
			</div>{/each}
	</div>
	{#each data.filter((group) => group.category === 'Languages') as group (group.category)}<div
			class="language-row"
		>
			<span class="eyebrow">{group.category}</span>{#each group.skills as skill (skill)}<span
					>{skill}</span
				>{/each}
		</div>{/each}
</div>
