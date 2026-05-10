<script lang="ts">
	import { ExternalLink, Trophy, Users, Brain, Calendar } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';
	import Badge from '$lib/components/ui/badge.svelte';
	import Button from '$lib/components/ui/button.svelte';
</script>

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">Community</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">Activity & Events</h2>
		<p class="mx-auto mt-4 max-w-2xl text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base">
			Hackathons, community events, and side-project highlights.
		</p>
	</div>

	<div class="grid gap-4 md:grid-cols-3">
		<!-- Main hackathon card -->
		<Card class="glass-strong h-full overflow-hidden rounded-[1.75rem] border-white/30 md:col-span-2">
			<CardContent class="flex h-full flex-col p-0">
				<div class="border-b border-white/25 p-5 dark:border-slate-700/40 md:p-6">
					<div class="flex items-start justify-between gap-4">
						<div>
							<div class="mb-2 flex items-center gap-2">
								<Badge variant="secondary">Hackathon</Badge>
								<Badge variant="outline">Top 6 Finalists</Badge>
							</div>
							<h3 class="text-xl font-semibold tracking-tight text-slate-900 dark:text-slate-100 md:text-2xl">
								Vibathon / VHACK 2025
							</h3>
						</div>
						<div class="rounded-2xl border border-white/40 bg-white/35 p-2.5 text-slate-700 shadow-[0_8px_24px_rgba(15,23,42,0.06)] backdrop-blur dark:border-slate-700/50 dark:bg-slate-900/45 dark:text-slate-100">
							<Trophy class="h-4 w-4" />
						</div>
					</div>
					<p class="mt-3 text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base">
						Participated in the Vibathon / VHACK 2025 hackathon, building an AI-powered interview analysis application
						that helps candidates practice and receive feedback on their interview performance. The project leveraged
						natural language processing to analyse responses and provide actionable insights.
					</p>
				</div>

				<div class="flex flex-1 flex-col gap-4 p-5 md:p-6">
					<div class="rounded-[1.5rem] border border-white/30 bg-white/40 p-4 dark:border-slate-700/45 dark:bg-slate-900/40">
						<div class="flex items-center gap-3">
							<div class="flex h-9 w-9 items-center justify-center rounded-2xl border border-white/40 bg-white/75 dark:border-slate-700/50 dark:bg-slate-950/60">
								<Brain class="h-4 w-4 text-slate-700 dark:text-slate-200" />
							</div>
							<div>
								<p class="text-xs font-medium text-slate-500 dark:text-slate-400">Project context</p>
								<p class="mt-0.5 text-xs text-slate-700 dark:text-slate-200">
									AI interview coaching tool with real-time feedback
								</p>
							</div>
						</div>
						<p class="mt-3 text-xs font-medium text-slate-500 dark:text-slate-400">Key highlights</p>
						<div class="mt-2 flex flex-wrap gap-2">
							<Badge variant="outline">AI / NLP</Badge>
							<Badge variant="outline">Interview Analysis</Badge>
							<Badge variant="outline">Top 6 Finalists</Badge>
							<Badge variant="outline">Team Collaboration</Badge>
						</div>
					</div>

					<div class="mt-auto">
						<Button href="https://www.linkedin.com/posts/brendan-siow_vibathon-vibathon-vhack-ugcPost-7373208270867456000-REQn" target="_blank" rel="noopener noreferrer">
							{#snippet children()}
								View LinkedIn post
								<ExternalLink class="ml-2 h-4 w-4" />
							{/snippet}
						</Button>
					</div>
				</div>
			</CardContent>
		</Card>

		<!-- Side info cards -->
		<div class="flex flex-col gap-4">
			<Card class="glass rounded-[1.75rem] border-white/30">
				<CardContent class="flex items-center gap-4 p-5 pt-5">
					<div class="rounded-xl bg-white/45 p-2.5 text-slate-700 dark:bg-slate-800/60 dark:text-slate-100">
						<Users class="h-5 w-5" />
					</div>
					<div>
						<p class="text-xs font-medium text-slate-500 dark:text-slate-400">Team size</p>
						<p class="text-sm font-semibold text-slate-900 dark:text-slate-100">Collaborative team effort</p>
					</div>
				</CardContent>
			</Card>

			<Card class="glass rounded-[1.75rem] border-white/30">
				<CardContent class="flex items-center gap-4 p-5 pt-5">
					<div class="rounded-xl bg-white/45 p-2.5 text-slate-700 dark:bg-slate-800/60 dark:text-slate-100">
						<Calendar class="h-5 w-5" />
					</div>
					<div>
						<p class="text-xs font-medium text-slate-500 dark:text-slate-400">Event</p>
						<p class="text-sm font-semibold text-slate-900 dark:text-slate-100">Vibathon / VHACK 2025</p>
					</div>
				</CardContent>
			</Card>

			<Card class="glass flex-1 rounded-[1.75rem] border-white/30">
				<CardContent class="flex h-full flex-col justify-center p-5 pt-5">
					<div class="mb-3 flex items-center gap-2">
						<Trophy class="h-5 w-5 text-amber-500" />
						<h4 class="text-sm font-semibold text-slate-900 dark:text-slate-100">Achievement</h4>
					</div>
					<p class="text-sm leading-7 text-slate-600 dark:text-slate-300">
						Selected as <strong>Top 6 Finalists</strong> among competing teams, recognising the project's innovation and technical execution.
					</p>
				</CardContent>
			</Card>
		</div>
	</div>
</div>
