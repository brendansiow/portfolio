<script lang="ts">
	import { base } from '$app/paths';
	import { Database, Package, Workflow } from 'lucide-svelte';

	let { technologies }: { technologies: string[] } = $props();

	const logos: Record<string, string> = {
		Golang: 'go',
		Flutter: 'flutter',
		OpenSearch: 'opensearch',
		Kubernetes: 'kubernetes',
		Echo: 'echo',
		'Next.js': 'nextdotjs',
		'Spring Boot': 'springboot',
		Hibernate: 'hibernate',
		Jenkins: 'jenkins',
		'Angular 8': 'angular',
		'Java Spring': 'spring',
		'Ng-Zorro': 'ng-zorro',
		NGXS: 'ngxs',
		SvelteKit: 'svelte',
		TypeScript: 'typescript',
		'Tailwind CSS': 'tailwindcss',
		'Kotlin Multiplatform': 'kotlin',
		SwiftUI: 'swift',
		'Jetpack Compose': 'jetpackcompose',
		Supabase: 'supabase'
	};
</script>

{#if technologies.length}
	<ul class="technology-logos" aria-label="Project technologies">
		{#each technologies as technology (technology)}
			<li title={technology}>
				{#if logos[technology]}
					<img
						src={`${base}/assets/technologies/${logos[technology]}.svg`}
						alt={technology}
						width={technology === 'NGXS' ? 56 : 28}
						height="28"
						loading="lazy"
						decoding="async"
					/>
				{:else if technology === 'SQL'}
					<Database size={28} role="img" aria-label={technology} />
				{:else if technology === 'CI/CD'}
					<Workflow size={28} role="img" aria-label={technology} />
				{:else}
					<Package size={28} role="img" aria-label={technology} />
				{/if}
			</li>
		{/each}
	</ul>
{/if}

<style>
	.technology-logos {
		display: flex;
		flex-wrap: wrap;
		align-items: center;
		gap: 18px;
		margin: 24px 0 0;
		padding: 0;
		list-style: none;
		color: var(--ink);
	}
	:global(.case-bottom) .technology-logos {
		margin-top: 0;
	}
	li {
		display: flex;
		align-items: center;
		min-height: 32px;
	}
	img {
		display: block;
		height: 28px;
		object-fit: contain;
		filter: brightness(0);
	}
	:global(.dark) img {
		filter: brightness(0) invert(1);
	}
</style>
