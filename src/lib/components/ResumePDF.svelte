<script lang="ts">
	import { portfolioData, resumeProjects } from '$lib/data';
	import CompanyLogo from './CompanyLogo.svelte';
	import { MapPin, Mail, Phone, Linkedin, Github, ArrowUpRight } from 'lucide-svelte';
	const { personalInfo, workExperience, education, skills, activities } = portfolioData;
	const career = workExperience.filter((job) => !job.earlyCareer);
	const earlyCareer = workExperience.filter((job) => job.earlyCareer);
	const projectPages = Array.from({ length: Math.ceil(resumeProjects.length / 8) }, (_, index) =>
		resumeProjects.slice(index * 8, index * 8 + 8)
	);
	const totalPages = 5 + projectPages.length;
	const stripUrl = (url: string) => url.replace(/^https?:\/\/(www\.)?/, '').replace(/\/$/, '');
	const contacts = [
		{ icon: MapPin, value: personalInfo.shortLocation, href: '' },
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

<svelte:head>
	<title>{personalInfo.name} | Resume</title>
</svelte:head>

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

{#snippet pageHeading(title: string)}
	<div class="page-heading">
		<p class="kicker">{personalInfo.name}</p>
		<h2>{title}</h2>
	</div>
{/snippet}

{#snippet footer(number: number, label: string)}
	<div class="sheet-footer">
		<span>{personalInfo.name} · {label}</span>
		<span>{String(number).padStart(2, '0')} / {String(totalPages).padStart(2, '0')}</span>
	</div>
{/snippet}

<div id="resume-pdf">
	<div class="resume-sheet about-sheet">
		{@render pageHeading('About')}
		<header class="card identity">
			<p class="kicker">{personalInfo.title}</p>
			<h1>{personalInfo.name}</h1>
			<p class="headline">{personalInfo.heroSummary}</p>
			<div class="pills focus">
				{#each personalInfo.focus as item (item)}<span>{item}</span>{/each}
			</div>
		</header>
		<section class="card about-card">
			<h2>Built with intention.</h2>
			<p>{personalInfo.bio}</p>
			{#if career[0]}
				<div class="current-role">
					<p class="kicker">Currently</p>
					<h3>{career[0].position} · {career[0].company}</h3>
					<p class="date">{career[0].duration}</p>
				</div>
			{/if}
		</section>
		<section class="card contact-card">
			<h2>Contact</h2>
			{#each contacts as item (item.value)}
				<div class="contact">
					<item.icon size={15} strokeWidth={1.7} aria-hidden="true" />
					{#if item.href}<a href={item.href}>{item.value}</a>{:else}<span>{item.value}</span>{/if}
				</div>
			{/each}
		</section>
		{@render footer(1, personalInfo.title)}
	</div>

	<div class="resume-sheet experience-sheet">
		{@render pageHeading('Experience')}
		{@render careerCards(career.slice(0, 3))}
		{@render footer(2, 'Experience')}
	</div>

	<div class="resume-sheet experience-sheet continuation-sheet">
		{@render pageHeading('Experience, continued.')}
		{@render careerCards(career.slice(3))}
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
							{#if job.description.length}
								<ul>
									{#each job.description as line (line)}<li>{line}</li>{/each}
								</ul>
							{/if}
						</article>
					{/each}
				</div>
			</section>
		{/if}
		{@render footer(3, 'Experience')}
	</div>

	{#each projectPages as projects, index}
		<div class="resume-sheet projects-sheet">
			{@render pageHeading(index === 0 ? 'Selected work' : 'Selected work, continued.')}
			<section class="project-grid">
				{#each projects as project (project.id)}
					<article class="card project">
						<h3>{project.title}</h3>
						<p>{project.description}</p>
						{#if project.technologies.length}
							<div class="pills">
								{#each project.technologies as tech (tech)}<span>{tech}</span>{/each}
							</div>
						{/if}
						{#if project.githubUrl || project.storeUrl || project.liveUrl}
							<a
								class="project-link"
								href={project.githubUrl || project.storeUrl || project.liveUrl}
							>
								View {project.githubUrl ? 'source' : project.storeUrl ? 'app' : 'website'}
								<ArrowUpRight size={12} aria-hidden="true" />
							</a>
						{/if}
					</article>
				{/each}
			</section>
			{@render footer(index + 4, 'Selected work')}
		</div>
	{/each}

	<div class="resume-sheet skills-sheet">
		{@render pageHeading('Skills')}
		<section class="skills-list">
			{#each skills as group (group.category)}
				<article class="card skill-card">
					<h3>{group.category}</h3>
					<div class="pills">
						{#each group.skills as skill (skill)}<span>{skill}</span>{/each}
					</div>
				</article>
			{/each}
		</section>
		{@render footer(4 + projectPages.length, 'Skills')}
	</div>

	<div class="resume-sheet education-sheet">
		{@render pageHeading('Education & recognition')}
		<section class="education-list">
			{#each education as item (item.id)}
				<article class="card education">
					<h3>{item.degree}</h3>
					<p>{item.institution}</p>
					<p class="date">{item.duration} · {item.location}</p>
					{#if item.gpa}<span class="honour">{item.gpa}</span>{/if}
				</article>
			{/each}
		</section>
		{#if activities.length}
			<section class="recognition-list">
				<h2>Activity</h2>
				{#each activities as item (item.id)}
					<article class="card activity">
						<p class="kicker">{item.achievement}</p>
						<h3>{item.title}</h3>
						<p>{item.description}</p>
						<a class="project-link" href={item.url}
							>View achievement <ArrowUpRight size={12} aria-hidden="true" /></a
						>
					</article>
				{/each}
			</section>
		{/if}
		{@render footer(totalPages, 'Education & recognition')}
	</div>
</div>

<style>
	#resume-pdf {
		--r-sheet-bg: radial-gradient(ellipse at 15% 0%, var(--soft), transparent 65%), var(--paper);
		color: var(--ink);
		font-family: 'Helvetica Neue', Helvetica, Arial, sans-serif;
		font-size: 9pt;
		font-variant-ligatures: none;
		line-height: 1.5;
		-webkit-print-color-adjust: exact;
		print-color-adjust: exact;
	}
	.resume-sheet {
		position: relative;
		width: 210mm;
		height: 296.8mm;
		margin: 0 auto 24px;
		padding: 12mm 14mm 10mm;
		display: flex;
		flex-direction: column;
		gap: 16px;
		background: var(--r-sheet-bg);
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
	h1,
	h2,
	h3,
	p {
		margin: 0;
	}
	h1,
	h2,
	h3,
	.kicker,
	.pills,
	.sheet-footer {
		font-family: var(--mono);
	}
	h1 {
		font-size: 40pt;
		line-height: 1.1;
		letter-spacing: -0.055em;
		font-weight: 400;
		margin: 18px 0;
	}
	h2 {
		font-size: 22pt;
		line-height: 1.2;
		letter-spacing: -0.035em;
	}
	h3 {
		font-size: 10pt;
		font-weight: 700;
		letter-spacing: -0.015em;
	}
	p,
	ul {
		color: var(--muted);
	}
	a {
		color: inherit;
		text-decoration: none;
	}
	.kicker {
		text-transform: uppercase;
		letter-spacing: 0.14em;
		font-size: 7pt;
		font-weight: 700;
		color: var(--muted);
		margin: 0 0 7px;
	}
	.page-heading {
		margin: 0 4px 10px;
	}
	.identity {
		padding: 30px;
		background: var(--glass-strong-surface);
	}
	.headline {
		font-size: 12pt;
		line-height: 1.6;
		max-width: 50ch;
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
		color: var(--muted);
		border: 0.5px solid var(--line);
		border-radius: 99px;
		padding: 3px 9px;
		background: var(--glass);
	}
	.focus {
		margin-top: 20px;
	}
	.about-card {
		padding: 24px;
	}
	.about-card h2 {
		font-size: 18pt;
	}
	.about-card > p {
		margin-top: 12px;
		font-size: 11pt;
		line-height: 1.65;
	}
	.current-role {
		border-top: 0.5px solid var(--line);
		margin-top: 20px;
		padding-top: 14px;
	}
	.current-role .date {
		margin-top: 4px;
	}
	.contact-card {
		display: grid;
		gap: 13px;
		padding: 24px;
	}
	.contact-card h2 {
		font-size: 16pt;
		margin-bottom: 2px;
	}
	.contact {
		display: flex;
		gap: 9px;
		align-items: center;
		font-size: 9.5pt;
		color: var(--muted);
	}
	.contact :global(svg) {
		flex-shrink: 0;
	}
	.career-list,
	.early-grid,
	.skills-list,
	.education-list,
	.recognition-list {
		display: grid;
		gap: 16px;
	}
	.job {
		padding: 18px 20px;
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
		font-size: 10pt;
		margin-top: 2px;
	}
	.date {
		font-size: 7.8pt;
		color: var(--muted);
		white-space: nowrap;
	}
	.logo {
		width: 64px;
		height: 32px;
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
		font-size: 9pt;
		line-height: 1.55;
	}
	li + li {
		margin-top: 3px;
	}
	.early-grid {
		gap: 10px;
	}
	.early-section > .kicker {
		margin: 0 4px 10px;
	}
	.early-job {
		padding: 16px 18px;
	}
	.early-heading {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
	}
	.early-role {
		font-size: 9pt;
		margin-top: 2px;
	}
	.early-job ul {
		font-size: 9pt;
		line-height: 1.5;
		margin-top: 8px;
	}
	.project-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 14px;
	}
	.project {
		display: flex;
		flex-direction: column;
		padding: 18px;
		min-height: 180px;
	}
	.project p {
		font-size: 9pt;
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
	.skill-card {
		padding: 24px;
	}
	.skill-card h3 {
		font-size: 12pt;
	}
	.skill-card .pills span {
		font-size: 9pt;
		padding: 6px 12px;
	}
	.education {
		padding: 24px;
	}
	.education h3 {
		font-size: 12pt;
	}
	.education p {
		font-size: 10pt;
		margin-top: 8px;
	}
	.honour {
		display: inline-block;
		font-size: 9pt;
		font-weight: 600;
		margin-top: 10px;
		color: var(--muted);
	}
	.recognition-list {
		margin-top: 10px;
	}
	.recognition-list > h2 {
		margin-left: 4px;
		font-size: 18pt;
	}
	.activity p:not(.kicker) {
		font-size: 10pt;
		margin-top: 10px;
	}
	.activity .project-link {
		margin-top: 14px;
	}
	.sheet-footer {
		display: flex;
		justify-content: space-between;
		margin-top: auto;
		padding: 10px 4px 0;
		font-size: 7pt;
		color: var(--muted);
	}
	.about-sheet > .card {
		flex: 1;
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.experience-sheet .career-list,
	.project-grid,
	.skills-list {
		flex: 1;
		grid-auto-rows: 1fr;
	}
	.job,
	.early-job,
	.skill-card,
	.education {
		display: flex;
		flex-direction: column;
		justify-content: center;
	}
	.continuation-sheet .early-section {
		flex: 2;
		display: flex;
		flex-direction: column;
	}
	.early-grid {
		flex: 1;
		grid-auto-rows: 1fr;
	}
	.education-list {
		flex: 3;
		grid-auto-rows: 1fr;
	}
	.recognition-list {
		flex: 1.5;
		grid-template-rows: auto 1fr;
	}
	.activity {
		display: flex;
		flex-direction: column;
		justify-content: center;
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
			box-shadow: none;
			border-width: 0.75px;
			border-top-color: var(--highlight);
		}
	}
</style>
