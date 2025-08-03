<script lang="ts">
	import { portfolioData } from '$lib/data';
	import Hero from '$lib/components/Hero.svelte';
	import About from '$lib/components/About.svelte';
	import Experience from '$lib/components/Experience.svelte';
	import Projects from '$lib/components/Projects.svelte';
	import Education from '$lib/components/Education.svelte';
	import Skills from '$lib/components/Skills.svelte';
	import Contact from '$lib/components/Contact.svelte';
	import Navigation from '$lib/components/Navigation.svelte';
	import Footer from '$lib/components/Footer.svelte';
	import DownloadButton from '$lib/components/DownloadButton.svelte';
</script>

<!-- Background with animated gradient -->
<div class="min-h-screen animated-gradient">
	<!-- Navigation -->
	<Navigation />
	
	<!-- Portfolio Content -->
	<div id="portfolio-content">
		<!-- Hero Section -->
		<section id="hero">
			<Hero data={portfolioData.personalInfo} />
		</section>
		
		<!-- About Section -->
		<section id="about" class="py-20">
			<About data={portfolioData.personalInfo} />
		</section>
		
		<!-- Experience Section -->
		<section id="experience" class="py-20">
			<Experience data={portfolioData.workExperience} />
		</section>
		
		<!-- Projects Section -->
		<section id="projects" class="py-20">
			<Projects data={portfolioData.projects} />
		</section>
		
		<!-- Education & Certificates Section -->
		<section id="education" class="py-20">
			<Education 
				education={portfolioData.education} 
				certificates={portfolioData.certificates} 
			/>
		</section>
		
		<!-- Skills Section -->
		<section id="skills" class="py-20">
			<Skills data={portfolioData.skills} />
		</section>
		
		<!-- Contact Section -->
		<section id="contact" class="py-20">
			<Contact data={portfolioData.personalInfo} />
		</section>
	</div>
	
	<!-- Footer -->
	<Footer />
	
	<!-- Download Resume Button -->
	<DownloadButton />
</div>
