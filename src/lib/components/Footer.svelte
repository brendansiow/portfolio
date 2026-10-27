<script lang="ts">
	import { portfolioData } from '$lib/data';
	const { personalInfo } = portfolioData;
</script>

<footer class="shell">
	<span class="copyright"
		>© {new Date().getFullYear()} {personalInfo.name}.<br />{personalInfo.shortLocation}</span
	>
	<div>
		<a href={personalInfo.github} target="_blank" rel="noopener noreferrer">GitHub ↗</a><a
			href={personalInfo.linkedin}
			target="_blank"
			rel="noopener noreferrer">LinkedIn ↗</a
		><a href="#top">Back to top ↑</a>
	</div>
</footer>
