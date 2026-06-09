<script lang="ts">
	import { portfolioData } from '$lib/data.js';

	const { personalInfo, workExperience, education, skills } = portfolioData;

	// Flatten all technical skills (exclude Languages)
	const techSkills = skills
		.filter((s) => s.category !== 'Languages')
		.flatMap((s) => s.skills);
	const languages = skills.find((s) => s.category === 'Languages')?.skills || [];
</script>

<div id="resume-pdf" class="resume-pdf">
	<!-- HEADER -->
	<header class="header">
		<h1 class="name">{personalInfo.name}</h1>
		<p class="title">{personalInfo.title}</p>

		<div class="contact-bar">
			<span>{personalInfo.location}</span>
			<span class="sep">·</span>
			<span>{personalInfo.email}</span>
			<span class="sep">·</span>
			<span>{personalInfo.phone}</span>
			<span class="sep">·</span>
			<span>{personalInfo.linkedin}</span>
			<span class="sep">·</span>
			<span>{personalInfo.github}</span>
		</div>
	</header>

	<!-- PROFILE -->
	<section class="section">
		<p class="summary">
			Senior software engineer focused on backend systems, product delivery, and pragmatic engineering
			across Golang, Spring Boot, and mobile platforms. Comfortable moving between backend services,
			APIs, payment infrastructure, and release workflows — with a preference for clean architecture
			and reliable execution.
		</p>
	</section>

	<!-- SKILLS -->
	<section class="section compact">
		<h2 class="section-heading">Technical Skills</h2>
		<div class="skills-grid">
			<div>
				<span class="skill-label">Backend: </span><span class="skill-value">
					Golang, Java, Spring Boot, PHP, gRPC, REST API Design
				</span>
			</div>
			<div>
				<span class="skill-label">Frontend & Mobile: </span><span class="skill-value">
					SvelteKit, React, Angular, Next.js, Flutter, React Native, Ionic
				</span>
			</div>
			<div>
				<span class="skill-label">Database & DevOps: </span><span class="skill-value">
					SQL, OpenSearch, Kubernetes, Git, CI/CD, Jenkins, Firebase, Containerization
				</span>
			</div>
			<div>
				<span class="skill-label">Languages: </span><span class="skill-value">
					English, Chinese, Malay
				</span>
			</div>
		</div>
	</section>

	<!-- EXPERIENCE -->
	<section class="section">
		<h2 class="section-heading">Professional Experience</h2>

		<div class="job">
			<div class="job-header">
				<div class="job-left">
					<span class="job-title">Senior Software Engineer</span>
					<span class="at"> — </span>
					<span class="company">Mercedes-Benz Tech Innovation</span>
				</div>
				<span class="date">Jun 2024 – Present</span>
			</div>
			<ul class="job-list">
				<li>Built and maintained scalable Golang services with unit and integration testing.</li>
				<li>Contributed to Data Registry and Data Access Manager within MB.OS, improving data governance and discoverability.</li>
				<li>Designed APIs and metadata flows supporting EU Data Act compliance.</li>
				<li>Optimized data-heavy workflows using OpenSearch and SQL, improving query performance.</li>
			</ul>
			<p class="tech-line">Golang · Kubernetes · OpenSearch · Azure EventHub · SQL · Hugo Docs</p>
		</div>

		<div class="job">
			<div class="job-header">
				<div class="job-left">
					<span class="job-title">Senior Software Engineer</span>
					<span class="at"> — </span>
					<span class="company">Revenue Monster</span>
				</div>
				<span class="date">Sep 2023 – May 2024</span>
			</div>
			<ul class="job-list">
				<li>Built and enhanced payment platform features using Golang and Echo, with Next.js frontend work.</li>
				<li>Maintained merchant-facing and admin-facing portals, reporting, and Open API support.</li>
				<li>Expanded gateway capabilities with Apple Pay, Google Pay, and wallet integrations.</li>
				<li>Implemented a low-code checkout flow that reduced merchant integration effort.</li>
			</ul>
			<p class="tech-line">Golang · Echo · Next.js · Payment Gateway · Apple Pay · Google Pay</p>
		</div>

		<div class="job">
			<div class="job-header">
				<div class="job-left">
					<span class="job-title">Senior / IT Specialist</span>
					<span class="at"> — </span>
					<span class="company">iFAST Capital Sdn Bhd</span>
				</div>
				<span class="date">2019 – 2023</span>
			</div>
			<ul class="job-list">
				<li>Delivered fintech products across Flutter, React Native, React, Angular, and Java Spring Boot.</li>
				<li>Worked on regional investment apps, backend APIs, CI/CD pipelines, and mobile release processes.</li>
				<li>Modernized legacy applications, including Flutter version migrations and null safety upgrades.</li>
				<li>Coordinated delivery with stakeholders and supported cross-platform app store submissions.</li>
			</ul>
			<p class="tech-line">Flutter · React Native · React · Angular · Spring Boot · Jenkins · Firebase</p>
		</div>
	</section>

	<!-- EDUCATION -->
	<section class="section compact">
		<h2 class="section-heading">Education</h2>
		<div class="edu-grid">
			<div class="edu-item">
				<span class="edu-degree">Bachelor (Hons) in Software Engineering — First Class Honours</span>
				<span class="edu-school">Asia Pacific University, Malaysia</span>
			</div>
			<div class="edu-item">
				<span class="edu-degree">Diploma in Information Technology (Software Engineering) — CGPA 3.85</span>
				<span class="edu-school">Asia Pacific University, Malaysia</span>
			</div>
		</div>
	</section>
</div>

<style>
	.resume-pdf {
		width: 210mm;
		padding: 16mm 22mm;
		background: #ffffff;
		color: #1e293b;
		font-family: 'Plus Jakarta Sans', 'Segoe UI', 'Helvetica Neue', sans-serif;
		font-size: 9.5pt;
		line-height: 1.45;
		box-sizing: border-box;
		-webkit-print-color-adjust: exact;
		print-color-adjust: exact;
	}

	/* Header */
	.header {
		text-align: center;
		margin-bottom: 12px;
		padding-bottom: 10px;
		border-bottom: 1.5px solid #1e293b;
	}

	.name {
		font-size: 20pt;
		font-weight: 700;
		letter-spacing: -0.02em;
		color: #0f172a;
		margin: 0 0 3px 0;
	}

	.title {
		font-size: 10pt;
		font-weight: 500;
		color: #475569;
		margin: 0 0 8px 0;
		letter-spacing: 0.02em;
	}

	.contact-bar {
		font-size: 8.5pt;
		color: #475569;
		line-height: 1.6;
	}

	.contact-bar .sep {
		color: #94a3b8;
		margin: 0 5px;
	}

	/* Sections */
	.section {
		margin-bottom: 12px;
	}

	.section.compact {
		margin-bottom: 8px;
	}

	.section-heading {
		font-size: 10pt;
		font-weight: 700;
		color: #0f172a;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		border-bottom: 1px solid #cbd5e1;
		padding-bottom: 3px;
		margin: 0 0 8px 0;
	}

	.summary {
		margin: 0 0 4px 0;
		color: #334155;
		font-size: 9.5pt;
		line-height: 1.55;
	}

	/* Skills */
	.skills-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 3px 16px;
		font-size: 8.5pt;
		color: #334155;
		line-height: 1.5;
	}

	.skill-label {
		font-weight: 600;
		color: #0f172a;
	}

	.skill-value {
		color: #475569;
	}

	/* Jobs */
	.job {
		margin-bottom: 10px;
	}

	.job-header {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 8px;
		flex-wrap: wrap;
		margin-bottom: 4px;
	}

	.job-left {
		font-size: 10pt;
	}

	.job-title {
		font-weight: 700;
		color: #0f172a;
	}

	.at {
		color: #94a3b8;
	}

	.company {
		font-weight: 500;
		color: #475569;
	}

	.date {
		font-size: 8.5pt;
		color: #64748b;
		font-weight: 500;
		white-space: nowrap;
	}

	.job-list {
		margin: 3px 0 4px 0;
		padding-left: 16px;
		color: #334155;
		font-size: 9pt;
		line-height: 1.45;
	}

	.job-list li {
		margin-bottom: 1px;
	}

	.tech-line {
		margin: 3px 0 0 0;
		font-size: 8.2pt;
		color: #64748b;
		font-style: italic;
	}

	/* Education */
	.edu-grid {
		display: flex;
		flex-direction: column;
		gap: 3px;
		font-size: 9pt;
	}

	.edu-item {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 8px;
		flex-wrap: wrap;
	}

	.edu-degree {
		font-weight: 600;
		color: #0f172a;
	}

	.edu-school {
		color: #64748b;
		font-size: 8.5pt;
		white-space: nowrap;
	}
</style>
