<script lang="ts">
	import { Mail, MapPin, Github, Linkedin, ArrowUp } from 'lucide-svelte';
	
	const currentYear = new Date().getFullYear();
</script>

<footer class="glass border-t border-white/10 mt-20">
	<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-12">
		<div class="grid md:grid-cols-3 gap-8">
			<!-- Brand Section -->
			<div>
				<h3 class="text-2xl font-bold text-white mb-4">Portfolio</h3>
				<p class="text-white/70 mb-4">
					Passionate developer creating innovative web solutions with modern technologies.
				</p>
				<p class="text-white/50 text-sm">
					Built with ❤️ using SvelteKit & TailwindCSS
				</p>
			</div>

			<!-- Quick Links -->
			<div>
				<h4 class="text-lg font-semibold text-white mb-4">Quick Links</h4>
				<div class="space-y-2">
					{#each [
						{ href: '#about', label: 'About' },
						{ href: '#experience', label: 'Experience' },
						{ href: '#projects', label: 'Projects' },
						{ href: '#skills', label: 'Skills' },
						{ href: '#contact', label: 'Contact' }
					] as link}
						<button
							onclick={() => {
								const element = document.querySelector(link.href);
								element?.scrollIntoView({ behavior: 'smooth' });
							}}
							class="block text-white/70 hover:text-white transition-colors"
						>
							{link.label}
						</button>
					{/each}
				</div>
			</div>

			<!-- Contact Info -->
			<div>
				<h4 class="text-lg font-semibold text-white mb-4">Get In Touch</h4>
				<div class="space-y-3">
					<div class="flex items-center text-white/70">
						<Mail class="w-4 h-4 mr-2" />
						<span class="text-sm">your.email@example.com</span>
					</div>
					
					<div class="flex items-center text-white/70">
						<MapPin class="w-4 h-4 mr-2" />
						<span class="text-sm">Your City, Country</span>
					</div>
				</div>

				<!-- Social Links -->
				<div class="flex space-x-4 mt-6">
					<a 
						href="https://github.com/yourusername" 
						target="_blank" 
						rel="noopener noreferrer"
						class="w-8 h-8 bg-white/10 rounded-lg flex items-center justify-center text-white/70 hover:text-white hover:bg-white/20 transition-all duration-300"
						aria-label="Visit GitHub profile"
					>
						<Github class="w-4 h-4" />
					</a>
					
					<a 
						href="https://linkedin.com/in/yourprofile" 
						target="_blank" 
						rel="noopener noreferrer"
						class="w-8 h-8 bg-white/10 rounded-lg flex items-center justify-center text-white/70 hover:text-white hover:bg-white/20 transition-all duration-300"
						aria-label="Visit LinkedIn profile"
					>
						<Linkedin class="w-4 h-4" />
					</a>
				</div>
			</div>
		</div>

		<!-- Bottom Bar -->
		<div class="border-t border-white/10 mt-8 pt-8 flex flex-col md:flex-row justify-between items-center">
			<p class="text-white/60 text-sm">
				© {currentYear} Portfolio. All rights reserved.
			</p>
			
			<div class="flex items-center space-x-4 mt-4 md:mt-0">
				<button
					onclick={() => {
						window.scrollTo({ top: 0, behavior: 'smooth' });
					}}
					class="flex items-center text-white/70 hover:text-white transition-colors text-sm"
				>
					<ArrowUp class="w-4 h-4 mr-1" />
					Back to top
				</button>
			</div>
		</div>
	</div>
</footer>