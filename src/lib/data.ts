import type { PortfolioData } from '$lib/types';

export const portfolioData: PortfolioData = {
  personalInfo: {
    name: "Your Name",
    title: "Full Stack Developer",
    location: "Your City, Country",
    email: "your.email@example.com",
    phone: "+1 (555) 123-4567",
    linkedin: "https://linkedin.com/in/yourprofile",
    github: "https://github.com/yourusername",
    website: "https://yourwebsite.com",
    bio: "Passionate full-stack developer with expertise in modern web technologies. I love creating beautiful, functional applications that solve real-world problems. Always learning and staying up-to-date with the latest technologies and best practices.",
    profileImage: "" // Remove reference to missing image
  },
  
  workExperience: [
    {
      id: "1",
      company: "Tech Company Inc.",
      position: "Senior Full Stack Developer",
      duration: "2022 - Present",
      location: "Remote",
      description: [
        "Led development of 5+ web applications using React, Node.js, and TypeScript",
        "Improved application performance by 40% through code optimization and caching strategies",
        "Mentored junior developers and conducted code reviews",
        "Collaborated with designers and product managers to deliver user-centric solutions"
      ],
      technologies: ["React", "Node.js", "TypeScript", "PostgreSQL", "AWS"]
    },
    {
      id: "2",
      company: "Startup Solutions",
      position: "Frontend Developer",
      duration: "2020 - 2022",
      location: "Your City",
      description: [
        "Developed responsive web applications using React and Vue.js",
        "Implemented modern UI/UX designs with attention to accessibility",
        "Worked closely with backend developers to integrate APIs",
        "Participated in agile development processes and sprint planning"
      ],
      technologies: ["React", "Vue.js", "JavaScript", "CSS", "REST APIs"]
    }
  ],
  
  projects: [
    {
      id: "1",
      title: "E-commerce Platform",
      description: "A full-stack e-commerce platform with user authentication, product management, shopping cart, and payment integration.",
      technologies: ["SvelteKit", "Node.js", "PostgreSQL", "Stripe", "TailwindCSS"],
      githubUrl: "https://github.com/yourusername/ecommerce-platform",
      liveUrl: "https://your-ecommerce-demo.com",
      imageUrl: "", // Remove reference to missing image
      featured: true
    },
    {
      id: "2",
      title: "Task Management App",
      description: "A collaborative task management application with real-time updates, team collaboration features, and project tracking.",
      technologies: ["React", "Express.js", "Socket.io", "MongoDB", "Material-UI"],
      githubUrl: "https://github.com/yourusername/task-manager",
      liveUrl: "https://your-task-manager.com",
      imageUrl: "", // Remove reference to missing image
      featured: true
    },
    {
      id: "3",
      title: "Weather Dashboard",
      description: "A responsive weather dashboard that displays current weather and forecasts for multiple cities with beautiful visualizations.",
      technologies: ["Vue.js", "Chart.js", "OpenWeather API", "Vuetify"],
      githubUrl: "https://github.com/yourusername/weather-dashboard",
      liveUrl: "https://your-weather-app.com",
      imageUrl: "", // Remove reference to missing image
      featured: false
    }
  ],
  
  education: [
    {
      id: "1",
      institution: "University of Technology",
      degree: "Bachelor of Science in Computer Science",
      duration: "2016 - 2020",
      location: "Your City, Country",
      gpa: "3.8/4.0",
      description: "Focused on software engineering, web development, and database systems."
    }
  ],
  
  certificates: [
    {
      id: "1",
      name: "AWS Certified Solutions Architect",
      issuer: "Amazon Web Services",
      date: "2023",
      credentialId: "AWS-SAA-123456",
      credentialUrl: "https://aws.amazon.com/verification"
    },
    {
      id: "2",
      name: "Google Cloud Professional Developer",
      issuer: "Google Cloud",
      date: "2022",
      credentialId: "GCP-PD-789012",
      credentialUrl: "https://cloud.google.com/certification"
    },
    {
      id: "3",
      name: "React Developer Certification",
      issuer: "Meta",
      date: "2021",
      credentialId: "META-RD-345678"
    }
  ],
  
  skills: [
    {
      category: "Frontend",
      skills: ["React", "Vue.js", "Svelte", "TypeScript", "JavaScript", "HTML5", "CSS3", "TailwindCSS", "SASS"]
    },
    {
      category: "Backend",
      skills: ["Node.js", "Express.js", "Python", "Django", "FastAPI", "REST APIs", "GraphQL"]
    },
    {
      category: "Database",
      skills: ["PostgreSQL", "MongoDB", "MySQL", "Redis", "Prisma", "Mongoose"]
    },
    {
      category: "DevOps & Tools",
      skills: ["AWS", "Docker", "Kubernetes", "Git", "GitHub Actions", "Jenkins", "Terraform"]
    },
    {
      category: "Testing",
      skills: ["Jest", "Cypress", "Playwright", "Vitest", "Testing Library"]
    }
  ]
};