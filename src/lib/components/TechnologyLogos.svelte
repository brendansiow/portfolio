<script lang="ts">
	import { base } from '$app/paths';
	import { Database, Package, Workflow } from 'lucide-svelte';

	let { technologies }: { technologies: string[] } = $props();

	const logos: Record<string, string> = {
		Golang: 'technologies/go',
		Flutter: 'skills/flutter',
		OpenSearch: 'technologies/opensearch',
		Kubernetes: 'skills/kubernetes',
		Echo: 'technologies/echo',
		'Next.js': 'technologies/nextdotjs',
		'Spring Boot': 'technologies/springboot',
		Hibernate: 'skills/hibernate',
		Jenkins: 'skills/jenkins',
		'Angular 8': 'skills/angular',
		'Java Spring': 'skills/spring',
		'Ng-Zorro': 'technologies/ng-zorro',
		NGXS: 'technologies/ngxs',
		SvelteKit: 'skills/svelte',
		TypeScript: 'skills/typescript',
		'Tailwind CSS': 'technologies/tailwindcss',
		'Kotlin Multiplatform': 'technologies/kotlin',
		SwiftUI: 'technologies/swift',
		'Jetpack Compose': 'technologies/jetpackcompose',
		Supabase: 'technologies/supabase'
	};
</script>

{#if technologies.length}
	<ul class="technology-logos" aria-label="Project technologies">
		{#each technologies as technology (technology)}
			<li title={technology}>
				{#if logos[technology]}
					<img
						class:monochrome={technology === 'Next.js'}
						class:muted-brand={technology === 'NGXS' || technology === 'OpenSearch'}
						src={`${base}/assets/${logos[technology]}.svg`}
						alt={technology}
						width={technology === 'NGXS' ? 40 : 20}
						height="20"
						loading="lazy"
						decoding="async"
					/>
				{:else if technology === 'SQL'}
					<Database size={20} role="img" aria-label={technology} />
				{:else if technology === 'CI/CD'}
					<Workflow size={20} role="img" aria-label={technology} />
				{:else}
					<Package size={20} role="img" aria-label={technology} />
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
		gap: 14px;
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
		min-height: 24px;
	}
	img {
		display: block;
		height: 20px;
		object-fit: contain;
	}
	:global(.dark) img.monochrome {
		filter: invert(1);
	}
	:global(.dark) img.muted-brand {
		filter: brightness(1.6);
	}
</style>
