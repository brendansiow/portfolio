<script lang="ts">
	import type { PersonalInfo } from '$lib/types';
	import { Mail, Phone, MapPin, Github, Linkedin, ArrowUpRight } from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';
	import Button from '$lib/components/ui/button.svelte';

	interface Props {
		data: PersonalInfo;
	}

	let { data }: Props = $props();
</script>

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">Contact</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">
			Open to strong product and engineering work
		</h2>
		<p
			class="mx-auto mt-4 max-w-2xl text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base"
		>
			If you are hiring, building something ambitious, or looking for an engineer who can move
			across backend, product, and delivery, feel free to reach out.
		</p>
	</div>

	<div class="grid gap-4 md:grid-cols-2">
		<Card class="glass rounded-[1.75rem] border-white/30">
			<CardContent class="p-6 pt-6">
				<h3 class="text-lg font-semibold text-slate-900 dark:text-slate-100">Reach me directly</h3>
				<div class="mt-5 space-y-3">
					<a
						href={`mailto:${data.email}`}
						class="flex items-center gap-3 rounded-2xl bg-white/35 px-4 py-3 text-sm text-slate-700 transition hover:bg-white/55 dark:bg-slate-800/45 dark:text-slate-200 dark:hover:bg-slate-800/65"
					>
						<Mail class="h-4 w-4" />
						{data.email}
					</a>
					<a
						href={`tel:${data.phone}`}
						class="flex items-center gap-3 rounded-2xl bg-white/35 px-4 py-3 text-sm text-slate-700 transition hover:bg-white/55 dark:bg-slate-800/45 dark:text-slate-200 dark:hover:bg-slate-800/65"
					>
						<Phone class="h-4 w-4" />
						{data.phone}
					</a>
					<div
						class="flex items-center gap-3 rounded-2xl bg-white/35 px-4 py-3 text-sm text-slate-700 dark:bg-slate-800/45 dark:text-slate-200"
					>
						<MapPin class="h-4 w-4" />
						{data.location}
					</div>
				</div>

				<div class="mt-6 flex gap-3">
					<a
						href={data.github}
						target="_blank"
						rel="noopener noreferrer"
						class="rounded-full bg-white/40 p-2.5 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-200"
						aria-label="GitHub"
					>
						<Github class="h-4 w-4" />
					</a>
					<a
						href={data.linkedin}
						target="_blank"
						rel="noopener noreferrer"
						class="rounded-full bg-white/40 p-2.5 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-200"
						aria-label="LinkedIn"
					>
						<Linkedin class="h-4 w-4" />
					</a>
				</div>
			</CardContent>
		</Card>

		<Card class="glass rounded-[1.75rem] border-white/30">
			<CardContent class="p-6 pt-6">
				<p
					class="text-xs font-medium uppercase tracking-[0.2em] text-slate-500 dark:text-slate-400"
				>
					Best fit
				</p>
				<h3 class="mt-3 text-xl font-semibold text-slate-900 dark:text-slate-100">
					Backend engineering, platform work, and product delivery
				</h3>
				<p class="mt-4 text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base">
					I am most valuable where reliable systems, practical decision-making, and product-minded
					execution matter. That includes backend-heavy roles, platform teams, fintech and payment
					products, and cross-functional engineering work.
				</p>

				<div class="mt-5 space-y-2.5 text-sm leading-7 text-slate-600 dark:text-slate-300">
					<div class="rounded-2xl bg-white/30 px-4 py-2.5 dark:bg-slate-800/40">
						Strong with Golang services, APIs, and production-facing backend work.
					</div>
					<div class="rounded-2xl bg-white/30 px-4 py-2.5 dark:bg-slate-800/40">
						Comfortable bridging backend, frontend, mobile, and release workflows.
					</div>
					<div class="rounded-2xl bg-white/30 px-4 py-2.5 dark:bg-slate-800/40">
						Interested in teams that care about quality, ownership, and useful software.
					</div>
				</div>

				<div class="mt-6 flex flex-wrap gap-3">
					<Button href={`mailto:${data.email}?subject=Opportunity%20for%20Brendan%20Siow`}>
						{#snippet children()}
							Email Brendan
							<ArrowUpRight class="ml-2 h-4 w-4" />
						{/snippet}
					</Button>
					<Button variant="outline" href={data.linkedin} target="_blank" rel="noopener noreferrer">
						{#snippet children()}View LinkedIn{/snippet}
					</Button>
				</div>
			</CardContent>
		</Card>
	</div>
</div>
