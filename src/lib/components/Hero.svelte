<script lang="ts">
	import type { PersonalInfo } from '$lib/types';
	import {
		MapPin,
		Github,
		Linkedin,
		Mail,
		ArrowDownRight,
		Code,
		Building2,
		Globe
	} from 'lucide-svelte';
	import Button from '$lib/components/ui/button.svelte';

	interface Props {
		data: PersonalInfo;
	}

	let { data }: Props = $props();
</script>

<div class="section-shell">
	<div class="grid auto-rows-[minmax(140px,auto)] gap-4 md:grid-cols-4">
		<!-- Main card: headline, bio, CTA -->
		<div
			class="glass-strong col-span-1 row-span-2 flex flex-col justify-between rounded-[2rem] p-6 md:col-span-2 md:p-8"
		>
			<div>
				<p class="section-kicker mb-4">Senior software engineer</p>
				<h1
					class="max-w-2xl text-3xl font-extrabold tracking-tight text-slate-900 dark:text-slate-100 md:text-5xl"
				>
					Building reliable backend systems and product experiences that hold up in production.
				</h1>
				<p class="mt-5 text-base font-medium text-slate-700 dark:text-slate-200 md:text-lg">
					{data.name} · {data.title}
				</p>
				<p class="mt-4 max-w-xl text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base">
					{data.bio}
				</p>
			</div>

			<div class="mt-6 flex flex-wrap gap-3">
				<Button
					size="lg"
					onclick={(e) => {
						e.preventDefault();
						document.querySelector('#projects')?.scrollIntoView({ behavior: 'smooth' });
					}}
				>
					{#snippet children()}
						View selected work
						<ArrowDownRight class="ml-2 h-4 w-4" />
					{/snippet}
				</Button>
				<Button
					variant="outline"
					size="lg"
					onclick={(e) => {
						e.preventDefault();
						document.querySelector('#contact')?.scrollIntoView({ behavior: 'smooth' });
					}}
				>
					{#snippet children()}Get in touch{/snippet}
				</Button>
			</div>
		</div>

		<!-- Profile card -->
		<div
			class="glass col-span-1 row-span-2 flex flex-col items-center justify-center rounded-[2rem] p-6"
		>
			<div
				class="mb-4 flex h-24 w-24 items-center justify-center overflow-hidden rounded-full border border-white/40 bg-slate-900 text-2xl font-bold text-white dark:bg-slate-200 dark:text-slate-900"
			>
				{#if data.profileImage}
					<img src={data.profileImage} alt={data.name} class="h-full w-full object-cover" />
				{:else}
					{data.name
						.split(' ')
						.map((n) => n[0])
						.join('')}
				{/if}
			</div>
			<h3 class="text-center text-base font-semibold text-slate-900 dark:text-slate-100">
				Focused on engineering that ships
			</h3>
			<p class="mt-2 text-center text-sm leading-6 text-slate-600 dark:text-slate-300">
				Backend-first, comfortable across adjacent frontend and mobile work.
			</p>
			<div class="mt-5 flex gap-3">
				<a
					href={data.github}
					target="_blank"
					rel="noopener noreferrer"
					class="rounded-full bg-white/40 p-2 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-100"
					aria-label="GitHub Profile"
				>
					<Github class="h-4 w-4" />
				</a>
				<a
					href={data.linkedin}
					target="_blank"
					rel="noopener noreferrer"
					class="rounded-full bg-white/40 p-2 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-100"
					aria-label="LinkedIn Profile"
				>
					<Linkedin class="h-4 w-4" />
				</a>
				<a
					href={`mailto:${data.email}`}
					class="rounded-full bg-white/40 p-2 text-slate-700 transition hover:bg-white/60 dark:bg-slate-800/60 dark:text-slate-100"
					aria-label="Send Email"
				>
					<Mail class="h-4 w-4" />
				</a>
			</div>
		</div>

		<!-- Focus card -->
		<div class="glass flex flex-col justify-center rounded-[2rem] p-5">
			<div
				class="mb-3 flex h-10 w-10 items-center justify-center rounded-full bg-white/50 dark:bg-slate-800/60"
			>
				<Code class="h-5 w-5 text-slate-700 dark:text-slate-200" />
			</div>
			<h4 class="text-sm font-semibold text-slate-900 dark:text-slate-100">Focus</h4>
			<div class="mt-3 flex flex-wrap gap-2">
				<span
					class="rounded-full border border-white/30 bg-white/40 px-3 py-1 text-xs font-medium text-slate-700 dark:border-slate-700/40 dark:bg-slate-800/50 dark:text-slate-200"
					>Golang</span
				>
				<span
					class="rounded-full border border-white/30 bg-white/40 px-3 py-1 text-xs font-medium text-slate-700 dark:border-slate-700/40 dark:bg-slate-800/50 dark:text-slate-200"
					>APIs</span
				>
				<span
					class="rounded-full border border-white/30 bg-white/40 px-3 py-1 text-xs font-medium text-slate-700 dark:border-slate-700/40 dark:bg-slate-800/50 dark:text-slate-200"
					>Platform</span
				>
			</div>
		</div>

		<!-- Location card -->
		<div class="glass flex flex-col justify-center rounded-[2rem] p-5">
			<div
				class="mb-3 flex h-10 w-10 items-center justify-center rounded-full bg-white/50 dark:bg-slate-800/60"
			>
				<MapPin class="h-5 w-5 text-slate-700 dark:text-slate-200" />
			</div>
			<h4 class="text-sm font-semibold text-slate-900 dark:text-slate-100">Location</h4>
			<p class="mt-1 text-sm text-slate-600 dark:text-slate-300">{data.location}</p>
			<div class="mt-3 flex items-center gap-2">
				<span class="inline-block h-2 w-2 rounded-full bg-emerald-500"></span>
				<span class="text-xs font-medium text-slate-600 dark:text-slate-300"
					>Open to opportunities</span
				>
			</div>
		</div>
	</div>
</div>
