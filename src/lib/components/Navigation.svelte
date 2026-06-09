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
		ArrowUp,
		Flame
	} from 'lucide-svelte';

	let isMenuOpen = $state(false);
	let showScrollTop = $state(false);
	let activeSection = $state<string>('');

	// Refs for bubble positioning
	let navContainerRef: HTMLDivElement;
	let itemsContainerRef: HTMLDivElement;
	let bubbleRef: HTMLDivElement;
	let buttonRefs: (HTMLButtonElement | null)[] = $state([]);
	let bubbleStyle = $state('opacity: 0;');

	const navItems = [
		{ href: '#about', label: 'About', icon: User },
		{ href: '#experience', label: 'Exp', icon: Briefcase },
		{ href: '#projects', label: 'Work', icon: FolderGit },
		{ href: '#activity', label: 'Activity', icon: Flame },
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

	// Update bubble position when active section changes
	function updateBubble() {
		if (!activeSection || !itemsContainerRef) {
			bubbleStyle = 'opacity: 0;';
			return;
		}

		const activeIndex = navItems.findIndex((item) => item.href === `#${activeSection}`);
		if (activeIndex === -1 || !buttonRefs[activeIndex]) {
			bubbleStyle = 'opacity: 0;';
			return;
		}

		const container = itemsContainerRef.getBoundingClientRect();
		const button = buttonRefs[activeIndex]!.getBoundingClientRect();

		const left = button.left - container.left;
		const width = button.width;
		const height = button.height;
		const top = button.top - container.top;

		bubbleStyle = `transform: translate3d(${left}px, ${top}px, 0); width: ${width}px; height: ${height}px; opacity: 1;`;
	}

	// Reactive: update bubble whenever activeSection or refs change
	$effect(() => {
		// Touch these to make the effect reactive
		activeSection;
		buttonRefs;
		// Schedule update after DOM paint
		requestAnimationFrame(() => {
			requestAnimationFrame(updateBubble);
		});
	});

	onMount(() => {
		const handleScroll = () => {
			showScrollTop = window.scrollY > 400;
		};
		window.addEventListener('scroll', handleScroll, { passive: true });

		// IntersectionObserver to track active section
		const observer = new IntersectionObserver(
			(entries) => {
				entries.forEach((entry) => {
					if (entry.isIntersecting) {
						activeSection = entry.target.id;
					}
				});
			},
			{
				rootMargin: '-10% 0px -55% 0px',
				threshold: 0
			}
		);

		// Observe all section elements
		navItems.forEach((item) => {
			const section = document.querySelector(item.href);
			if (section) observer.observe(section);
		});

		// Also observe hero area for "top" state
		const hero = document.querySelector('#hero');
		if (hero) {
			observer.observe(hero);
		}

		// Handle window resize to recalculate bubble
		window.addEventListener('resize', updateBubble);

		// Initial bubble position
		updateBubble();

		return () => {
			window.removeEventListener('scroll', handleScroll);
			window.removeEventListener('resize', updateBubble);
			observer.disconnect();
		};
	});
</script>

<!-- Desktop floating dock -->
<nav class="fixed bottom-5 left-1/2 z-50 hidden -translate-x-1/2 md:block">
	<div
		bind:this={navContainerRef}
		class="glass-strong relative flex items-center gap-1 rounded-full px-3 py-2"
	>
		<!-- Active bubble pill -->
		<div
			bind:this={bubbleRef}
			class="pointer-events-none absolute rounded-full bg-white/70 shadow-[0_2px_8px_rgba(15,23,42,0.1)] ring-1 ring-white/50 backdrop-blur-md transition-[transform,width,height,opacity] duration-300 ease-[cubic-bezier(0.25,0.1,0.25,1)] dark:bg-slate-700/60 dark:ring-slate-500/30"
			style={bubbleStyle}
		></div>

		<button
			onclick={scrollToTop}
			class="relative z-10 rounded-full p-2.5 text-sm font-medium text-slate-500 transition hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-100"
			aria-label="Back to top"
			title="Back to top"
		>
			<ArrowUp class="h-4 w-4" />
		</button>

		<div class="relative z-10 mx-1 h-4 w-px bg-white/25 dark:bg-slate-700/40"></div>

		<div bind:this={itemsContainerRef} class="relative flex items-center gap-1">
			{#each navItems as item, i}
				<button
					bind:this={buttonRefs[i]}
					onclick={() => scrollToSection(item.href)}
					class="relative z-10 flex items-center gap-2 rounded-full px-3.5 py-2 text-sm font-medium transition-colors {activeSection === item.href.slice(1) ? 'text-slate-900 dark:text-slate-100' : 'text-slate-500 hover:text-slate-700 dark:text-slate-400 dark:hover:text-slate-200'}"
					title={item.label}
				>
					<item.icon class="h-4 w-4" />
					<span class="hidden lg:inline">{item.label}</span>
				</button>
			{/each}
		</div>
	</div>
</nav>

<!-- Mobile bottom bar -->
<nav class="fixed bottom-4 left-4 right-4 z-50 md:hidden">
	<div class="glass-strong relative flex items-center justify-between rounded-full px-3 py-2">
		<!-- Mobile active bubble -->
		{#if activeSection}
			{@const activeIdx = navItems.findIndex((item) => item.href === `#${activeSection}`)}
			{#if activeIdx !== -1 && activeIdx < 4}
				<div
					class="pointer-events-none absolute rounded-full bg-white/60 shadow-sm ring-1 ring-white/50 backdrop-blur-md transition-all duration-300 ease-[cubic-bezier(0.25,0.1,0.25,1)] dark:bg-slate-700/60 dark:ring-slate-500/30"
					style="left: calc(50% + {(activeIdx - 1.5) * 44}px); width: 40px; height: 40px; top: 6px;"
				></div>
			{/if}
		{/if}

		<button
			onclick={scrollToTop}
			class="relative z-10 rounded-full p-2.5 text-slate-500 transition hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-100"
			aria-label="Back to top"
		>
			<ArrowUp class="h-4 w-4" />
		</button>

		<div class="relative z-10 flex items-center gap-1">
			{#each navItems.slice(0, 4) as item}
				<button
					onclick={() => scrollToSection(item.href)}
					class="relative z-10 rounded-full p-2.5 text-slate-500 transition hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-100 {activeSection === item.href.slice(1) ? 'text-slate-900 dark:text-slate-100' : ''}"
					aria-label={item.label}
				>
					<item.icon class="h-4 w-4" />
				</button>
			{/each}
		</div>

		<button
			onclick={() => (isMenuOpen = !isMenuOpen)}
			class="relative z-10 rounded-full p-2.5 text-slate-500 transition hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-100"
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
					class="flex w-full items-center gap-3 rounded-xl px-3 py-2.5 text-left text-sm font-medium transition-colors {activeSection === item.href.slice(1) ? 'bg-white/50 text-slate-900 dark:bg-slate-700/50 dark:text-slate-100' : 'text-slate-600 hover:bg-white/35 dark:text-slate-300 dark:hover:bg-slate-700/40'}"
				>
					<item.icon class="h-4 w-4" />
					{item.label}
				</button>
			{/each}
		</div>
	{/if}
</nav>
