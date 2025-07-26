<script lang="ts">
  import { CheckCircle, Building, Calendar } from 'lucide-svelte';

  type Experience = {
    title: string;
    company: string;
    duration: string;
    description: string;
    achievements: string[];
    isLatest: boolean;
  };

  const experiences: Experience[] = [
    {
      title: 'Senior Full Stack Developer',
      company: 'TechCorp Solutions',
      duration: '2022 - Present',
      description: 'Leading development of enterprise web applications using React, Node.js, and AWS. Managed a team of 5 developers and improved system performance by 40%.',
      achievements: [
        'Led migration from monolithic to microservices architecture',
        'Implemented CI/CD pipelines reducing deployment time by 60%',
        'Mentored junior developers and conducted code reviews',
        'Collaborated with product teams to define technical requirements'
      ],
      isLatest: true
    },
    {
      title: 'Full Stack Developer',
      company: 'StartupTech Inc.',
      duration: '2020 - 2022',
      description: 'Developed and maintained multiple web applications using modern technologies. Worked closely with design team to implement pixel-perfect UIs.',
      achievements: [
        'Built responsive web applications using React and Vue.js',
        'Developed RESTful APIs with Node.js and Express',
        'Integrated third-party services and payment gateways',
        'Optimized database queries improving response time by 30%'
      ],
      isLatest: false
    },
    {
      title: 'Frontend Developer',
      company: 'WebSolutions Ltd.',
      duration: '2019 - 2020',
      description: 'Focused on creating interactive and user-friendly web interfaces. Collaborated with UX designers to implement modern design patterns.',
      achievements: [
        'Developed responsive websites using HTML5, CSS3, and JavaScript',
        'Implemented modern frontend frameworks and libraries',
        'Ensured cross-browser compatibility and performance optimization',
        'Participated in agile development processes'
      ],
      isLatest: false
    }
  ];
</script>

<section id="experience" class="py-20 px-4 sm:px-6 lg:px-8 bg-gray-50 dark:bg-gray-800/50">
  <div class="container mx-auto">
    <!-- Section Header -->
    <div class="text-center mb-16 animate-fade-in">
      <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-6">
        Working Experience
      </h2>
      <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
        My professional journey and key achievements
      </p>
    </div>

    <!-- Timeline -->
    <div class="max-w-4xl mx-auto">
      {#each experiences as experience, index}
        <div class="relative animate-slide-up" style="animation-delay: {index * 0.2}s;">
          <!-- Desktop Timeline -->
          <div class="hidden md:flex items-start mb-12">
            <!-- Timeline Line and Dot -->
            <div class="flex flex-col items-center mr-8">
              <div class={`w-5 h-5 rounded-full border-4 border-white dark:border-gray-800 ${
                experience.isLatest 
                  ? 'bg-primary-600' 
                  : 'bg-gray-400'
              } z-10`}></div>
              {#if index < experiences.length - 1}
                <div class="w-0.5 h-32 bg-gray-300 dark:bg-gray-600 mt-2"></div>
              {/if}
            </div>

            <!-- Content Card -->
            <div class="flex-1 glass rounded-2xl p-8 hover:scale-[1.02] transition-transform duration-300">
              <div class="flex justify-between items-start mb-4">
                <div>
                  <h3 class="text-xl md:text-2xl font-bold text-primary-600 dark:text-primary-400 mb-2">
                    {experience.title}
                  </h3>
                  <div class="flex items-center gap-2 text-gray-700 dark:text-gray-300 mb-2">
                    <Building class="w-5 h-5" />
                    <span class="text-lg font-semibold">{experience.company}</span>
                  </div>
                </div>
                <div class="flex items-center gap-2 bg-primary-100 dark:bg-primary-900/30 px-4 py-2 rounded-full">
                  <Calendar class="w-4 h-4 text-primary-600 dark:text-primary-400" />
                  <span class="text-sm font-medium text-primary-700 dark:text-primary-300">
                    {experience.duration}
                  </span>
                </div>
              </div>

              <p class="text-gray-600 dark:text-gray-400 leading-relaxed mb-6">
                {experience.description}
              </p>

              <div class="space-y-3">
                {#each experience.achievements as achievement}
                  <div class="flex items-start gap-3">
                    <CheckCircle class="w-5 h-5 text-green-500 mt-0.5 flex-shrink-0" />
                    <span class="text-gray-700 dark:text-gray-300">
                      {achievement}
                    </span>
                  </div>
                {/each}
              </div>
            </div>
          </div>

          <!-- Mobile Timeline -->
          <div class="md:hidden mb-8">
            <div class="glass rounded-2xl p-6">
              <!-- Timeline Dot -->
              <div class="flex justify-center mb-4">
                <div class={`w-4 h-4 rounded-full ${
                  experience.isLatest 
                    ? 'bg-primary-600' 
                    : 'bg-gray-400'
                }`}></div>
              </div>

              <div class="text-center mb-4">
                <h3 class="text-lg font-bold text-primary-600 dark:text-primary-400 mb-2">
                  {experience.title}
                </h3>
                <div class="flex items-center justify-center gap-2 text-gray-700 dark:text-gray-300 mb-2">
                  <Building class="w-4 h-4" />
                  <span class="font-semibold">{experience.company}</span>
                </div>
                <div class="flex items-center justify-center gap-2 bg-primary-100 dark:bg-primary-900/30 px-3 py-1 rounded-full inline-flex">
                  <Calendar class="w-4 h-4 text-primary-600 dark:text-primary-400" />
                  <span class="text-sm font-medium text-primary-700 dark:text-primary-300">
                    {experience.duration}
                  </span>
                </div>
              </div>

              <p class="text-gray-600 dark:text-gray-400 leading-relaxed mb-6 text-center">
                {experience.description}
              </p>

              <div class="space-y-3">
                {#each experience.achievements as achievement}
                  <div class="flex items-start gap-3">
                    <CheckCircle class="w-5 h-5 text-green-500 mt-0.5 flex-shrink-0" />
                    <span class="text-gray-700 dark:text-gray-300 text-sm">
                      {achievement}
                    </span>
                  </div>
                {/each}
              </div>
            </div>
            
            {#if index < experiences.length - 1}
              <div class="flex justify-center py-4">
                <div class="w-0.5 h-8 bg-gray-300 dark:bg-gray-600"></div>
              </div>
            {/if}
          </div>
        </div>
      {/each}
    </div>
  </div>
</section>