<script lang="ts">
	import { portfolioData } from '$lib/data.js';
	import { MapPin, Mail, Phone, Linkedin, Github, Globe } from 'lucide-svelte';

	const { personalInfo, workExperience, education, skills, projects } = portfolioData;

	// Languages are separated out; everything else is "technical".
	const techSkillGroups = skills.filter((s) => s.category !== 'Languages');
	const languages = skills.find((s) => s.category === 'Languages')?.skills ?? [];

	// Projects that are NOT just a duplicate of a work-experience entry — these
	// give the resume a second page of substance without repeating roles.
	const selectedProjects = projects.filter((p) => !p.featured).slice(0, 3);

	const stripUrl = (u?: string) =>
		u ? u.replace(/^https?:\/\//, '').replace(/^www\./, '').replace(/\/$/, '') : '';

	const contactItems = [
		{ icon: MapPin, value: personalInfo.location },
		{ icon: Mail, value: personalInfo.email, href: `mailto:${personalInfo.email}` },
		{ icon: Phone, value: personalInfo.phone, href: `tel:${personalInfo.phone.replace(/[^+\d]/g, '')}` },
		{ icon: Linkedin, value: stripUrl(personalInfo.linkedin), href: personalInfo.linkedin },
		{ icon: Github, value: stripUrl(personalInfo.github), href: personalInfo.github }
	];
	if (personalInfo.website && personalInfo.website !== personalInfo.github) {
		contactItems.push({ icon: Globe, value: stripUrl(personalInfo.website), href: personalInfo.website });
	}
</script>

<div id="resume-pdf" class="resume-pdf">
	<!-- Frozen mesh-gradient backdrop (self-contained for print) -->
	<div class="resume-bg" aria-hidden="true">
		<span class="blob blob-blue"></span>
		<span class="blob blob-purple"></span>
		<span class="blob blob-cyan"></span>
		<span class="blob blob-blue-2"></span>
	</div>

	<div class="resume-inner">
		<!-- HEADER -->
		<header class="card card-strong header-card">
			<div class="header-top">
				<div>
					<p class="kicker">Senior Software Engineer</p>
					<h1 class="name">{personalInfo.name}</h1>
					<p class="title-line">{personalInfo.title}</p>
				</div>
			</div>
			<p class="summary">{personalInfo.bio}</p>
			<div class="contact-row">
				{#each contactItems as item}
					{#if item.href}
						<a class="contact-pill" href={item.href}>
							<item.icon class="ci" />
							<span>{item.value}</span>
						</a>
					{:else}
						<span class="contact-pill">
							<item.icon class="ci" />
							<span>{item.value}</span>
						</span>
					{/if}
				{/each}
			</div>
		</header>

		<!-- EXPERIENCE -->
		<section class="block">
			<div class="section-head">
				<span class="kicker">Career</span>
				<h2 class="section-title">Professional Experience</h2>
				<span class="rule"></span>
			</div>

			{#each workExperience as exp}
				<article class="card job">
					<div class="job-head">
						<div class="job-left">
							<span class="job-title">{exp.position}</span>
							<span class="at"> · </span>
							<span class="company">{exp.company}</span>
						</div>
						<span class="date">{exp.duration}</span>
					</div>
					<p class="job-loc">{exp.location}</p>
					<ul class="job-list">
						{#each exp.description as line}
							<li>{line}</li>
						{/each}
					</ul>
					<div class="pills">
						{#each exp.technologies as t}
							<span class="pill">{t}</span>
						{/each}
					</div>
				</article>
			{/each}
		</section>

		<!-- SKILLS -->
		<section class="block">
			<div class="section-head">
				<span class="kicker">Toolkit</span>
				<h2 class="section-title">Technical Skills</h2>
				<span class="rule"></span>
			</div>

			<div class="card skills-card">
				<div class="skills-grid">
					{#each techSkillGroups as group}
						<div class="skill-group">
							<p class="skill-label">{group.category}</p>
							<div class="pills pills-tight">
								{#each group.skills as s}
									<span class="pill">{s}</span>
								{/each}
							</div>
						</div>
					{/each}
				</div>
				<div class="skill-group lang-group">
					<p class="skill-label">Languages</p>
					<div class="pills pills-tight">
						{#each languages as l}
							<span class="pill pill-lang">{l}</span>
						{/each}
					</div>
				</div>
			</div>
		</section>

		<!-- EDUCATION -->
		<section class="block">
			<div class="section-head">
				<span class="kicker">Background</span>
				<h2 class="section-title">Education</h2>
				<span class="rule"></span>
			</div>

			<div class="card edu-card">
				{#each education as e, i}
					<div class="edu-row" class:divided={i > 0}>
						<div class="edu-main">
							<span class="edu-degree">{e.degree}</span>
							<span class="edu-school">{e.institution} · {e.location}</span>
						</div>
						{#if e.gpa}
							<span class="edu-gpa">{e.gpa}</span>
						{/if}
					</div>
				{/each}
			</div>
		</section>

		<!-- SELECTED PROJECTS -->
		{#if selectedProjects.length}
			<section class="block">
				<div class="section-head">
					<span class="kicker">Beyond roles</span>
					<h2 class="section-title">Selected Projects</h2>
					<span class="rule"></span>
				</div>

				{#each selectedProjects as proj}
					<article class="card proj">
						<div class="proj-head">
							<span class="proj-title">{proj.title}</span>
							{#if proj.liveUrl ?? proj.githubUrl}
								{@const link = proj.liveUrl ?? proj.githubUrl}
								<a class="proj-link" href={link}>{stripUrl(link)}</a>
							{/if}
						</div>
						<p class="proj-desc">{proj.description}</p>
						<div class="pills">
							{#each proj.technologies as t}
								<span class="pill">{t}</span>
							{/each}
						</div>
					</article>
				{/each}
			</section>
		{/if}

		<footer class="resume-foot">
			<span>{personalInfo.name} · {personalInfo.title}</span>
			<span class="dot">·</span>
			<span>{personalInfo.email}</span>
		</footer>
	</div>
</div>

<style>
	/* ── Theme tokens ────────────────────────────────────────── */
	.resume-pdf {
		--r-bg: #eef4fb;
		--r-bg2: #e5edf8;
		--r-text: #0f172a;
		--r-muted: #475569;
		--r-soft: #64748b;
		--r-card-bg: linear-gradient(180deg, rgba(240, 248, 255, 0.62) 0%, rgba(226, 238, 253, 0.34) 100%);
		--r-card-strong-bg: linear-gradient(180deg, rgba(240, 248, 255, 0.78) 0%, rgba(224, 237, 255, 0.42) 100%);
		--r-card-border: rgba(120, 170, 245, 0.45);
		--r-card-hi: rgba(255, 255, 255, 0.75);
		--r-shadow: 0 10px 30px rgba(15, 23, 42, 0.08);
		--r-pill-bg: rgba(96, 165, 250, 0.14);
		--r-pill-text: #1d4ed8;
		--r-pill-border: rgba(96, 165, 250, 0.3);
		--r-pill-lang-bg: rgba(167, 139, 250, 0.16);
		--r-pill-lang-text: #6d28d9;
		--r-pill-lang-border: rgba(167, 139, 250, 0.3);
		--r-accent: #2563eb;
		--r-contact-bg: rgba(255, 255, 255, 0.5);
		--r-contact-border: rgba(160, 200, 255, 0.5);
		--r-rule: rgba(148, 163, 184, 0.35);
		--r-divide: rgba(148, 163, 184, 0.28);
		--blob-opacity: 0.7;
	}

	:global(.dark) .resume-pdf {
		--r-bg: #0b1220;
		--r-bg2: #121c2f;
		--r-text: #e2e8f0;
		--r-muted: #94a3b8;
		--r-soft: #94a3b8;
		--r-card-bg: linear-gradient(180deg, rgba(30, 42, 65, 0.62) 0%, rgba(18, 28, 48, 0.34) 100%);
		--r-card-strong-bg: linear-gradient(180deg, rgba(34, 48, 74, 0.78) 0%, rgba(20, 30, 52, 0.42) 100%);
		--r-card-border: rgba(100, 140, 205, 0.28);
		--r-card-hi: rgba(255, 255, 255, 0.07);
		--r-shadow: 0 10px 30px rgba(2, 6, 23, 0.4);
		--r-pill-bg: rgba(96, 165, 250, 0.18);
		--r-pill-text: #93c5fd;
		--r-pill-border: rgba(96, 165, 250, 0.34);
		--r-pill-lang-bg: rgba(167, 139, 250, 0.2);
		--r-pill-lang-text: #c4b5fd;
		--r-pill-lang-border: rgba(167, 139, 250, 0.36);
		--r-accent: #60a5fa;
		--r-contact-bg: rgba(40, 55, 85, 0.5);
		--r-contact-border: rgba(110, 150, 215, 0.3);
		--r-rule: rgba(100, 140, 200, 0.3);
		--r-divide: rgba(100, 140, 200, 0.22);
		--blob-opacity: 0.5;
	}

	/* ── Shell ────────────────────────────────────────────────── */
	.resume-pdf {
		position: relative;
		width: 210mm;
		max-width: 100%;
		margin: 0 auto;
		background: linear-gradient(180deg, var(--r-bg) 0%, var(--r-bg2) 100%);
		color: var(--r-text);
		font-family: 'Plus Jakarta Sans', 'Segoe UI', 'Helvetica Neue', sans-serif;
		font-size: 10pt;
		line-height: 1.5;
		box-sizing: border-box;
		-webkit-print-color-adjust: exact;
		print-color-adjust: exact;
		overflow: hidden;
	}

	.resume-inner {
		position: relative;
		z-index: 1;
		padding: 16mm 16mm 14mm;
	}

	/* ── Frozen mesh blobs ────────────────────────────────────── */
	.resume-bg {
		position: absolute;
		inset: 0;
		z-index: 0;
		overflow: hidden;
		pointer-events: none;
	}

	.blob {
		position: absolute;
		border-radius: 50%;
		filter: blur(90px);
		opacity: var(--blob-opacity);
	}

	.blob-blue {
		width: 540px;
		height: 540px;
		background: radial-gradient(circle, rgba(96, 165, 250, 0.7), transparent 70%);
		top: -12%;
		left: -8%;
	}
	.blob-purple {
		width: 460px;
		height: 460px;
		background: radial-gradient(circle, rgba(167, 139, 250, 0.6), transparent 70%);
		top: 18%;
		right: -10%;
	}
	.blob-cyan {
		width: 420px;
		height: 420px;
		background: radial-gradient(circle, rgba(34, 211, 238, 0.5), transparent 70%);
		bottom: -10%;
		left: 22%;
	}
	.blob-blue-2 {
		width: 380px;
		height: 380px;
		background: radial-gradient(circle, rgba(59, 130, 246, 0.45), transparent 70%);
		bottom: 8%;
		right: 12%;
	}

	/* ── Cards (glass) ─────────────────────────────────────────── */
	.card {
		position: relative;
		background: var(--r-card-bg);
		border: 0.5px solid var(--r-card-border);
		border-radius: 1.1rem;
		box-shadow:
			inset 0 1px 0 var(--r-card-hi),
			var(--r-shadow);
		backdrop-filter: blur(14px) saturate(160%);
		-webkit-backdrop-filter: blur(14px) saturate(160%);
		padding: 16px 20px;
		margin-bottom: 14px;
	}

	.card-strong {
		background: var(--r-card-strong-bg);
		border-radius: 1.4rem;
		padding: 22px 24px;
	}

	/* ── Header ───────────────────────────────────────────────── */
	.header-card {
		margin-bottom: 18px;
	}

	.header-top {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
	}

	.kicker {
		text-transform: uppercase;
		letter-spacing: 0.16em;
		font-size: 7.6pt;
		font-weight: 700;
		color: var(--r-accent);
		margin: 0 0 4px 0;
	}

	.name {
		font-size: 26pt;
		font-weight: 800;
		letter-spacing: -0.025em;
		color: var(--r-text);
		margin: 0;
		line-height: 1.05;
	}

	.title-line {
		font-size: 11pt;
		font-weight: 600;
		color: var(--r-muted);
		margin: 6px 0 0 0;
	}

	.summary {
		margin: 14px 0 0 0;
		font-size: 9.8pt;
		line-height: 1.6;
		color: var(--r-muted);
		max-width: 64ch;
	}

	.contact-row {
		display: flex;
		flex-wrap: wrap;
		gap: 7px;
		margin-top: 16px;
	}

	.contact-pill {
		display: inline-flex;
		align-items: center;
		gap: 6px;
		padding: 4px 11px;
		border-radius: 999px;
		font-size: 8.4pt;
		font-weight: 600;
		color: var(--r-text);
		background: var(--r-contact-bg);
		border: 0.5px solid var(--r-contact-border);
		text-decoration: none;
	}

	.contact-pill :global(svg.ci) {
		width: 12px;
		height: 12px;
		color: var(--r-accent);
		flex-shrink: 0;
	}

	/* ── Section heads ────────────────────────────────────────── */
	.block {
		margin-bottom: 18px;
	}

	.section-head {
		display: flex;
		flex-direction: column;
		gap: 2px;
		margin: 0 0 10px 2px;
	}

	.section-title {
		font-size: 13pt;
		font-weight: 800;
		letter-spacing: -0.02em;
		color: var(--r-text);
		margin: 0;
	}

	.rule {
		height: 2px;
		width: 64px;
		margin-top: 6px;
		border-radius: 2px;
		background: linear-gradient(90deg, #60a5fa 0%, #a78bfa 55%, #22d3ee 100%);
	}

	/* ── Jobs ─────────────────────────────────────────────────── */
	.job {
		padding: 16px 20px;
	}

	.job-head {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 10px;
		flex-wrap: wrap;
	}

	.job-left {
		font-size: 10.5pt;
	}

	.job-title {
		font-weight: 800;
		color: var(--r-text);
	}

	.at {
		color: var(--r-soft);
	}

	.company {
		font-weight: 600;
		color: var(--r-muted);
	}

	.date {
		font-size: 8.4pt;
		font-weight: 600;
		color: var(--r-soft);
		white-space: nowrap;
	}

	.job-loc {
		margin: 2px 0 8px 0;
		font-size: 8.4pt;
		color: var(--r-soft);
	}

	.job-list {
		margin: 4px 0 8px 0;
		padding-left: 16px;
		color: var(--r-muted);
		font-size: 9.4pt;
		line-height: 1.5;
	}

	.job-list li {
		margin-bottom: 3px;
	}

	.job-list li::marker {
		color: var(--r-accent);
	}

	/* ── Pills ────────────────────────────────────────────────── */
	.pills {
		display: flex;
		flex-wrap: wrap;
		gap: 5px;
		margin-top: 8px;
	}

	.pills-tight {
		margin-top: 6px;
	}

	.pill {
		display: inline-flex;
		align-items: center;
		padding: 2px 9px;
		border-radius: 999px;
		font-size: 7.8pt;
		font-weight: 600;
		letter-spacing: 0.01em;
		color: var(--r-pill-text);
		background: var(--r-pill-bg);
		border: 0.5px solid var(--r-pill-border);
	}

	.pill-lang {
		color: var(--r-pill-lang-text);
		background: var(--r-pill-lang-bg);
		border-color: var(--r-pill-lang-border);
	}

	/* ── Skills ──────────────────────────────────────────────── */
	.skills-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 14px 24px;
	}

	.skill-group {
		display: flex;
		flex-direction: column;
	}

	.skill-label {
		margin: 0 0 4px 0;
		font-size: 8pt;
		font-weight: 800;
		text-transform: uppercase;
		letter-spacing: 0.1em;
		color: var(--r-text);
	}

	.lang-group {
		grid-column: 1 / -1;
		margin-top: 4px;
		padding-top: 12px;
		border-top: 0.5px solid var(--r-divide);
	}

	/* ── Education ────────────────────────────────────────────── */
	.edu-row {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 12px;
		flex-wrap: wrap;
	}

	.edu-row.divided {
		margin-top: 12px;
		padding-top: 12px;
		border-top: 0.5px solid var(--r-divide);
	}

	.edu-main {
		display: flex;
		flex-direction: column;
		gap: 1px;
	}

	.edu-degree {
		font-weight: 700;
		font-size: 9.8pt;
		color: var(--r-text);
	}

	.edu-school {
		font-size: 8.6pt;
		color: var(--r-soft);
	}

	.edu-gpa {
		font-size: 8.6pt;
		font-weight: 700;
		color: var(--r-accent);
		white-space: nowrap;
	}

	/* ── Projects ────────────────────────────────────────────── */
	.proj {
		padding: 14px 20px;
	}

	.proj-head {
		display: flex;
		justify-content: space-between;
		align-items: baseline;
		gap: 10px;
		flex-wrap: wrap;
	}

	.proj-title {
		font-weight: 800;
		font-size: 10pt;
		color: var(--r-text);
	}

	.proj-link {
		font-size: 8pt;
		font-weight: 600;
		color: var(--r-accent);
		text-decoration: none;
	}

	.proj-desc {
		margin: 5px 0 0 0;
		font-size: 9pt;
		line-height: 1.5;
		color: var(--r-muted);
	}

	/* ── Footer ───────────────────────────────────────────────── */
	.resume-foot {
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		gap: 8px;
		margin-top: 8px;
		font-size: 7.8pt;
		color: var(--r-soft);
	}

	.resume-foot .dot {
		color: var(--r-rule);
	}

	/* ── Print ────────────────────────────────────────────────── */
	@media print {
		.resume-pdf {
			width: 100%;
			border-radius: 0;
		}
		.resume-inner {
			padding: 12mm 14mm 12mm;
		}
		.card {
			break-inside: avoid;
		}
		.job,
		.proj {
			break-inside: avoid;
		}
	}
</style>