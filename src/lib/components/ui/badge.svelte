<script lang="ts">
	import { cn } from '$lib/utils.js';
	import { tv, type VariantProps } from 'tailwind-variants';

	const badgeVariants = tv({
		base: 'inline-flex items-center rounded-full border px-3 py-1 text-xs font-semibold transition-colors focus:outline-none focus:ring-2 focus:ring-sky-300/70 focus:ring-offset-2',
		variants: {
			variant: {
				default:
					'border-white/30 bg-white/45 text-slate-700 dark:border-slate-700/50 dark:bg-slate-800/50 dark:text-slate-200',
				secondary:
					'border-sky-200/60 bg-sky-100/70 text-sky-800 dark:border-sky-900/40 dark:bg-sky-950/25 dark:text-sky-100',
				destructive:
					'border-rose-200 bg-rose-100 text-rose-700 dark:border-rose-900/40 dark:bg-rose-950/25 dark:text-rose-100',
				outline:
					'border-white/30 bg-transparent text-slate-700 dark:border-slate-700/50 dark:text-slate-200'
			}
		},
		defaultVariants: {
			variant: 'default'
		}
	});

	type Variant = VariantProps<typeof badgeVariants>['variant'];

	interface Props {
		class?: string;
		variant?: Variant;
		children?: import('svelte').Snippet;
	}

	let { class: className, variant = 'default', children, ...restProps }: Props = $props();
</script>

<div class={cn(badgeVariants({ variant }), className)} {...restProps}>
	{@render children?.()}
</div>
