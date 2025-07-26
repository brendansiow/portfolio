<script>
  import { ExternalLink, Github, Monitor } from 'lucide-svelte';

  const projects = [
    {
      title: 'E-Commerce Platform',
      description: 'A full-stack e-commerce solution built with React, Node.js, and MongoDB. Features include user authentication, payment integration, and admin dashboard.',
      technologies: ['React.js', 'Node.js', 'MongoDB', 'Stripe API', 'AWS'],
      liveUrl: '#',
      githubUrl: '#',
      gradient: 'from-blue-500 to-purple-600'
    },
    {
      title: 'Task Management App',
      description: 'A collaborative task management application with real-time updates. Built using Flutter for mobile and React for web dashboard.',
      technologies: ['Flutter', 'React.js', 'Firebase', 'Socket.io', 'Material UI'],
      liveUrl: '#',
      githubUrl: '#',
      gradient: 'from-green-500 to-teal-600'
    },
    {
      title: 'Social Media Analytics',
      description: 'A dashboard for social media analytics with data visualization. Processes large datasets and provides insights through interactive charts.',
      technologies: ['Vue.js', 'Python', 'D3.js', 'PostgreSQL', 'Docker'],
      liveUrl: '#',
      githubUrl: '#',
      gradient: 'from-pink-500 to-red-600'
    },
    {
      title: 'Weather App',
      description: 'A beautiful weather application with location-based forecasts. Features include hourly/daily forecasts, weather maps, and alerts.',
      technologies: ['Flutter', 'OpenWeather API', 'Google Maps', 'SQLite', 'Bloc Pattern'],
      liveUrl: '#',
      githubUrl: '#',
      gradient: 'from-cyan-500 to-blue-600'
    }
  ];
</script>

<section id="projects" class="py-20 px-4 sm:px-6 lg:px-8">
  <div class="container mx-auto">
    <!-- Section Header -->
    <div class="text-center mb-16 animate-fade-in">
      <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-6">
        Featured Projects
      </h2>
      <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
        Some of my recent work and personal projects
      </p>
    </div>

    <!-- Projects Grid -->
    <div class="grid grid-cols-1 md:grid-cols-2 gap-8 max-w-6xl mx-auto">
      {#each projects as project, index}
        <div 
          class="group glass rounded-2xl overflow-hidden hover:scale-[1.02] transition-all duration-500 animate-slide-up"
          style="animation-delay: {index * 0.2}s;"
        >
          <!-- Project Image/Header -->
          <div class={`h-48 bg-gradient-to-br ${project.gradient} flex items-center justify-center relative overflow-hidden`}>
            <Monitor class="w-16 h-16 text-white opacity-80 group-hover:scale-110 transition-transform duration-300" />
            <!-- Floating shapes for visual appeal -->
            <div class="absolute top-4 right-4 w-8 h-8 bg-white/20 rounded-full animate-float"></div>
            <div class="absolute bottom-6 left-6 w-6 h-6 bg-white/20 rounded-full animate-float" style="animation-delay: -1s;"></div>
          </div>

          <!-- Project Content -->
          <div class="p-6">
            <h3 class="text-xl font-bold text-gray-900 dark:text-white mb-3 group-hover:text-primary-600 dark:group-hover:text-primary-400 transition-colors duration-300">
              {project.title}
            </h3>
            
            <p class="text-gray-600 dark:text-gray-400 leading-relaxed mb-4">
              {project.description}
            </p>

            <!-- Technologies -->
            <div class="flex flex-wrap gap-2 mb-6">
              {#each project.technologies as tech}
                <span class="px-3 py-1 bg-primary-100 dark:bg-primary-900/30 text-primary-700 dark:text-primary-300 rounded-full text-sm font-medium">
                  {tech}
                </span>
              {/each}
            </div>

            <!-- Action Buttons -->
            <div class="flex gap-4">
              <a 
                href={project.liveUrl}
                class="flex items-center gap-2 px-4 py-2 bg-primary-600 hover:bg-primary-700 text-white rounded-lg font-medium transition-colors duration-200 flex-1 justify-center"
                target="_blank"
                rel="noopener noreferrer"
              >
                <ExternalLink class="w-4 h-4" />
                Live Demo
              </a>
              <a 
                href={project.githubUrl}
                class="flex items-center gap-2 px-4 py-2 border-2 border-gray-300 dark:border-gray-600 hover:border-primary-600 dark:hover:border-primary-400 text-gray-700 dark:text-gray-300 hover:text-primary-600 dark:hover:text-primary-400 rounded-lg font-medium transition-colors duration-200 flex-1 justify-center"
                target="_blank"
                rel="noopener noreferrer"
              >
                <Github class="w-4 h-4" />
                Code
              </a>
            </div>
          </div>
        </div>
      {/each}
    </div>

    <!-- View More Projects Button -->
    <div class="text-center mt-12 animate-fade-in">
      <a 
        href="https://github.com/johndoe"
        target="_blank"
        rel="noopener noreferrer"
        class="inline-flex items-center gap-3 px-8 py-4 bg-gray-100 dark:bg-gray-800 hover:bg-gray-200 dark:hover:bg-gray-700 text-gray-700 dark:text-gray-300 rounded-full font-semibold transition-all duration-300 transform hover:scale-105"
      >
        <Github class="w-5 h-5" />
        View More Projects on GitHub
        <ExternalLink class="w-4 h-4" />
      </a>
    </div>
  </div>
</section>

<style>
  @keyframes float {
    0%, 100% {
      transform: translateY(0px);
    }
    50% {
      transform: translateY(-10px);
    }
  }
  
  .animate-float {
    animation: float 4s ease-in-out infinite;
  }
</style>