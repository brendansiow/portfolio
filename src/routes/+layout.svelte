<script lang="ts">
  import '../app.css';
  import { onMount } from 'svelte';

  let darkMode: boolean = false;

  onMount(() => {
    // Check for saved theme preference or default to light mode
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme) {
      darkMode = savedTheme === 'dark';
    } else {
      darkMode = window.matchMedia('(prefers-color-scheme: dark)').matches;
    }
    updateTheme();
  });

  function toggleTheme(): void {
    darkMode = !darkMode;
    updateTheme();
    localStorage.setItem('theme', darkMode ? 'dark' : 'light');
  }

  function updateTheme(): void {
    if (darkMode) {
      document.documentElement.classList.add('dark');
    } else {
      document.documentElement.classList.remove('dark');
    }
  }
</script>

<svelte:head>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com">
</svelte:head>

<div class="min-h-screen bg-gradient-to-br from-blue-50 via-indigo-50 to-purple-50 dark:from-gray-900 dark:via-blue-900 dark:to-indigo-900 transition-colors duration-300">
  <slot {darkMode} {toggleTheme} />
</div>