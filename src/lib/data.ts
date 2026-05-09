import type { PortfolioData } from '$lib/types';

export const portfolioData: PortfolioData = {
	personalInfo: {
		name: 'Brendan Siow',
		title: 'Senior Software Engineer',
		location: 'Cheras, Kuala Lumpur, Malaysia',
		email: 'brendansiowx96@gmail.com',
		phone: '+6010-931 9264',
		linkedin: 'https://linkedin.com/in/brendan-siow',
		github: 'https://github.com/brendansiow',
		website: 'https://github.com/brendansiow',
		bio: 'Senior software engineer focused on backend systems, product delivery, and pragmatic engineering. I work comfortably across Golang services, payment infrastructure, mobile platforms, and supporting web stacks — with a preference for clean architecture, reliable execution, and products that feel solid in production.',
		profileImage: 'https://avatars.githubusercontent.com/u/20613633?v=4'
	},

	workExperience: [
		{
			id: '1',
			company: 'Mercedes-Benz Tech Innovation',
			position: 'Senior Software Engineer',
			duration: 'Jun 2024 - Present',
			location: 'Malaysia · global engineering collaboration',
			companyUrl: 'https://www.mercedes-benz.io/',
			companyLogo: '/assets/logos/mercedes-benz.svg',
			description: [
				'Build and maintain scalable Golang services with proper unit and integration testing.',
				'Contribute to Data Registry and Data Access Manager within MB.OS, improving how internal data is documented, governed, and accessed.',
				'Designed APIs and metadata flows that support EU Data Act compliance work.',
				'Improved search and performance in data-heavy workflows using OpenSearch and SQL optimization.',
				'Worked with Kubernetes CronJobs, Azure EventHub, and a global sprint-based engineering process.'
			],
			technologies: ['Golang', 'Kubernetes', 'OpenSearch', 'Azure EventHub', 'SQL', 'Hugo Docs']
		},
		{
			id: '2',
			company: 'Revenue Monster',
			position: 'Senior Software Engineer',
			duration: 'Sep 2023 - May 2024',
			location: 'Malaysia',
			companyUrl: 'https://www.revenuemonster.my/',
			companyLogo: '/assets/logos/revenue-monster.svg',
			description: [
				'Built and enhanced payment platform features using Golang and Echo, with selected Next.js frontend work.',
				'Maintained merchant-facing and admin-facing portals, reporting flows, Open API support, and integration documentation.',
				'Expanded gateway capabilities with Apple Pay, Google Pay, and wallet integrations.',
				'Implemented a low-code checkout flow that reduced integration effort for merchants.'
			],
			technologies: ['Golang', 'Echo', 'Next.js', 'Open API', 'Apple Pay', 'Google Pay']
		},
		{
			id: '3',
			company: 'iFAST Capital Sdn Bhd',
			position: 'Senior / IT Specialist',
			duration: '2019 - 2023',
			location: 'Malaysia',
			companyUrl: 'https://www.ifastcapital.com.my/myifast/what-we-offer',
			companyLogo: '/assets/logos/ifast.png',
			description: [
				'Delivered fintech products across Flutter, React Native, React, Angular, and Java Spring Boot stacks.',
				'Worked on regional investment apps, backend APIs, CI/CD pipelines, and mobile release processes.',
				'Helped modernize legacy applications, including migrations to newer Flutter versions and null safety.',
				'Coordinated delivery with business stakeholders and supported app submissions across major stores.'
			],
			technologies: ['Flutter', 'React Native', 'React', 'Angular', 'Spring Boot', 'Jenkins', 'Firebase']
		}
	],

	projects: [
		{
			id: '1',
			title: 'Data Registry & Data Access Manager',
			description:
				'MB.OS platform work centered on data governance, discoverability, legal metadata, and controlled access. I contributed on the backend side, including search, performance, and compliance-oriented API design.',
			technologies: ['Golang', 'OpenSearch', 'SQL', 'Kubernetes', 'APIs', 'MB.OS'],
			liveUrl: 'https://www.mercedes-benz.io/',
			logoUrl: '/assets/logos/mercedes-benz.svg',
			featured: true
		},
		{
			id: '2',
			title: 'Revenue Monster Payment Platform',
			description:
				'Worked on the payment gateway and surrounding merchant tooling, covering portal enhancements, reporting flows, Open API support, low-code checkout integration, and payment method expansion across cards, wallets, Apple Pay, and Google Pay.',
			technologies: ['Golang', 'Echo', 'Next.js', 'Payment Gateway', 'Apple Pay', 'Google Pay'],
			liveUrl: 'https://www.revenuemonster.my/',
			storeUrl: 'https://play.google.com/store/apps/details?id=my.revenuemonster.merchant',
			logoUrl: '/assets/logos/revenue-monster.svg',
			featured: true
		},
		{
			id: '3',
			title: 'iFAST Global Markets (IGM)',
			description:
				'Regional investment app delivery involving Flutter implementation, backend coordination, CI/CD, stakeholder collaboration, and release operations across mobile platforms.',
			technologies: ['Flutter', 'Spring Boot', 'Hibernate', 'Jenkins', 'CI/CD', 'Mobile Delivery'],
			liveUrl: 'https://www.ifastcapital.com.my/myifast/what-we-offer',
			storeUrl: 'https://play.google.com/store/apps/details?id=com.igmnew',
			logoUrl: '/assets/logos/ifast.png',
			featured: true
		},
		{
			id: '4',
			title: 'FSMOne',
			description:
				'Supported modernization and migration work for a regional wealth product, including mobile UI implementation, state management, and legacy logic transition.',
			technologies: ['Flutter', 'Provider', 'Mobile UI', 'Product Migration'],
			liveUrl: 'https://www.ifastcapital.com.my/myifast/what-we-offer',
			storeUrl: 'https://play.google.com/store/apps/details?id=com.ifast.fsm',
			logoUrl: '/assets/logos/ifast.png',
			featured: false
		},
		{
			id: '5',
			title: 'Project Management System',
			description:
				'An internal intranet application built with Angular and Java Spring to support project operations with structured state and enterprise UI workflows.',
			technologies: ['Angular 8', 'Java Spring', 'Ng-Zorro', 'NGXS'],
			featured: false
		},
		{
			id: '6',
			title: 'Personal Portfolio',
			description:
				'A SvelteKit-based personal site built to present experience, selected work, and technical strengths in a cleaner and more deliberate format.',
			technologies: ['SvelteKit', 'TypeScript', 'Tailwind CSS', 'UI Design'],
			githubUrl: 'https://github.com/brendansiow/portfolio',
			logoUrl: '/assets/logos/github.svg',
			featured: false
		}
	],

	education: [
		{
			id: '1',
			institution: 'Asia Pacific University',
			degree: 'Bachelor (Hons) in Software Engineering',
			duration: 'Completed',
			location: 'Malaysia',
			gpa: 'First Class Honours',
			description: 'Completed a software engineering degree with first class honours.'
		},
		{
			id: '2',
			institution: 'Asia Pacific University',
			degree: 'Diploma in Information Technology (Software Engineering)',
			duration: 'Completed',
			location: 'Malaysia',
			gpa: 'CGPA 3.85',
			description: 'Diploma focused on software engineering fundamentals and practical delivery.'
		},
		{
			id: '3',
			institution: 'SMK Taman Connaught',
			degree: 'Secondary School',
			duration: '2013',
			location: 'Malaysia',
			gpa: 'Achieved 7A in SPM',
			description: 'Completed secondary education with strong academic performance.'
		}
	],

	certificates: [
		{
			id: '1',
			name: 'Bachelor (Hons) in Software Engineering',
			issuer: 'Asia Pacific University',
			date: 'Completed',
			credentialId: 'First Class Honours'
		},
		{
			id: '2',
			name: 'Diploma in Information Technology (Software Engineering)',
			issuer: 'Asia Pacific University',
			date: 'Completed',
			credentialId: 'CGPA 3.85'
		},
		{
			id: '3',
			name: 'SPM',
			issuer: 'SMK Taman Connaught',
			date: '2013',
			credentialId: '7A Achievement'
		}
	],

	skills: [
		{
			category: 'Frontend',
			skills: ['SvelteKit', 'React', 'Angular', 'Next.js', 'Flutter', 'Ionic', 'HTML', 'CSS', 'JavaScript']
		},
		{
			category: 'Backend',
			skills: ['Golang', 'Java', 'Spring Boot', 'PHP', 'gRPC', 'REST API Design']
		},
		{
			category: 'Database',
			skills: ['SQL', 'DBMS', 'Hibernate ORM', 'OpenSearch']
		},
		{
			category: 'DevOps & Tools',
			skills: ['Git', 'Kubernetes', 'CI/CD', 'Jenkins', 'Firebase', 'Containerization']
		},
		{
			category: 'Languages',
			skills: ['English', 'Chinese', 'Malay']
		}
	]
};
