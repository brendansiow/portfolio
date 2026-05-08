<script lang="ts">
	import { onMount } from 'svelte';
	import {
		User,
		Briefcase,
		FolderGit,
		GraduationCap,
		Wrench,
		Mail,
		Menu,
		X,
		ArrowUp
	} from 'lucide-svelte';

	let isMenuOpen = $state(false);
	let showScrollTop = $state(false);

	const navItems = [
		{ href: '#about', label: 'About', icon: User },
		{ href: '#experience', label: 'Exp', icon: Briefcase },
		{ href: '#projects', label: 'Work', icon: FolderGit },
		{ href: '#education', label: 'Edu', icon: GraduationCap },
		{ href: '#skills', label: 'Skills', icon: Wrench },
		{ href: '#contact', label: 'Contact', icon: Mail }
	];

	function scrollToSection(href: string) {
		const element = document.querySelector(href);
		element?.scrollIntoView({ behavior: 'smooth' });
		isMenuOpen = false;
	}

	function scrollToTop() {
		window.scrollTo({ top: 0, behavior: 'smooth' });
	}

	onMount(() => {
		const handleScroll = () => {
			showScrollTop = window.scrollY > 400;
		};
		window.addEventListener('scroll', handleScroll, { passive: true });
		return () => window.removeEventListener('scroll', handleScroll);
	});
</script>

<!-- Desktop floating dock -->
<nav class="fixed bottom-5 left-1/2 z-50 hidden -translate-x-1/2 md:block">
	<div class="glass-strong flex items-center gap-1 rounded-full px-3 py-2">
		<button
			onclick={scrollToTop}
			class="rounded-full p-2.5 text-sm font-medium text-slate-600 transition hover:bg-white/35 hover:text-slate-900 dark:text-slate-300 dark:hover:bg-slate-700/35 dark:hover:text-slate-100"
			aria-label="Back to top"
			title="Back to top"
		>
			<ArrowUp class="h-4 w-4" />
		</button>

		<div class="mx-1 h-4 w-px bg-white/25 dark:bg-slate-700/40"></div>

		{#each navItems as item}
			<button
				onclick={() => scrollToSection(item.href)}
				class="flex items-center gap-2 rounded-full px-3.5 py-2 text-sm font-medium text-slate-600 transition hover:bg-white/35 hover:text-slate-900 dark:text-slate-300 dark:hover:bg-slate-700/35 dark:hover:text-slate-100"
				title={item.label}
			>
				<item.icon class="h-4 w-4" />
				<span class="hidden lg:inline">{item.label}</span>
			</button>
		{/each}
	</div>
</nav>

<!-- Mobile bottom bar -->
<nav class="fixed bottom-4 left-4 right-4 z-50 md:hidden">
	<div class="glass-strong flex items-center justify-between rounded-full px-3 py-2">
		<button
			onclick={scrollToTop}
			class="rounded-full p-2.5 text-slate-600 transition hover:bg-white/35 dark:text-slate-300"
			aria-label="Back to top"
		>
			<ArrowUp class="h-4 w-4" />
		</button>

		<div class="flex items-center gap-1">
			{#each navItems.slice(0, 4) as item}
				<button
					onclick={() => scrollToSection(item.href)}
					class="rounded-full p-2.5 text-slate-600 transition hover:bg-white/35 dark:text-slate-300"
					aria-label={item.label}
				>
					<item.icon class="h-4 w-4" />
				</button>
			{/each}
		</div>

		<button
			onclick={() => (isMenuOpen = !isMenuOpen)}
			class="rounded-full p-2.5 text-slate-600 transition hover:bg-white/35 dark:text-slate-300"
			aria-label="Menu"
		>
			{#if isMenuOpen}
				<X class="h-4 w-4" />
			{:else}
				<Menu class="h-4 w-4" />
			{/if}
		</button>
	</div>

	{#if isMenuOpen}
		<div class="glass mt-2 rounded-2xl p-2">
			{#each navItems as item}
				<button
					onclick={() => scrollToSection(item.href)}
					class="flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm font-medium text-slate-700 hover:bg-white/45 dark:text-slate-200 dark:hover:bg-slate-700/40"
				>
					<item.icon class="h-4 w-4" />
					{item.label}
				</button>
			{/each}
		</div>
	{/if}
</nav>
