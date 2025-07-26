<script>
  import Navigation from '$lib/components/Navigation.svelte';
  import About from '$lib/components/About.svelte';
  
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
    
    <!-- Placeholder sections for future migration -->
    <section id="experience" class="min-h-screen flex items-center justify-center bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <h2 class="text-4xl font-bold text-gray-900 dark:text-white mb-4">Experience</h2>
        <p class="text-gray-600 dark:text-gray-400">Coming soon...</p>
      </div>
    </section>
    
    <section id="projects" class="min-h-screen flex items-center justify-center">
      <div class="text-center">
        <h2 class="text-4xl font-bold text-gray-900 dark:text-white mb-4">Projects</h2>
        <p class="text-gray-600 dark:text-gray-400">Coming soon...</p>
      </div>
    </section>
    
    <section id="education" class="min-h-screen flex items-center justify-center bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <h2 class="text-4xl font-bold text-gray-900 dark:text-white mb-4">Education</h2>
        <p class="text-gray-600 dark:text-gray-400">Coming soon...</p>
      </div>
    </section>
    
    <section id="skills" class="min-h-screen flex items-center justify-center">
      <div class="text-center">
        <h2 class="text-4xl font-bold text-gray-900 dark:text-white mb-4">Skills</h2>
        <p class="text-gray-600 dark:text-gray-400">Coming soon...</p>
      </div>
    </section>
    
    <section id="contact" class="min-h-screen flex items-center justify-center bg-gray-50 dark:bg-gray-800">
      <div class="text-center">
        <h2 class="text-4xl font-bold text-gray-900 dark:text-white mb-4">Contact</h2>
        <p class="text-gray-600 dark:text-gray-400">Coming soon...</p>
      </div>
    </section>
  </main>
</div>