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
	let header: HTMLElement;
	let requestedSection: string | undefined;
	let settleTimer: ReturnType<typeof setTimeout>;
	function releaseRequestedSection() {
		requestedSection = undefined;
		clearTimeout(settleTimer);
	}
	function activateSection(id: string) {
		active = id;
		requestedSection = id;
		clearTimeout(settleTimer);
		settleTimer = setTimeout(releaseRequestedSection, 150);
	}
	onMount(() => {
		const sections = links.flatMap(({ id }) => {
			const element = document.getElementById(id);
			return element ? [element] : [];
		});
		let frame = 0;
		function updateActiveSection() {
			frame = 0;
			if (requestedSection) return;
			const headerBottom = header.getBoundingClientRect().bottom;
			const remaining = Math.max(0, document.documentElement.scrollHeight - innerHeight - scrollY);
			const startLine = Math.max(headerBottom + 24, innerHeight * 0.3);
			// Advance the reading line near the bottom so short final sections are reachable
			// even when the browser cannot scroll their headings up to the floating header.
			const endProgress = Math.max(0, 1 - remaining / innerHeight);
			const readingLine = startLine + endProgress * (innerHeight - startLine);
			let current = sections[0]?.id || '';
			for (const section of sections) {
				if (section.getBoundingClientRect().top <= readingLine + 1) current = section.id;
			}
			active = current;
		}
		function scheduleUpdate() {
			if (!frame) frame = requestAnimationFrame(updateActiveSection);
		}
		function onScroll() {
			// Keep an explicitly chosen tab selected until native smooth scrolling finishes.
			if (requestedSection) {
				clearTimeout(settleTimer);
				settleTimer = setTimeout(releaseRequestedSection, 150);
			}
			scheduleUpdate();
		}
		function manualScroll() {
			releaseRequestedSection();
			scheduleUpdate();
		}
		function onScrollKey(event: KeyboardEvent) {
			if (['ArrowUp', 'ArrowDown', 'PageUp', 'PageDown', 'Home', 'End', ' '].includes(event.key))
				manualScroll();
		}
		function onHashChange() {
			const id = location.hash.slice(1);
			if (sections.some((section) => section.id === id)) activateSection(id);
			else if (id === 'top' || !id) activateSection('about');
		}
		window.addEventListener('scroll', onScroll, { passive: true });
		window.addEventListener('resize', scheduleUpdate);
		window.addEventListener('wheel', manualScroll, { passive: true });
		window.addEventListener('touchmove', manualScroll, { passive: true });
		window.addEventListener('pointerdown', manualScroll, { passive: true });
		window.addEventListener('keydown', onScrollKey);
		window.addEventListener('hashchange', onHashChange);
		const resizeObserver = new ResizeObserver(scheduleUpdate);
		resizeObserver.observe(document.body);
		if (location.hash) onHashChange();
		scheduleUpdate();
		return () => {
			window.removeEventListener('scroll', onScroll);
			window.removeEventListener('resize', scheduleUpdate);
			window.removeEventListener('wheel', manualScroll);
			window.removeEventListener('touchmove', manualScroll);
			window.removeEventListener('pointerdown', manualScroll);
			window.removeEventListener('keydown', onScrollKey);
			window.removeEventListener('hashchange', onHashChange);
			resizeObserver.disconnect();
			cancelAnimationFrame(frame);
			clearTimeout(settleTimer);
		};
	});
	function closeMenu() {
		menuOpen = false;
		if (menu) menu.open = false;
	}
	function dismissMenu(event: PointerEvent) {
		if (menu?.open && event.target instanceof Node && !menu.contains(event.target)) closeMenu();
	}
	function selectSection(id: string) {
		activateSection(id);
		closeMenu();
		document.getElementById(id)?.focus({ preventScroll: true });
	}
	function escapeMenu(event: KeyboardEvent) {
		if (event.key === 'Escape' && menu?.open) {
			closeMenu();
			event.preventDefault();
			menu.querySelector('summary')?.focus({ preventScroll: true });
		}
	}
</script>

<svelte:window onkeydown={escapeMenu} onpointerdown={dismissMenu} />
<header class="floating-header glass" bind:this={header}>
	<a class="brand" href="#top" aria-label={`${portfolioData.personalInfo.name} home`}>
		<span class="brand-avatar" aria-hidden="true">{portfolioData.personalInfo.initials}</span>
		<span class="brand-name">{portfolioData.personalInfo.name}</span>
	</a>
	<nav class="nav-links" aria-label="Main navigation">
		{#each links as link (link.id)}<a
				href={`#${link.id}`}
				onclick={() => activateSection(link.id)}
				aria-current={active === link.id ? 'location' : undefined}>{link.label}</a
			>{/each}
	</nav>
	<div class="nav-controls">
		<details class="mobile-nav" bind:open={menuOpen} bind:this={menu}>
			<summary aria-label="Navigation menu">Menu <Menu size={16} aria-hidden="true" /></summary>
			<nav class="mobile-links" aria-label="Mobile navigation">
				{#each links as link (link.id)}<a
						href={`#${link.id}`}
						onclick={() => selectSection(link.id)}
						aria-current={active === link.id ? 'location' : undefined}>{link.label}</a
					>{/each}
			</nav>
		</details>
		<ThemeToggle />
	</div>
</header>
