<script lang="ts">
	import type { PersonalInfo } from '$lib/types';
	import { ArrowUpRight } from 'lucide-svelte';
	let { data }: { data: PersonalInfo } = $props();
</script>

<div class="shell">
	<div class="contact-section">
		<div>
			<span class="eyebrow">05 / Get in touch</span>
			<h2>Let’s build<br />something useful.</h2>
			<p>Have a project, a role, or a question in mind? Let’s talk.</p>
			<div class="contact-links">
				<a href={data.linkedin} target="_blank" rel="noopener noreferrer">LinkedIn ↗</a><a
					href={data.github}
					target="_blank"
					rel="noopener noreferrer">GitHub ↗</a
				>
			</div>
		</div>
		<a class="button primary" href={`mailto:${data.email}`}
			>Say hello <ArrowUpRight size={18} aria-hidden="true" /></a
		>
	</div>
</div>
