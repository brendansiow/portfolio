export interface PersonalInfo {
	name: string;
	title: string;
	location: string;
	email: string;
	phone: string;
	linkedin: string;
	github: string;
	website: string;
	bio: string;
	profileImage: string;
	headline: string;
	headlineLead: string;
	headlineAccent: string;
	heroSummary: string;
	aboutSummary: string;
	shortLocation: string;
	initials: string;
	focus: string[];
	availability: string;
}

export interface WorkExperience {
	id: string;
	company: string;
	position: string;
	duration: string;
	location: string;
	description: string[];
	technologies: string[];
	companyUrl?: string;
	companyLogo?: string;
	companyLogoDark?: string;
	earlyCareer?: boolean;
}

export interface Project {
	id: string;
	title: string;
	description: string;
	technologies: string[];
	githubUrl?: string;
	liveUrl?: string;
	imageUrl?: string;
	logoUrl?: string;
	logoDarkUrl?: string;
	storeUrl?: string;
	appStoreUrl?: string;
	featured: boolean;
	includeInResume: boolean;
}

export interface Education {
	id: string;
	institution: string;
	degree: string;
	duration: string;
	location: string;
	gpa?: string;
	description?: string;
}

export interface Certificate {
	id: string;
	name: string;
	issuer: string;
	date: string;
	credentialId?: string;
	credentialUrl?: string;
}

export interface Skill {
	category: string;
	skills: string[];
}

export interface PortfolioData {
	personalInfo: PersonalInfo;
	resume: { filename: string };
	workExperience: WorkExperience[];
	projects: Project[];
	education: Education[];
	certificates: Certificate[];
	skills: Skill[];
	activities: Activity[];
}
export interface Activity {
	id: string;
	title: string;
	category: string;
	achievement: string;
	description: string;
	context: string;
	highlights: string[];
	url: string;
}
