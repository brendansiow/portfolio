<script lang="ts">
  import { Download, ArrowRight, User } from 'lucide-svelte';

  function scrollToProjects(): void {
    const element = document.getElementById('projects');
    if (element) {
      element.scrollIntoView({ behavior: 'smooth' });
    }
  }

  function downloadCV(): void {
    // Add download CV functionality here
    console.log('Download CV clicked');
  }
</script>

<section id="about" class="min-h-screen flex items-center justify-center py-20 px-4 sm:px-6 lg:px-8">
  <div class="container mx-auto">
    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 lg:gap-16 items-center">
      <!-- Content Column -->
      <div class="order-2 lg:order-1 text-center lg:text-left animate-fade-in">
        <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 mb-4 animate-slide-up">
          Hello, I'm
        </p>
        
        <h1 class="text-4xl sm:text-5xl md:text-6xl lg:text-7xl font-bold text-gray-900 dark:text-white mb-6 animate-slide-up">
          John Doe
        </h1>
        
        <h2 class="text-2xl sm:text-3xl md:text-4xl font-light text-gray-700 dark:text-gray-300 mb-8 animate-slide-up">
          Full Stack Developer
        </h2>
        
        <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 leading-relaxed mb-10 max-w-2xl mx-auto lg:mx-0 animate-slide-up">
          I'm a passionate software developer with 5+ years of experience creating amazing digital experiences. 
          I specialize in building modern web applications using cutting-edge technologies.
        </p>
        
        <!-- Action Buttons -->
        <div class="flex flex-col sm:flex-row gap-4 justify-center lg:justify-start animate-slide-up">
          <button
            on:click={downloadCV}
            class="group bg-primary-600 hover:bg-primary-700 text-white px-8 py-4 rounded-full
                   flex items-center justify-center gap-3 transition-all duration-300
                   transform hover:scale-105 hover:shadow-lg font-semibold text-lg"
          >
            <span>Download CV</span>
            <Download class="w-5 h-5 group-hover:animate-bounce" />
          </button>
          
          <button
            on:click={scrollToProjects}
            class="group border-2 border-primary-600 text-primary-600 hover:bg-primary-600 
                   hover:text-white px-8 py-4 rounded-full flex items-center justify-center gap-3
                   transition-all duration-300 transform hover:scale-105 font-semibold text-lg"
          >
            <span>View Projects</span>
            <ArrowRight class="w-5 h-5 group-hover:translate-x-1 transition-transform duration-300" />
          </button>
        </div>
      </div>
      
      <!-- Profile Image Column -->
      <div class="order-1 lg:order-2 flex justify-center animate-fade-in">
        <div class="relative">
          <!-- Glass Effect Container -->
          <div class="glass-intense rounded-3xl p-8 w-64 h-64 sm:w-80 sm:h-80 md:w-96 md:h-96 
                      flex items-center justify-center backdrop-blur-xl
                      animate-float">
            <!-- Profile Image Placeholder -->
            <div class="w-full h-full bg-gradient-to-br from-primary-400 to-primary-600 
                        rounded-2xl flex items-center justify-center">
              <User class="w-24 h-24 sm:w-32 sm:h-32 md:w-40 md:h-40 text-white opacity-70" />
            </div>
          </div>
          
          <!-- Floating Elements for Visual Appeal -->
          <div class="absolute -top-4 -right-4 w-8 h-8 bg-primary-500 rounded-full opacity-70 animate-float" style="animation-delay: -1s;"></div>
          <div class="absolute -bottom-4 -left-4 w-6 h-6 bg-secondary-500 rounded-full opacity-70 animate-float" style="animation-delay: -2s;"></div>
          <div class="absolute top-1/4 -left-8 w-4 h-4 bg-primary-300 rounded-full opacity-50 animate-float" style="animation-delay: -3s;"></div>
        </div>
      </div>
    </div>
    
    <!-- Scroll Indicator -->
    <div class="hidden lg:flex justify-center mt-16 animate-bounce">
      <div class="w-6 h-10 border-2 border-gray-400 dark:border-gray-600 rounded-full flex justify-center">
        <div class="w-1 h-3 bg-gray-400 dark:bg-gray-600 rounded-full mt-2 animate-pulse"></div>
      </div>
    </div>
  </div>
</section>

<style>
  @keyframes float {
    0%, 100% {
      transform: translateY(0px);
    }
    50% {
      transform: translateY(-20px);
    }
  }
  
  .animate-float {
    animation: float 6s ease-in-out infinite;
  }
</style>