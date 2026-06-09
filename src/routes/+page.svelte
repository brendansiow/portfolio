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
	import Activity from '$lib/components/Activity.svelte';
	import ResumePDF from '$lib/components/ResumePDF.svelte';
</script>

<Navigation />

<div id="portfolio-content" class="pb-24 pt-6 md:pb-28 md:pt-8">
	<section id="hero" class="pt-16">
		<Hero data={portfolioData.personalInfo} />
	</section>

	<section id="about" class="pt-20">
		<About data={portfolioData.personalInfo} />
	</section>

	<section id="experience" class="pt-20">
		<Experience data={portfolioData.workExperience} />
	</section>

	<section id="projects" class="pt-20">
		<Projects data={portfolioData.projects} />
	</section>

	<section id="activity" class="pt-20">
		<Activity />
	</section>

	<section id="education" class="pt-20">
		<Education education={portfolioData.education} certificates={portfolioData.certificates} />
	</section>

	<section id="skills" class="pt-20">
		<Skills data={portfolioData.skills} />
	</section>

	<section id="contact" class="pt-20">
		<Contact data={portfolioData.personalInfo} />
	</section>
</div>

<Footer />
<DownloadButton />

<!-- Resume PDF — hidden on screen, shown when printing -->
<div class="resume-offscreen">
	<ResumePDF />
</div>
