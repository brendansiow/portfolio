<script>
  import Navigation from '$lib/components/Navigation.svelte';
  import About from '$lib/components/About.svelte';
  import Experience from '$lib/components/Experience.svelte';
  import Projects from '$lib/components/Projects.svelte';
  import Education from '$lib/components/Education.svelte';
  import Skills from '$lib/components/Skills.svelte';
  import Contact from '$lib/components/Contact.svelte';
  
  export let darkMode = false;
  export let toggleTheme = () => {};
</script>

<svelte:head>
  <title>Portfolio - John Doe</title>
  <meta name="description" content="Full Stack Developer with 5+ years of experience creating amazing digital experiences" />
</svelte:head>

<div class="relative">
  <!-- Navigation -->
  <Navigation {darkMode} on:theme-toggle={toggleTheme} />
  
  <!-- Main Content -->
  <main class="pt-16 md:pt-20">
    <!-- About Section -->
    <About />
    
    <!-- Experience Section -->
    <Experience />
    
    <!-- Projects Section -->
    <Projects />
    
    <!-- Education Section -->
    <Education />
    
    <!-- Skills Section -->
    <Skills />
    
    <!-- Contact Section -->
    <Contact />
  </main>
</div>