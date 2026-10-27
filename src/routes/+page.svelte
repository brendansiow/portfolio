<script lang="ts">
	import { portfolioData } from '$lib/data';
	import Navigation from '$lib/components/Navigation.svelte';
	import Hero from '$lib/components/Hero.svelte';
	import Projects from '$lib/components/Projects.svelte';
	import Experience from '$lib/components/Experience.svelte';
	import Skills from '$lib/components/Skills.svelte';
	import Activity from '$lib/components/Activity.svelte';
	import Contact from '$lib/components/Contact.svelte';
	import Footer from '$lib/components/Footer.svelte';
</script>

<Navigation />
<div class="page-main">
	<Hero data={portfolioData.personalInfo} experience={portfolioData.workExperience} />
	<section id="projects"><Projects data={portfolioData.projects} /></section>
	<section id="experience"><Experience data={portfolioData.workExperience} /></section>
	<section id="skills"><Skills data={portfolioData.skills} /></section>
	<section id="activity"><Activity /></section>
	<section id="contact"><Contact data={portfolioData.personalInfo} /></section>
	<Footer />
</div>
