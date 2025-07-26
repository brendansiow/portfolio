<script lang="ts">
  import { Mail, Phone, MapPin, Github, Linkedin, Twitter, Send } from 'lucide-svelte';

  type Form = {
    name: string;
    email: string;
    message: string;
  };

  let form: Form = {
    name: '',
    email: '',
    message: ''
  };

  let isSubmitting: boolean = false;
  let submitStatus: string | null = null;

  async function handleSubmit(event: Event): Promise<void> {
    event.preventDefault();
    isSubmitting = true;
    // Simulate form submission
    setTimeout(() => {
      isSubmitting = false;
      submitStatus = 'success';
      form = { name: '', email: '', message: '' };
      // Reset status after 3 seconds
      setTimeout(() => {
        submitStatus = null;
      }, 3000);
    }, 1000);
  }

  type ContactInfo = {
    icon: typeof Mail;
    label: string;
    value: string;
    href: string;
  };

  const contactInfo: ContactInfo[] = [
    {
      icon: Mail,
      label: 'Email',
      value: 'john.doe@email.com',
      href: 'mailto:john.doe@email.com'
    },
    {
      icon: Phone,
      label: 'Phone',
      value: '+1 (555) 123-4567',
      href: 'tel:+15551234567'
    },
    {
      icon: MapPin,
      label: 'Location',
      value: 'San Francisco, CA',
      href: '#'
    }
  ];

  type SocialLink = {
    icon: typeof Github;
    label: string;
    href: string;
    color: string;
  };

  const socialLinks: SocialLink[] = [
    {
      icon: Github,
      label: 'GitHub',
      href: 'https://github.com/johndoe',
      color: 'hover:text-gray-600 dark:hover:text-gray-300'
    },
    {
      icon: Linkedin,
      label: 'LinkedIn',
      href: 'https://linkedin.com/in/johndoe',
      color: 'hover:text-blue-600'
    },
    {
      icon: Twitter,
      label: 'Twitter',
      href: 'https://twitter.com/johndoe',
      color: 'hover:text-blue-400'
    }
  ];
</script>

<section id="contact" class="py-20 px-4 sm:px-6 lg:px-8 bg-gradient-to-br from-primary-600 via-primary-700 to-primary-800">
  <div class="container mx-auto">
    <!-- Section Header -->
    <div class="text-center mb-16 animate-fade-in">
      <h2 class="text-4xl md:text-5xl font-bold text-white mb-6">
        Get In Touch
      </h2>
      <p class="text-lg md:text-xl text-white/80 max-w-2xl mx-auto">
        Let's work together on your next project. I'm always open to discussing new opportunities.
      </p>
    </div>

    <div class="grid grid-cols-1 lg:grid-cols-2 gap-12 max-w-6xl mx-auto">
      <!-- Contact Info -->
      <div class="animate-slide-up">
        <div class="glass-intense rounded-2xl p-8 text-white">
          <h3 class="text-2xl font-bold mb-8">Contact Information</h3>
          
          <div class="space-y-6">
            {#each contactInfo as info}
              <a 
                href={info.href}
                class="flex items-center gap-4 p-4 rounded-lg hover:bg-white/10 transition-colors duration-200 group"
              >
                <div class="p-3 bg-white/20 rounded-lg group-hover:bg-white/30 transition-colors duration-200">
                  <svelte:component this={info.icon} class="w-6 h-6" />
                </div>
                <div>
                  <p class="text-white/70 text-sm">{info.label}</p>
                  <p class="font-semibold">{info.value}</p>
                </div>
              </a>
            {/each}
          </div>

          <!-- Social Links -->
          <div class="mt-8 pt-8 border-t border-white/20">
            <h4 class="text-lg font-semibold mb-4">Follow Me</h4>
            <div class="flex gap-4">
              {#each socialLinks as social}
                <a 
                  href={social.href}
                  target="_blank"
                  rel="noopener noreferrer"
                  class="p-3 bg-white/20 rounded-lg hover:bg-white/30 transition-all duration-200 transform hover:scale-110"
                  aria-label={social.label}
                >
                  <svelte:component this={social.icon} class="w-6 h-6" />
                </a>
              {/each}
            </div>
          </div>
        </div>
      </div>

      <!-- Contact Form -->
      <div class="animate-slide-up" style="animation-delay: 0.2s;">
        <div class="glass-intense rounded-2xl p-8">
          <h3 class="text-2xl font-bold text-white mb-8">Send Message</h3>
          
          <form on:submit={handleSubmit} class="space-y-6">
            <div>
              <label for="name" class="block text-white/80 font-medium mb-2">Name</label>
              <input 
                type="text" 
                id="name"
                bind:value={form.name}
                required
                class="w-full px-4 py-3 bg-white/20 border border-white/30 rounded-lg text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-transparent transition-all duration-200"
                placeholder="Your full name"
              />
            </div>

            <div>
              <label for="email" class="block text-white/80 font-medium mb-2">Email</label>
              <input 
                type="email" 
                id="email"
                bind:value={form.email}
                required
                class="w-full px-4 py-3 bg-white/20 border border-white/30 rounded-lg text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-transparent transition-all duration-200"
                placeholder="your.email@example.com"
              />
            </div>

            <div>
              <label for="message" class="block text-white/80 font-medium mb-2">Message</label>
              <textarea 
                id="message"
                bind:value={form.message}
                required
                rows="5"
                class="w-full px-4 py-3 bg-white/20 border border-white/30 rounded-lg text-white placeholder-white/50 focus:outline-none focus:ring-2 focus:ring-white/50 focus:border-transparent transition-all duration-200 resize-none"
                placeholder="Tell me about your project..."
              ></textarea>
            </div>

            <button 
              type="submit"
              disabled={isSubmitting}
              class="w-full bg-white text-primary-600 font-semibold py-3 px-6 rounded-lg hover:bg-gray-100 transition-colors duration-200 flex items-center justify-center gap-2 disabled:opacity-50 disabled:cursor-not-allowed"
            >
              {#if isSubmitting}
                <div class="w-5 h-5 border-2 border-primary-600 border-t-transparent rounded-full animate-spin"></div>
                Sending...
              {:else}
                <Send class="w-5 h-5" />
                Send Message
              {/if}
            </button>

            {#if submitStatus === 'success'}
              <div class="p-4 bg-green-500/20 border border-green-500/30 rounded-lg text-green-100 text-center">
                Thank you! Your message has been sent successfully.
              </div>
            {/if}
          </form>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Footer -->
<footer class="bg-primary-900 py-8 px-4 sm:px-6 lg:px-8">
  <div class="container mx-auto">
    <div class="flex flex-col md:flex-row justify-between items-center">
      <div class="text-white/70 text-center md:text-left mb-4 md:mb-0">
        © 2024 John Doe. All rights reserved.
      </div>
      <div class="text-white/70 text-center md:text-right">
        Built with ❤️ using SvelteKit
      </div>
    </div>
  </div>
</footer>