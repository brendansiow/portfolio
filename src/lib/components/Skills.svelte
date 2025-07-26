<script lang="ts">
  import { onMount } from 'svelte';
  import { Code, Database, Settings, Globe } from 'lucide-svelte';

  let isVisible: boolean = false;

  type Skill = {
    name: string;
    level: number;
  };

  type SkillCategory = {
    title: string;
    icon: typeof Code;
    skills: Skill[];
  };

  const skillCategories: SkillCategory[] = [
    {
      title: 'Frontend Development',
      icon: Code,
      skills: [
        { name: 'React.js', level: 90 },
        { name: 'Vue.js', level: 85 },
        { name: 'SvelteKit', level: 95 },
        { name: 'TypeScript', level: 80 },
        { name: 'HTML5/CSS3', level: 90 }
      ]
    },
    {
      title: 'Backend Development',
      icon: Database,
      skills: [
        { name: 'Node.js', level: 90 },
        { name: 'Python', level: 85 },
        { name: 'Java', level: 80 },
        { name: 'MongoDB', level: 85 },
        { name: 'PostgreSQL', level: 80 }
      ]
    },
    {
      title: 'Tools & Platforms',
      icon: Settings,
      skills: [
        { name: 'AWS', level: 85 },
        { name: 'Docker', level: 80 },
        { name: 'Git', level: 95 },
        { name: 'Firebase', level: 90 },
        { name: 'Linux', level: 80 }
      ]
    }
  ];

  type Language = {
    name: string;
    level: number;
    flag: string;
  };

  const languages: Language[] = [
    { name: 'English', level: 100, flag: '🇺🇸' },
    { name: 'Spanish', level: 85, flag: '🇪🇸' },
    { name: 'French', level: 70, flag: '🇫🇷' },
    { name: 'German', level: 60, flag: '🇩🇪' }
  ];

  onMount(() => {
    const observer = new IntersectionObserver((entries) => {
      entries.forEach((entry) => {
        if (entry.isIntersecting) {
          isVisible = true;
        }
      });
    });

    const section = document.getElementById('skills');
    if (section) {
      observer.observe(section);
    }

    return () => observer.disconnect();
  });
</script>

<section id="skills" class="py-20 px-4 sm:px-6 lg:px-8 bg-gray-50 dark:bg-gray-800/50">
  <div class="container mx-auto">
    <!-- Section Header -->
    <div class="text-center mb-16 animate-fade-in">
      <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-6">
        Skills & Languages
      </h2>
      <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
        Technical expertise and language proficiencies
      </p>
    </div>

    <!-- Technical Skills -->
    <div class="mb-20">
      <div class="text-center mb-12">
        <h3 class="text-2xl md:text-3xl font-bold text-primary-600 dark:text-primary-400 mb-4">
          Technical Skills
        </h3>
      </div>

      <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8 max-w-6xl mx-auto">
        {#each skillCategories as category, categoryIndex}
          <div 
            class="glass rounded-2xl p-6 animate-slide-up hover:scale-[1.02] transition-transform duration-300"
            style="animation-delay: {categoryIndex * 0.2}s;"
          >
            <!-- Category Header -->
            <div class="flex items-center gap-3 mb-6">
              <div class="p-3 bg-primary-100 dark:bg-primary-900/30 rounded-lg">
                <svelte:component this={category.icon} class="w-6 h-6 text-primary-600 dark:text-primary-400" />
              </div>
              <h4 class="text-lg font-bold text-gray-900 dark:text-white">
                {category.title}
              </h4>
            </div>

            <!-- Skills List -->
            <div class="space-y-4">
              {#each category.skills as skill, skillIndex}
                <div class="animate-slide-up" style="animation-delay: {(categoryIndex * 0.2) + (skillIndex * 0.1)}s;">
                  <div class="flex justify-between items-center mb-2">
                    <span class="text-gray-700 dark:text-gray-300 font-medium">
                      {skill.name}
                    </span>
                    <span class="text-primary-600 dark:text-primary-400 font-semibold">
                      {skill.level}%
                    </span>
                  </div>
                  <div class="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
                    <div 
                      class="bg-gradient-to-r from-primary-500 to-primary-600 h-2 rounded-full transition-all duration-1000 ease-out"
                      style="width: {isVisible ? skill.level : 0}%"
                    ></div>
                  </div>
                </div>
              {/each}
            </div>
          </div>
        {/each}
      </div>
    </div>

    <!-- Languages -->
    <div>
      <div class="text-center mb-12">
        <h3 class="text-2xl md:text-3xl font-bold text-primary-600 dark:text-primary-400 mb-4">
          Languages
        </h3>
      </div>

      <div class="max-w-4xl mx-auto">
        <div class="glass rounded-2xl p-8 animate-slide-up">
          <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
            {#each languages as language, index}
              <div class="animate-slide-up" style="animation-delay: {index * 0.1}s;">
                <div class="flex items-center gap-4 mb-3">
                  <span class="text-3xl">{language.flag}</span>
                  <div class="flex-1">
                    <div class="flex justify-between items-center mb-2">
                      <span class="text-gray-900 dark:text-white font-semibold text-lg">
                        {language.name}
                      </span>
                      <span class="text-primary-600 dark:text-primary-400 font-bold">
                        {language.level}%
                      </span>
                    </div>
                    <div class="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-3">
                      <div 
                        class="bg-gradient-to-r from-green-500 to-emerald-600 h-3 rounded-full transition-all duration-1000 ease-out"
                        style="width: {isVisible ? language.level : 0}%"
                      ></div>
                    </div>
                  </div>
                </div>
              </div>
            {/each}
          </div>
        </div>
      </div>
    </div>

    <!-- Additional Skills Badge -->
    <div class="text-center mt-12 animate-fade-in">
      <div class="inline-flex items-center gap-3 px-6 py-3 bg-primary-100 dark:bg-primary-900/30 rounded-full">
        <Globe class="w-5 h-5 text-primary-600 dark:text-primary-400" />
        <span class="text-primary-700 dark:text-primary-300 font-semibold">
          Always learning new technologies and frameworks
        </span>
      </div>
    </div>
  </div>
</section>