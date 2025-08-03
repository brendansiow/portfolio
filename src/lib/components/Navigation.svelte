<script lang="ts">
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
			<div class="hidden md:block">
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
			<div class="md:hidden">
				<button
					onclick={() => (isMenuOpen = !isMenuOpen)}
					class="text-white hover:text-blue-300 p-2 rounded-md"
				>
					<svg class="h-6 w-6" fill="none" viewBox="0 0 24 24" stroke="currentColor">
						{#if isMenuOpen}
							<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M6 18L18 6M6 6l12 12" />
						{:else}
							<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
						{/if}
					</svg>
				</button>
			</div>
		</div>

		<!-- Mobile Navigation -->
		{#if isMenuOpen}
			<div class="md:hidden pb-4">
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