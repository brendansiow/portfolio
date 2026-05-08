<script lang="ts">
	import { Mail, MapPin, Github, Linkedin, ArrowUp } from 'lucide-svelte';
	import { portfolioData } from '$lib/data';

	const currentYear = new Date().getFullYear();
	const { personalInfo } = portfolioData;
</script>

<footer class="section-shell mt-20 pb-10">
	<div class="glass rounded-[1.75rem] border-white/30 px-6 py-8 md:px-8">
		<div class="grid gap-8 md:grid-cols-3">
			<div>
				<h3 class="text-xl font-semibold text-slate-900 dark:text-slate-100">Portfolio</h3>
				<p class="mt-3 text-sm leading-7 text-slate-600 dark:text-slate-300">
					Intentional products, clean interfaces, and engineering that scales with your roadmap.
				</p>
				<p class="mt-3 text-xs text-slate-500 dark:text-slate-400">
					Built with SvelteKit and Tailwind CSS.
				</p>
			</div>

			<div>
				<h4 class="text-base font-semibold text-slate-900 dark:text-slate-100">Quick Links</h4>
				<div class="mt-4 space-y-2">
					{#each [{ href: '#about', label: 'About' }, { href: '#experience', label: 'Experience' }, { href: '#projects', label: 'Projects' }, { href: '#skills', label: 'Skills' }, { href: '#contact', label: 'Contact' }] as link}
						<button
							onclick={() => {
								const element = document.querySelector(link.href);
								element?.scrollIntoView({ behavior: 'smooth' });
							}}
							class="block text-sm text-slate-600 transition hover:text-slate-900 dark:text-slate-300 dark:hover:text-slate-100"
						>
							{link.label}
						</button>
					{/each}
				</div>
			</div>

			<div>
				<h4 class="text-base font-semibold text-slate-900 dark:text-slate-100">Get In Touch</h4>
				<div class="mt-4 space-y-3">
					<div class="flex items-center text-sm text-slate-600 dark:text-slate-300">
						<Mail class="mr-2 h-4 w-4" />
						<span class="text-sm">{personalInfo.email}</span>
					</div>

					<div class="flex items-center text-sm text-slate-600 dark:text-slate-300">
						<MapPin class="mr-2 h-4 w-4" />
						<span class="text-sm">{personalInfo.location}</span>
					</div>
				</div>

				<div class="mt-5 flex space-x-3">
					<a
						href={personalInfo.github}
						target="_blank"
						rel="noopener noreferrer"
						class="flex h-8 w-8 items-center justify-center rounded-full bg-white/40 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-100"
						aria-label="Visit GitHub profile"
					>
						<Github class="h-4 w-4" />
					</a>

					<a
						href={personalInfo.linkedin}
						target="_blank"
						rel="noopener noreferrer"
						class="flex h-8 w-8 items-center justify-center rounded-full bg-white/40 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-100"
						aria-label="Visit LinkedIn profile"
					>
						<Linkedin class="h-4 w-4" />
					</a>
				</div>
			</div>
		</div>

		<div
			class="mt-8 flex flex-col items-center justify-between border-t border-white/25 pt-6 dark:border-slate-700/40 md:flex-row"
		>
			<p class="text-xs text-slate-500 dark:text-slate-400">
				© {currentYear} Portfolio. All rights reserved.
			</p>

			<div class="mt-4 flex items-center space-x-4 md:mt-0">
				<button
					onclick={() => {
						window.scrollTo({ top: 0, behavior: 'smooth' });
					}}
					class="flex items-center text-sm text-slate-600 transition hover:text-slate-900 dark:text-slate-300 dark:hover:text-slate-100"
				>
					<ArrowUp class="mr-1 h-4 w-4" />
					Back to top
				</button>
			</div>
		</div>
	</div>
</footer>
