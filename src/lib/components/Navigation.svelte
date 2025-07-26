<script>
  import { createEventDispatcher } from 'svelte';
  import { Sun, Moon, Menu, X, User, Briefcase, Code, GraduationCap, Star, Mail } from 'lucide-svelte';

  export let darkMode = false;

  const dispatch = createEventDispatcher();
  let mobileMenuOpen = false;

  function scrollToSection(sectionId) {
    const element = document.getElementById(sectionId);
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
    mobileMenuOpen = false;
  }

  function handleThemeToggle() {
    dispatch('theme-toggle');
  }

  function handleContactClick() {
    scrollToSection('contact');
  }

  const navItems = [
    { label: 'About', id: 'about', icon: User },
    { label: 'Experience', id: 'experience', icon: Briefcase },
    { label: 'Projects', id: 'projects', icon: Code },
    { label: 'Education', id: 'education', icon: GraduationCap },
    { label: 'Skills', id: 'skills', icon: Star }
  ];
</script>

<nav class="fixed top-0 left-0 right-0 z-50 glass border-b border-white/20 dark:border-white/10">
  <div class="container mx-auto px-4 sm:px-6 lg:px-8">
    <div class="flex items-center justify-between h-16 md:h-20">
      <!-- Logo -->
      <div class="flex-shrink-0">
        <h1 class="text-xl md:text-2xl font-bold gradient-text">
          PORTFOLIO
        </h1>
      </div>

      <!-- Desktop Navigation -->
      <div class="hidden md:block">
        <div class="flex items-center space-x-8">
          {#each navItems as item}
            <button
              on:click={() => scrollToSection(item.id)}
              class="text-gray-700 dark:text-gray-300 hover:text-primary-600 dark:hover:text-primary-400 
                     px-3 py-2 rounded-md text-sm font-medium transition-colors duration-200
                     hover:bg-white/10 dark:hover:bg-white/5"
            >
              {item.label}
            </button>
          {/each}
          
          <!-- Theme Toggle -->
          <button
            on:click={handleThemeToggle}
            class="p-2 rounded-full glass hover:bg-white/20 dark:hover:bg-white/10 
                   transition-all duration-200 transform hover:scale-105"
            aria-label="Toggle theme"
          >
            {#if darkMode}
              <Sun class="w-5 h-5 text-yellow-500" />
            {:else}
              <Moon class="w-5 h-5 text-slate-600" />
            {/if}
          </button>

          <!-- Contact Button -->
          <button
            on:click={handleContactClick}
            class="bg-primary-600 hover:bg-primary-700 text-white px-6 py-2 rounded-full
                   transition-all duration-200 transform hover:scale-105 hover:shadow-lg
                   font-medium text-sm"
          >
            Contact
          </button>
        </div>
      </div>

      <!-- Mobile menu button -->
      <div class="md:hidden flex items-center space-x-2">
        <!-- Theme Toggle Mobile -->
        <button
          on:click={handleThemeToggle}
          class="p-2 rounded-full glass hover:bg-white/20 dark:hover:bg-white/10 
                 transition-all duration-200"
          aria-label="Toggle theme"
        >
          {#if darkMode}
            <Sun class="w-5 h-5 text-yellow-500" />
          {:else}
            <Moon class="w-5 h-5 text-slate-600" />
          {/if}
        </button>

        <!-- Menu Toggle -->
        <button
          on:click={() => mobileMenuOpen = !mobileMenuOpen}
          class="p-2 rounded-full glass hover:bg-white/20 dark:hover:bg-white/10 
                 transition-all duration-200"
          aria-label="Toggle menu"
        >
          {#if mobileMenuOpen}
            <X class="w-5 h-5 text-gray-700 dark:text-gray-300" />
          {:else}
            <Menu class="w-5 h-5 text-gray-700 dark:text-gray-300" />
          {/if}
        </button>
      </div>
    </div>

    <!-- Mobile Navigation Menu -->
    {#if mobileMenuOpen}
      <div class="md:hidden border-t border-white/20 dark:border-white/10 bg-white/30 dark:bg-gray-900/30 backdrop-blur-lg">
        <div class="px-2 pt-2 pb-3 space-y-1">
          {#each navItems as item}
            <button
              on:click={() => scrollToSection(item.id)}
              class="w-full text-left flex items-center px-3 py-3 rounded-md text-base font-medium
                     text-gray-700 dark:text-gray-300 hover:text-primary-600 dark:hover:text-primary-400
                     hover:bg-white/20 dark:hover:bg-white/10 transition-colors duration-200"
            >
              <svelte:component this={item.icon} class="w-5 h-5 mr-3 text-primary-600 dark:text-primary-400" />
              {item.label}
            </button>
          {/each}
          
          <!-- Mobile Contact Button -->
          <button
            on:click={handleContactClick}
            class="w-full flex items-center justify-center mt-4 bg-primary-600 hover:bg-primary-700 
                   text-white px-4 py-3 rounded-full font-medium transition-all duration-200"
          >
            <Mail class="w-5 h-5 mr-2" />
            Contact
          </button>
        </div>
      </div>
    {/if}
  </div>
</nav>