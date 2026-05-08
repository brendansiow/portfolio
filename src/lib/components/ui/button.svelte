<script lang="ts">
	import { cn } from '$lib/utils.js';
	import { tv, type VariantProps } from 'tailwind-variants';

	const buttonVariants = tv({
		base: 'inline-flex items-center justify-center whitespace-nowrap rounded-full text-sm font-semibold transition-all duration-200 focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-sky-300/70 focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
		variants: {
			variant: {
				default:
					'bg-slate-900 text-white shadow-[0_8px_24px_rgba(15,23,42,0.18)] hover:-translate-y-0.5 hover:bg-slate-800 dark:bg-slate-100 dark:text-slate-900 dark:hover:bg-white',
				destructive: 'bg-rose-600 text-white hover:bg-rose-500',
				outline:
					'border border-white/25 bg-white/30 text-slate-800 backdrop-blur-md hover:bg-white/50 dark:border-slate-600/40 dark:bg-slate-900/35 dark:text-slate-100 dark:hover:bg-slate-800/55',
				secondary:
					'bg-sky-100 text-sky-900 hover:bg-sky-200 dark:bg-slate-700 dark:text-slate-100 dark:hover:bg-slate-600',
				ghost:
					'bg-transparent text-slate-700 hover:bg-white/35 dark:text-slate-200 dark:hover:bg-slate-800/35',
				link: 'text-slate-800 underline-offset-4 hover:underline dark:text-slate-100'
			},
			size: {
				default: 'h-10 px-5 py-2',
				sm: 'h-9 rounded-full px-4',
				lg: 'h-11 rounded-full px-7',
				icon: 'h-10 w-10'
			}
		},
		defaultVariants: {
			variant: 'default',
			size: 'default'
		}
	});

	type Variant = VariantProps<typeof buttonVariants>['variant'];
	type Size = VariantProps<typeof buttonVariants>['size'];

	interface Props {
		class?: string;
		variant?: Variant;
		size?: Size;
		href?: string;
		type?: 'button' | 'submit' | 'reset';
		disabled?: boolean;
		onclick?: (event: MouseEvent) => void;
		children?: import('svelte').Snippet;
		[key: string]: any;
	}

	let {
		class: className,
		variant = 'default',
		size = 'default',
		href,
		type = 'button',
		disabled = false,
		onclick,
		children,
		...restProps
	}: Props = $props();
</script>

{#if href}
	<a {href} class={cn(buttonVariants({ variant, size, className }))} {...restProps}>
		{@render children?.()}
	</a>
{:else}
	<button
		class={cn(buttonVariants({ variant, size, className }))}
		{type}
		{onclick}
		{disabled}
		{...restProps}
	>
		{@render children?.()}
	</button>
{/if}
