<script lang="ts">
	import type { PersonalInfo } from '$lib/types';
	import {
		Mail,
		Phone,
		MapPin,
		CheckCircle,
		Building,
		Code,
		Heart,
		ArrowUpRight
	} from 'lucide-svelte';
	import Card from '$lib/components/ui/card.svelte';
	import CardContent from '$lib/components/ui/card-content.svelte';

	interface Props {
		data: PersonalInfo;
	}

	let { data }: Props = $props();

	const stats = [
		{ value: '8+', label: 'Years shipping', icon: CheckCircle },
		{ value: '3', label: 'Product environments', icon: Building },
		{ value: '20+', label: 'Technologies', icon: Code },
		{ value: '32', label: 'GitHub repos', icon: Heart }
	];
</script>

<div class="section-shell">
	<div class="mb-10 text-center">
		<p class="section-kicker">About</p>
		<h2 class="section-title mt-2 text-slate-900 dark:text-slate-100">
			Backend-first, product-aware, delivery-minded
		</h2>
	</div>

	<div class="grid gap-4 md:grid-cols-3">
		<!-- Large bio card -->
		<Card class="glass-strong col-span-1 row-span-2 rounded-[2rem] border-white/30 md:col-span-2">
			<CardContent class="flex h-full flex-col justify-between p-7 pt-7">
				<div>
					<h3
						class="text-xl font-semibold tracking-tight text-slate-900 dark:text-slate-100 md:text-2xl"
					>
						Who I Am
					</h3>
					<p class="mt-4 text-sm leading-7 text-slate-600 dark:text-slate-300 md:text-base">
						{data.bio}
					</p>
				</div>

				<div class="mt-6 grid gap-3 sm:grid-cols-2">
					<a
						href={`mailto:${data.email}`}
						class="glass flex items-center gap-3 rounded-2xl px-4 py-3 text-sm text-slate-700 transition hover:bg-white/60 dark:text-slate-200"
					>
						<Mail class="h-4 w-4" />
						{data.email}
					</a>
					<a
						href={`tel:${data.phone}`}
						class="glass flex items-center gap-3 rounded-2xl px-4 py-3 text-sm text-slate-700 transition hover:bg-white/60 dark:text-slate-200"
					>
						<Phone class="h-4 w-4" />
						{data.phone}
					</a>
					<div
						class="glass flex items-center gap-3 rounded-2xl px-4 py-3 text-sm text-slate-700 dark:text-slate-200 sm:col-span-2"
					>
						<MapPin class="h-4 w-4" />
						{data.location}
					</div>
				</div>
			</CardContent>
		</Card>

		<!-- Stat cards in a mini bento -->
		<div class="col-span-1 grid grid-cols-2 gap-3 md:grid-cols-1 md:grid-rows-2">
			{#each stats as stat (stat.label)}
				<Card class="glass flex items-center rounded-[1.5rem] border-white/30">
					<CardContent class="flex w-full items-center justify-between p-5 pt-5">
						<div>
							<p class="text-2xl font-bold text-slate-900 dark:text-slate-100">{stat.value}</p>
							<p class="mt-1 text-xs text-slate-600 dark:text-slate-300">{stat.label}</p>
						</div>
						<div
							class="rounded-xl bg-white/50 p-2 text-slate-700 dark:bg-slate-800/60 dark:text-slate-100"
						>
							<stat.icon class="h-4 w-4" />
						</div>
					</CardContent>
				</Card>
			{/each}
		</div>
	</div>
</div>
