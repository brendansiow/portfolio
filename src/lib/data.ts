import content from '$lib/content/portfolio.json';
import type { PortfolioData } from '$lib/types';

// Assignment checks the JSON against the schema during npm run check.
export const portfolioData: PortfolioData = content;

export const resumeProjects = portfolioData.projects.filter((project) => project.includeInResume);
