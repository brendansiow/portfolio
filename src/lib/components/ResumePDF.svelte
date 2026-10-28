<script lang="ts">
	import { portfolioData, resumeProjects } from '$lib/data';
	import CompanyLogo from './CompanyLogo.svelte';
	import { MapPin, Mail, Phone, Linkedin, Github, ArrowUpRight } from 'lucide-svelte';
	const { personalInfo, workExperience, education, skills, activities } = portfolioData;
	const career = workExperience.filter((job) => !job.earlyCareer);
	const projectPages = Array.from({ length: Math.ceil(resumeProjects.length / 8) }, (_, index) =>
		resumeProjects.slice(index * 8, index * 8 + 8)
	);
	const totalPages = 3 + projectPages.length;
	const earlyCareer = workExperience.filter((job) => job.earlyCareer);
	const stripUrl = (url: string) => url.replace(/^https?:\/\//, '').replace(/\/$/, '');
	const contacts = [
		{ icon: MapPin, value: personalInfo.location, href: '' },
		{ icon: Mail, value: personalInfo.email, href: `mailto:${personalInfo.email}` },
		{
			icon: Phone,
			value: personalInfo.phone,
			href: `tel:${personalInfo.phone.replace(/[^+\d]/g, '')}`
		},
		{ icon: Linkedin, value: stripUrl(personalInfo.linkedin), href: personalInfo.linkedin },
		{ icon: Github, value: stripUrl(personalInfo.github), href: personalInfo.github }
	];
</script>

{#snippet careerCards(jobs: typeof career)}
	<div class="career-list">
		{#each jobs as job (job.id)}
			<article class="card job">
				<div class="job-heading">
					{#if job.companyLogo}<div class="logo">
							<CompanyLogo src={job.companyLogo} darkSrc={job.companyLogoDark} loading="eager" />
						</div>{/if}
					<div class="job-identity">
						<h3>{job.position}</h3>
						<p>
							{#if job.companyUrl}<a href={job.companyUrl}>{job.company}</a
								>{:else}{job.company}{/if}
						</p>
					</div>
					<span class="date">{job.duration}</span>
				</div>
				<ul>
					{#each job.description as line (line)}<li>{line}</li>{/each}
				</ul>
				<div class="pills">
					{#each job.technologies as tech (tech)}<span>{tech}</span>{/each}
				</div>
			</article>
		{/each}
	</div>
{/snippet}

<div id="resume-pdf">
	<div class="resume-sheet">
		<header class="hero-grid">
			<div class="card identity">
				<p class="kicker">{personalInfo.title}</p>
				<h1>{personalInfo.name}</h1>
				<p class="headline">{personalInfo.heroSummary}</p>
				<div class="pills focus">
					{#each personalInfo.focus as item (item)}<span>{item}</span>{/each}
				</div>
			</div>
			<div class="card contact-card">
				<p class="kicker">Let’s connect</p>
				{#each contacts as item (item.value)}
					<div class="contact">
						<item.icon size={14} strokeWidth={1.7} />
						{#if item.href}<a href={item.href}>{item.value}</a>{:else}<span>{item.value}</span>{/if}
					</div>
				{/each}
				{#if personalInfo.website && personalInfo.website !== personalInfo.github}
					<a class="website" href={personalInfo.website}
						>{stripUrl(personalInfo.website)} <ArrowUpRight size={12} /></a
					>
				{/if}
			</div>
		</header>
		<section>
			<div class="section-heading">
				<div>
					<p class="kicker">Career</p>
					<h2>Experience at a glance</h2>
				</div>
			</div>
			{@render careerCards(career.slice(0, 2))}
		</section>
		<div class="sheet-footer">
			<span>{personalInfo.name} · {personalInfo.title}</span><span
				>01 / {String(totalPages).padStart(2, '0')}</span
			>
		</div>
	</div>

	<div class="resume-sheet">
		<div class="page-heading">
			<div>
				<p class="kicker">{personalInfo.name}</p>
				<h2>Experience, continued.</h2>
			</div>
		</div>
		{@render careerCards(career.slice(2))}
		{#if earlyCareer.length}
			<section class="early-section">
				<p class="kicker">Earlier experience</p>
				<div class="early-grid">
					{#each earlyCareer as job (job.id)}
						<article class="card early-job">
							<div class="early-heading">
								<h3>{job.company}</h3>
								<span class="date">{job.duration}</span>
							</div>
							<p class="early-role">{job.position}</p>
							<ul>
								{#each job.description as line (line)}<li>{line}</li>{/each}
							</ul>
						</article>
					{/each}
				</div>
			</section>
		{/if}
		<div class="sheet-footer">
			<span>{personalInfo.name} · {personalInfo.title}</span><span
				>02 / {String(totalPages).padStart(2, '0')}</span
			>
		</div>
	</div>

	<div class="resume-sheet second-sheet">
		<div class="page-heading">
			<div>
				<p class="kicker">{personalInfo.name}</p>
				<h2>Skills & background.</h2>
			</div>
		</div>
		<div class="support-grid">
			<section class="card skills-card">
				<p class="kicker">Toolkit</p>
				<h2>Technical strengths</h2>
				{#each skills as group (group.category)}
					<div class="skill-group">
						<h3>{group.category}</h3>
						<div class="pills">
							{#each group.skills as skill (skill)}<span>{skill}</span>{/each}
						</div>
					</div>
				{/each}
			</section>
			<section class="card education-card">
				<p class="kicker">Background</p>
				<h2>Education</h2>
				{#each education as item (item.id)}
					<article class="education">
						<h3>{item.degree}</h3>
						<p>{item.institution}</p>
						<p class="date">{item.duration} · {item.location}</p>
						{#if item.gpa}<span class="honour">{item.gpa}</span>{/if}
					</article>
				{/each}
			</section>
		</div>

		{#if activities.length}
			<div class="recognition">
				<span class="kicker">Community</span><span
					>{activities.map((item) => `${item.achievement} · ${item.title}`).join(' / ')}</span
				>
			</div>
		{/if}
		<div class="sheet-footer">
			<a href={`mailto:${personalInfo.email}`}>{personalInfo.email}</a><span
				>03 / {String(totalPages).padStart(2, '0')}</span
			>
		</div>
	</div>
	{#each projectPages as projects, index}
		<div class="resume-sheet">
			<div class="page-heading"><p class="kicker">{personalInfo.name}</p></div>
			<section class="projects-section">
				<div class="section-heading">
					<div>
						<p class="kicker">Selected work</p>
						<h2>Projects & product delivery</h2>
					</div>
				</div>
				<div class="project-grid">
					{#each projects as project (project.id)}
						<article class="card project">
							<h3>{project.title}</h3>
							<p>{project.description}</p>
							<div class="pills">
								{#each project.technologies as tech (tech)}<span>{tech}</span>{/each}
							</div>
							{#if project.githubUrl || project.liveUrl || project.storeUrl}
								<a
									class="project-link"
									href={project.githubUrl || project.liveUrl || project.storeUrl}
									>Explore project <ArrowUpRight size={12} /></a
								>
							{/if}
						</article>
					{/each}
				</div>
			</section>

			<div class="sheet-footer">
				<span>{personalInfo.name} · {personalInfo.title}</span><span
					>{String(index + 4).padStart(2, '0')} / {String(totalPages).padStart(2, '0')}</span
				>
			</div>
		</div>
	{/each}
</div>

<style>
	/* The same surface tokens power the portfolio's .glass and .glass-strong. */
	#resume-pdf {
		--r-text: var(--ink);
		--r-muted: var(--muted);
		--r-soft: var(--muted);
		--r-pill-bg: var(--glass);
		--r-pill-border: var(--line);
		--r-highlight: var(--highlight);
		--r-sheet-bg: radial-gradient(ellipse at 15% 0%, var(--soft), transparent 65%), var(--paper);
		--r-sheet-secondary: var(--r-sheet-bg);
		color: var(--r-text);
		font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
		font-size: 9pt;
		line-height: 1.5;
		-webkit-print-color-adjust: exact;
		print-color-adjust: exact;
	}

	.resume-sheet {
		position: relative;
		width: 210mm;
		height: 296.8mm;
		margin: 0 auto 24px;
		padding: 11mm 14mm 10mm;
		display: flex;
		flex-direction: column;
		gap: 14px;
		background: var(--r-sheet-bg);
	}
	.second-sheet {
		background: var(--r-sheet-secondary);
	}
	.card {
		border: 0.5px solid var(--glass-border);
		border-radius: 24px;
		background: var(--glass-surface);
		box-shadow:
			inset 0 1px 0 var(--glass-highlight),
			0 8px 24px var(--shadow);
		padding: 20px;
		break-inside: avoid;
	}
	.hero-grid {
		display: grid;
		grid-template-columns: 1.5fr 1fr;
		gap: 14px;
	}
	.identity {
		background: var(--glass-strong-surface);
		padding: 24px;
	}
	.kicker {
		text-transform: uppercase;
		letter-spacing: 0.14em;
		font-size: 7pt;
		font-weight: 700;
		color: var(--r-muted);
		margin: 0 0 7px;
	}
	h1,
	h2,
	.kicker,
	.pills,
	.sheet-footer {
		font-family: var(--mono);
	}
	h1 {
		font-size: 29pt;
		line-height: 1.05;
		letter-spacing: -0.055em;
		font-weight: 400;
		margin: 16px 0 12px;
	}
	h2 {
		font-size: 17pt;
		line-height: 1.2;
		letter-spacing: -0.035em;
		font-weight: 700;
		margin: 0;
	}
	h3 {
		font-size: 10pt;
		font-weight: 700;
		letter-spacing: -0.015em;
		margin: 0;
	}
	p {
		margin: 0;
		color: var(--r-muted);
	}
	a {
		color: inherit;
		text-decoration: none;
	}
	.headline {
		font-size: 10pt;
		line-height: 1.55;
		max-width: 32ch;
	}
	.focus {
		margin-top: 18px !important;
	}
	.contact-card {
		display: flex;
		flex-direction: column;
		justify-content: center;
		gap: 16px;
		padding: 20px 16px;
	}
	.contact {
		display: flex;
		gap: 9px;
		align-items: flex-start;
		font-size: 7.7pt;
		color: var(--r-muted);
		overflow-wrap: anywhere;
	}
	.contact :global(svg) {
		flex-shrink: 0;
		margin-top: 1px;
	}
	.website {
		font-size: 7.7pt;
		display: flex;
		align-items: center;
		gap: 4px;
	}
	.section-heading {
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin: 3px 4px 14px;
		break-inside: avoid;
		break-after: avoid;
	}
	.career-list {
		display: flex;
		flex-direction: column;
		gap: 12px;
	}
	.job {
		padding: 15px 20px;
	}
	.job-heading {
		display: flex;
		gap: 12px;
		align-items: center;
	}
	.job-identity {
		flex: 1;
	}
	.job-identity p {
		font-size: 9pt;
		margin-top: 2px;
	}
	.date {
		font-size: 7.8pt;
		color: var(--r-soft);
		white-space: nowrap;
	}
	.logo {
		width: 64px;
		height: 32px;
		padding: 0;
		border-radius: 12px;
		background: none;
		border: 0;
		flex-shrink: 0;
	}
	.logo :global(img) {
		width: 100%;
		height: 100%;
		object-fit: contain;
	}
	ul {
		margin: 12px 0 0;
		padding-left: 14px;
		list-style: disc;
		color: var(--r-muted);
		font-size: 9pt;
		line-height: 1.55;
	}
	li + li {
		margin-top: 3px;
	}
	li::marker {
		color: var(--r-soft);
	}
	.pills {
		display: flex;
		gap: 5px;
		flex-wrap: wrap;
		margin-top: 12px;
	}
	.pills span {
		font-size: 7.2pt;
		font-weight: 500;
		color: var(--r-muted);
		border: 0.5px solid var(--r-pill-border);
		border-radius: 99px;
		padding: 3px 9px;
		background: var(--r-pill-bg);
	}
	.sheet-footer {
		display: flex;
		justify-content: space-between;
		margin-top: auto;
		padding: 10px 4px 0;
		font-size: 7pt;
		color: var(--r-soft);
	}
	.page-heading {
		display: flex;
		justify-content: space-between;
		align-items: center;
		margin: 0 4px 2px;
	}
	.page-heading h2 {
		font-size: 22pt;
		line-height: 1.15;
	}
	.support-grid {
		display: grid;
		grid-template-columns: 1.1fr 1fr;
		gap: 14px;
	}
	.support-grid > .card {
		padding: 18px;
	}
	.support-grid h2 {
		font-size: 16pt;
		margin-bottom: 16px;
	}
	.skill-group + .skill-group {
		margin-top: 10px;
	}
	.skill-group h3 {
		font-size: 8pt;
	}
	.skill-group .pills {
		margin-top: 6px;
		gap: 4px;
	}
	.skill-group .pills span {
		padding: 2px 8px;
		font-size: 7pt;
	}
	.education + .education {
		border-top: 0.5px solid var(--line);
		padding-top: 14px;
		margin-top: 14px;
	}
	.education h3 {
		font-size: 9pt;
		line-height: 1.4;
	}
	.education p {
		font-size: 8pt;
		margin-top: 4px;
	}
	.honour {
		display: inline-block;
		margin-top: 6px;
		font-size: 7.5pt;
		font-weight: 600;
		color: var(--r-muted);
	}
	.project-grid,
	.early-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 14px;
	}
	.project {
		display: flex;
		flex-direction: column;
		padding: 18px;
	}
	.project p {
		font-size: 8.5pt;
		margin-top: 8px;
		line-height: 1.55;
	}
	.project .pills {
		margin-bottom: 10px;
	}
	.project-link {
		display: inline-flex;
		gap: 4px;
		align-items: center;
		font-size: 8pt;
		font-weight: 600;
		margin-top: auto;
	}
	.early-grid {
		grid-template-columns: 1fr;
		gap: 10px;
	}
	.early-section > .kicker {
		margin-left: 4px;
		margin-bottom: 10px;
	}
	.early-job {
		padding: 16px 18px;
	}
	.early-heading {
		display: flex;
		justify-content: space-between;
		align-items: center;
	}
	.early-role {
		font-size: 8pt;
		margin-top: 2px;
	}
	.early-job ul {
		font-size: 8pt;
		line-height: 1.5;
		margin-top: 8px;
	}
	.recognition {
		display: flex;
		gap: 12px;
		align-items: baseline;
		font-size: 8pt;
		color: var(--r-muted);
		margin: 0 4px;
	}
	.recognition .kicker {
		margin: 0;
	}
	@page resume {
		size: A4;
		margin: 0;
	}
	@media print {
		.resume-sheet {
			page: resume;
			margin: 0;
			break-after: page;
		}
		.resume-sheet:last-child {
			break-after: auto;
		}
		.card {
			/* Chromium rasterizes blurred shadows into rectangular PDF tiles.
			   Keep the glass fill and rounded vector border without those tiles. */
			box-shadow: none;
			border-width: 0.75px;
			border-top-color: var(--r-highlight);
			backdrop-filter: none;
		}
	}
</style>
