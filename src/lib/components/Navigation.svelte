<script lang="ts">
	import { onMount } from 'svelte';
	import { Menu } from 'lucide-svelte';
	import ThemeToggle from '$lib/components/ThemeToggle.svelte';
	import { portfolioData } from '$lib/data';
	const links = [
		{ id: 'about', label: 'About' },
		{ id: 'projects', label: 'Work' },
		{ id: 'experience', label: 'Experience' },
		{ id: 'skills', label: 'Skills' },
		{ id: 'activity', label: 'Activity' },
		{ id: 'contact', label: 'Contact' }
	];
	let active = $state('');
	let menuOpen = $state(false);
	let menu: HTMLDetailsElement;
	onMount(() => {
		const observer = new IntersectionObserver(
			(entries) => {
				for (const entry of entries) if (entry.isIntersecting) active = entry.target.id;
			},
			{ rootMargin: '-15% 0px -55% 0px', threshold: 0 }
		);
		for (const { id } of links) {
			const section = document.getElementById(id);
			if (section) observer.observe(section);
		}
		return () => observer.disconnect();
	});
	function closeMenu() {
		menuOpen = false;
		if (menu) menu.open = false;
	}
	function escapeMenu(event: KeyboardEvent) {
		if (event.key === 'Escape' && menu?.open) {
			closeMenu();
			event.preventDefault();
			menu.querySelector('summary')?.focus({ preventScroll: true });
		}
	}
</script>

<svelte:window onkeydown={escapeMenu} />
<header class="floating-header glass">
	<a class="brand" href="#top" aria-label={`${portfolioData.personalInfo.name} home`}
		><span class="brand-symbol">{portfolioData.personalInfo.initials}</span><span
			>{portfolioData.personalInfo.name}</span
		></a
	>
	<nav class="nav-links" aria-label="Main navigation">
		{#each links as link (link.id)}<a
				href={`#${link.id}`}
				aria-current={active === link.id ? 'location' : undefined}>{link.label}</a
			>{/each}
	</nav>
	<div class="nav-controls">
		<details class="mobile-nav" bind:open={menuOpen} bind:this={menu}>
			<summary aria-label="Navigation menu">Menu <Menu size={16} aria-hidden="true" /></summary>
			<nav class="mobile-links" aria-label="Mobile navigation">
				{#each links as link (link.id)}<a
						href={`#${link.id}`}
						onclick={closeMenu}
						aria-current={active === link.id ? 'location' : undefined}>{link.label}</a
					>{/each}
			</nav>
		</details>
		<ThemeToggle />
	</div>
</header>
