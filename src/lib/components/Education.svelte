<script>
  import { GraduationCap, Award, Calendar, MapPin } from 'lucide-svelte';

  const education = [
    {
      degree: 'Bachelor of Computer Science',
      institution: 'University of Technology',
      period: '2015 - 2019',
      description: 'Graduated Magna Cum Laude with a focus on Software Engineering and Data Structures. Relevant coursework: Algorithms, Database Systems, Web Development, Machine Learning.',
      gpa: 'GPA: 3.8/4.0',
      location: 'San Francisco, CA'
    },
    {
      degree: 'High School Diploma',
      institution: 'St. Thomas High School',
      period: '2011 - 2015',
      description: 'Valedictorian with honors in Mathematics and Computer Science. Active in robotics club and programming competitions.',
      gpa: 'GPA: 4.0/4.0',
      location: 'San Francisco, CA'
    }
  ];

  const certifications = [
    {
      name: 'AWS Certified Solutions Architect',
      issuer: 'Amazon Web Services',
      date: '2023',
      description: 'Professional level certification for designing distributed systems on AWS.',
      credentialId: 'AWS-SA-2023-001'
    },
    {
      name: 'Google Cloud Professional Developer',
      issuer: 'Google Cloud',
      date: '2022',
      description: 'Expertise in developing scalable applications using Google Cloud Platform.',
      credentialId: 'GCP-PD-2022-456'
    },
    {
      name: 'Certified Kubernetes Administrator',
      issuer: 'Cloud Native Computing Foundation',
      date: '2022',
      description: 'Advanced skills in Kubernetes cluster administration and orchestration.',
      credentialId: 'CKA-2022-789'
    },
    {
      name: 'MongoDB Certified Developer',
      issuer: 'MongoDB Inc.',
      date: '2021',
      description: 'Proficiency in MongoDB database design and development.',
      credentialId: 'MDB-DEV-2021-123'
    }
  ];
</script>

<section id="education" class="py-20 px-4 sm:px-6 lg:px-8 bg-gray-50 dark:bg-gray-800/50">
  <div class="container mx-auto">
    <!-- Section Header -->
    <div class="text-center mb-16 animate-fade-in">
      <h2 class="text-4xl md:text-5xl font-bold gradient-text mb-6">
        Education & Certifications
      </h2>
      <p class="text-lg md:text-xl text-gray-600 dark:text-gray-400 max-w-2xl mx-auto">
        My academic background and professional certifications
      </p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-6xl mx-auto">
      <!-- Education Section -->
      <div class="animate-slide-up">
        <div class="flex items-center gap-3 mb-8">
          <div class="p-3 bg-primary-100 dark:bg-primary-900/30 rounded-lg">
            <GraduationCap class="w-8 h-8 text-primary-600 dark:text-primary-400" />
          </div>
          <h3 class="text-2xl font-bold text-gray-900 dark:text-white">Education</h3>
        </div>

        <div class="space-y-6">
          {#each education as edu, index}
            <div 
              class="glass rounded-2xl p-6 hover:scale-[1.02] transition-transform duration-300 animate-slide-up"
              style="animation-delay: {index * 0.2}s;"
            >
              <div class="flex flex-col md:flex-row md:items-start md:justify-between mb-4">
                <div class="flex-1">
                  <h4 class="text-xl font-bold text-primary-600 dark:text-primary-400 mb-2">
                    {edu.degree}
                  </h4>
                  <p class="text-lg font-semibold text-gray-900 dark:text-white mb-2">
                    {edu.institution}
                  </p>
                </div>
                <div class="flex flex-col items-start md:items-end gap-2 mt-2 md:mt-0">
                  <div class="flex items-center gap-2 bg-primary-100 dark:bg-primary-900/30 px-3 py-1 rounded-full">
                    <Calendar class="w-4 h-4 text-primary-600 dark:text-primary-400" />
                    <span class="text-sm font-medium text-primary-700 dark:text-primary-300">
                      {edu.period}
                    </span>
                  </div>
                  <div class="flex items-center gap-2 text-gray-600 dark:text-gray-400">
                    <MapPin class="w-4 h-4" />
                    <span class="text-sm">{edu.location}</span>
                  </div>
                </div>
              </div>

              <p class="text-gray-600 dark:text-gray-400 leading-relaxed mb-3">
                {edu.description}
              </p>

              <div class="inline-block bg-green-100 dark:bg-green-900/30 px-3 py-1 rounded-full">
                <span class="text-green-700 dark:text-green-300 font-semibold text-sm">
                  {edu.gpa}
                </span>
              </div>
            </div>
          {/each}
        </div>
      </div>

      <!-- Certifications Section -->
      <div class="animate-slide-up" style="animation-delay: 0.3s;">
        <div class="flex items-center gap-3 mb-8">
          <div class="p-3 bg-secondary-100 dark:bg-secondary-900/30 rounded-lg">
            <Award class="w-8 h-8 text-secondary-600 dark:text-secondary-400" />
          </div>
          <h3 class="text-2xl font-bold text-gray-900 dark:text-white">Certifications</h3>
        </div>

        <div class="space-y-4">
          {#each certifications as cert, index}
            <div 
              class="glass rounded-2xl p-6 hover:scale-[1.02] transition-transform duration-300 animate-slide-up"
              style="animation-delay: {(index * 0.1) + 0.4}s;"
            >
              <div class="flex items-start justify-between mb-3">
                <div class="flex-1">
                  <h4 class="text-lg font-bold text-secondary-600 dark:text-secondary-400 mb-1">
                    {cert.name}
                  </h4>
                  <p class="text-gray-700 dark:text-gray-300 font-medium">
                    {cert.issuer}
                  </p>
                </div>
                <div class="bg-secondary-100 dark:bg-secondary-900/30 px-3 py-1 rounded-full">
                  <span class="text-secondary-700 dark:text-secondary-300 font-semibold text-sm">
                    {cert.date}
                  </span>
                </div>
              </div>

              <p class="text-gray-600 dark:text-gray-400 text-sm leading-relaxed mb-3">
                {cert.description}
              </p>

              <div class="text-xs text-gray-500 dark:text-gray-500">
                Credential ID: {cert.credentialId}
              </div>
            </div>
          {/each}
        </div>

        <!-- View All Certifications Button -->
        <div class="text-center mt-8">
          <button class="inline-flex items-center gap-2 px-6 py-3 bg-secondary-600 hover:bg-secondary-700 text-white rounded-lg font-medium transition-colors duration-200">
            <Award class="w-5 h-5" />
            View All Certifications
          </button>
        </div>
      </div>
    </div>
  </div>
</section>