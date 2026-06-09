<script lang="ts">
	import { portfolioData } from '$lib/data.js';

	const { personalInfo, workExperience, projects, education, skills } = portfolioData;
	const featuredProjects = projects.filter((p) => p.featured);
</script>

<div id="resume-pdf" class="resume-pdf">
	<!-- Header -->
	<header class="pdf-header">
		<div class="pdf-header-inner">
			<div class="pdf-profile">
				<img
					src={personalInfo.profileImage}
					alt={personalInfo.name}
					class="pdf-avatar"
					crossorigin="anonymous"
				/>
				<div class="pdf-name-block">
					<h1 class="pdf-name">{personalInfo.name}</h1>
					<p class="pdf-title">{personalInfo.title}</p>
					<div class="pdf-contact-row">
						<span class="pdf-contact-item">{personalInfo.location}</span>
						<span class="pdf-contact-sep">·</span>
						<span class="pdf-contact-item">{personalInfo.email}</span>
						<span class="pdf-contact-sep">·</span>
						<span class="pdf-contact-item">{personalInfo.phone}</span>
					</div>
					<div class="pdf-links-row">
						<span class="pdf-link">{personalInfo.github}</span>
						<span class="pdf-contact-sep">·</span>
						<span class="pdf-link">{personalInfo.linkedin}</span>
					</div>
				</div>
			</div>
			<p class="pdf-bio">{personalInfo.bio}</p>
		</div>
	</header>

	<!-- Experience -->
	<section class="pdf-section">
		<h2 class="pdf-section-title">Experience</h2>
		{#each workExperience as exp (exp.id)}
			<div class="pdf-card">
				<div class="pdf-card-header">
					{#if exp.companyLogo}
						<img src={exp.companyLogo} alt={exp.company} class="pdf-logo" crossorigin="anonymous" />
					{/if}
					<div class="pdf-card-title-block">
						<h3 class="pdf-card-title">{exp.position}</h3>
						<p class="pdf-card-subtitle">
							{exp.company} · {exp.duration} · {exp.location}
						</p>
					</div>
				</div>
				<ul class="pdf-list">
					{#each exp.description as desc (desc)}
						<li class="pdf-list-item">{desc}</li>
					{/each}
				</ul>
				<div class="pdf-tags">
					{#each exp.technologies as tech (tech)}
						<span class="pdf-tag">{tech}</span>
					{/each}
				</div>
			</div>
		{/each}
	</section>

	<!-- Projects -->
	<section class="pdf-section">
		<h2 class="pdf-section-title">Selected Projects</h2>
		<div class="pdf-projects-grid">
			{#each featuredProjects as project (project.id)}
				<div class="pdf-card pdf-project-card">
					<div class="pdf-card-header">
						{#if project.logoUrl}
							<img src={project.logoUrl} alt={project.title} class="pdf-logo" crossorigin="anonymous" />
						{/if}
						<div class="pdf-card-title-block">
							<h3 class="pdf-card-title">{project.title}</h3>
							{#if project.liveUrl}
								<p class="pdf-link pdf-project-url">{project.liveUrl}</p>
							{/if}
						</div>
					</div>
					<p class="pdf-project-desc">{project.description}</p>
					<div class="pdf-tags">
						{#each project.technologies as tech (tech)}
							<span class="pdf-tag">{tech}</span>
						{/each}
					</div>
				</div>
			{/each}
		</div>
	</section>

	<!-- Education -->
	<section class="pdf-section">
		<h2 class="pdf-section-title">Education</h2>
		{#each education as edu (edu.id)}
			<div class="pdf-card pdf-edu-card">
				<div class="pdf-edu-row">
					<div class="pdf-edu-main">
						<h3 class="pdf-card-title">{edu.degree}</h3>
						<p class="pdf-card-subtitle">{edu.institution} · {edu.location}</p>
					</div>
					<div class="pdf-edu-meta">
						<span class="pdf-edu-duration">{edu.duration}</span>
						{#if edu.gpa}
							<span class="pdf-edu-gpa">{edu.gpa}</span>
						{/if}
					</div>
				</div>
				{#if edu.description}
					<p class="pdf-edu-desc">{edu.description}</p>
				{/if}
			</div>
		{/each}
	</section>

	<!-- Skills -->
	<section class="pdf-section">
		<h2 class="pdf-section-title">Skills & Technologies</h2>
		<div class="pdf-skills-grid">
			{#each skills as skillGroup (skillGroup.category)}
				<div class="pdf-skill-category">
					<h3 class="pdf-skill-cat-title">{skillGroup.category}</h3>
					<div class="pdf-tags">
						{#each skillGroup.skills as skill (skill)}
							<span class="pdf-tag">{skill}</span>
						{/each}
					</div>
				</div>
			{/each}
		</div>
	</section>
</div>

<style>
	.resume-pdf {
		width: 210mm;
		padding: 16mm;
		background: #0b1220;
		color: #e2e8f0;
		font-family: 'Plus Jakarta Sans', 'Segoe UI', sans-serif;
		font-size: 9.5pt;
		line-height: 1.55;
		box-sizing: border-box;
	}

	.pdf-header {
		margin-bottom: 18px;
		padding-bottom: 16px;
		border-bottom: 1px solid rgba(100, 140, 200, 0.2);
	}

	.pdf-header-inner {
		display: flex;
		flex-direction: column;
		gap: 12px;
	}

	.pdf-profile {
		display: flex;
		align-items: center;
		gap: 16px;
	}

	.pdf-avatar {
		width: 56px;
		height: 56px;
		border-radius: 50%;
		object-fit: cover;
		border: 2px solid rgba(100, 140, 200, 0.3);
		background: #1e293b;
	}

	.pdf-name-block {
		flex: 1;
	}

	.pdf-name {
		font-size: 20pt;
		font-weight: 700;
		margin: 0;
		color: #f8fafc;
		letter-spacing: -0.02em;
	}

	.pdf-title {
		font-size: 10.5pt;
		color: #7dd3fc;
		margin: 3px 0 6px 0;
		font-weight: 500;
	}

	.pdf-contact-row {
		display: flex;
		flex-wrap: wrap;
		gap: 4px 10px;
		font-size: 8.5pt;
		color: #94a3b8;
	}

	.pdf-contact-item {
		white-space: nowrap;
	}

	.pdf-contact-sep {
		color: #475569;
	}

	.pdf-links-row {
		display: flex;
		flex-wrap: wrap;
		gap: 4px 10px;
		font-size: 8pt;
		color: #60a5fa;
		margin-top: 2px;
	}

	.pdf-link {
		white-space: nowrap;
		overflow: hidden;
		text-overflow: ellipsis;
		max-width: 200px;
	}

	.pdf-bio {
		font-size: 9pt;
		color: #cbd5e1;
		margin: 0;
		line-height: 1.6;
	}

	.pdf-section {
		margin-bottom: 18px;
	}

	.pdf-section-title {
		font-size: 11pt;
		font-weight: 700;
		color: #f8fafc;
		margin: 0 0 12px 0;
		text-transform: uppercase;
		letter-spacing: 0.12em;
		border-bottom: 1px solid rgba(100, 140, 200, 0.15);
		padding-bottom: 6px;
	}

	.pdf-card {
		background: rgba(15, 23, 42, 0.55);
		border: 0.5px solid rgba(100, 140, 200, 0.12);
		border-radius: 10px;
		padding: 12px 14px;
		margin-bottom: 8px;
	}

	.pdf-card-header {
		display: flex;
		align-items: center;
		gap: 10px;
		margin-bottom: 8px;
	}

	.pdf-logo {
		width: 28px;
		height: 28px;
		border-radius: 6px;
		object-fit: contain;
		background: rgba(255, 255, 255, 0.08);
		padding: 2px;
		flex-shrink: 0;
	}

	.pdf-card-title-block {
		flex: 1;
		min-width: 0;
	}

	.pdf-card-title {
		font-size: 10pt;
		font-weight: 600;
		margin: 0;
		color: #f8fafc;
	}

	.pdf-card-subtitle {
		font-size: 8.5pt;
		color: #94a3b8;
		margin: 2px 0 0 0;
	}

	.pdf-list {
		margin: 0 0 8px 0;
		padding-left: 14px;
	}

	.pdf-list-item {
		font-size: 8.5pt;
		color: #cbd5e1;
		margin-bottom: 3px;
		line-height: 1.45;
	}

	.pdf-tags {
		display: flex;
		flex-wrap: wrap;
		gap: 5px;
	}

	.pdf-tag {
		font-size: 7.5pt;
		padding: 2px 7px;
		border-radius: 5px;
		background: rgba(56, 189, 248, 0.12);
		color: #7dd3fc;
		border: 0.5px solid rgba(56, 189, 248, 0.18);
		white-space: nowrap;
	}

	.pdf-projects-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 8px;
	}

	.pdf-project-card {
		margin-bottom: 0;
	}

	.pdf-project-desc {
		font-size: 8.5pt;
		color: #cbd5e1;
		margin: 0 0 8px 0;
		line-height: 1.45;
	}

	.pdf-project-url {
		margin: 0;
		font-size: 7.5pt;
	}

	.pdf-edu-card {
		margin-bottom: 6px;
		padding: 10px 14px;
	}

	.pdf-edu-row {
		display: flex;
		justify-content: space-between;
		align-items: flex-start;
		gap: 12px;
	}

	.pdf-edu-main {
		flex: 1;
		min-width: 0;
	}

	.pdf-edu-meta {
		text-align: right;
		flex-shrink: 0;
	}

	.pdf-edu-duration {
		display: block;
		font-size: 8pt;
		color: #94a3b8;
		font-weight: 500;
	}

	.pdf-edu-gpa {
		display: block;
		font-size: 8pt;
		color: #7dd3fc;
		margin-top: 2px;
	}

	.pdf-edu-desc {
		font-size: 8.5pt;
		color: #94a3b8;
		margin: 6px 0 0 0;
		line-height: 1.4;
	}

	.pdf-skills-grid {
		display: grid;
		grid-template-columns: 1fr 1fr;
		gap: 8px;
	}

	.pdf-skill-category {
		background: rgba(15, 23, 42, 0.4);
		border: 0.5px solid rgba(100, 140, 200, 0.1);
		border-radius: 8px;
		padding: 10px 12px;
	}

	.pdf-skill-cat-title {
		font-size: 8pt;
		font-weight: 600;
		color: #94a3b8;
		margin: 0 0 6px 0;
		text-transform: uppercase;
		letter-spacing: 0.06em;
	}
</style>
