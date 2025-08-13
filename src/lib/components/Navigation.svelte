<script lang="ts">
	import { Menu, X } from 'lucide-svelte';

	let isMenuOpen = $state(false);

	const navItems = [
		{ href: '#about', label: 'About' },
		{ href: '#experience', label: 'Experience' },
		{ href: '#projects', label: 'Projects' },
		{ href: '#education', label: 'Education' },
		{ href: '#skills', label: 'Skills' },
		{ href: '#contact', label: 'Contact' }
	];

	function scrollToSection(href: string) {
		const element = document.querySelector(href);
		element?.scrollIntoView({ behavior: 'smooth' });
		isMenuOpen = false;
	}
</script>

<nav class="fixed top-0 left-0 right-0 z-50 glass border-b border-white/10">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
		<div class="flex justify-between items-center py-4">
			<!-- Logo -->
			<div class="flex-shrink-0">
				<button
					onclick={() => scrollToSection('#hero')}
					class="text-2xl font-bold text-white hover:text-blue-300 transition-colors"
				>
					Portfolio
				</button>
			</div>

			<!-- Desktop Navigation -->
			<div class="desktop-nav">
				<div class="ml-10 flex items-baseline space-x-4">
					{#each navItems as item}
						<button
							onclick={() => scrollToSection(item.href)}
							class="text-white hover:text-blue-300 px-3 py-2 rounded-md text-sm font-medium transition-colors"
						>
							{item.label}
						</button>
					{/each}
				</div>
			</div>

			<!-- Mobile menu button -->
			<div class="mobile-menu-button">
				<button
					onclick={() => (isMenuOpen = !isMenuOpen)}
					class="text-white hover:text-blue-300 p-2 rounded-md"
				>
					{#if isMenuOpen}
						<X class="h-6 w-6" />
					{:else}
						<Menu class="h-6 w-6" />
					{/if}
				</button>
			</div>
		</div>

		<!-- Mobile Navigation -->
		{#if isMenuOpen}
			<div class="mobile-nav pb-4">
				<div class="px-2 pt-2 pb-3 space-y-1">
					{#each navItems as item}
						<button
							onclick={() => scrollToSection(item.href)}
							class="text-white hover:text-blue-300 block px-3 py-2 rounded-md text-base font-medium w-full text-left transition-colors"
						>
							{item.label}
						</button>
					{/each}
				</div>
			</div>
		{/if}
	</div>
</nav>

<style>
	/* Responsive navigation styles */
	@media (min-width: 1024px) {
		.desktop-nav {
			display: block;
		}
		.mobile-menu-button {
			display: none;
		}
		.mobile-nav {
			display: none;
		}
	}

	@media (max-width: 1023px) {
		.desktop-nav {
			display: none;
		}
		.mobile-menu-button {
			display: block;
		}
		.mobile-nav {
			display: block;
		}
	}
</style>