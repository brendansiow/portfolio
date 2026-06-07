<script lang="ts">
	import { cn } from '$lib/utils.js';

	interface Props {
		class?: string;
		children?: import('svelte').Snippet;
	}

	let { class: className, children, ...restProps }: Props = $props();
</script>

<div
	class={cn(
		'rounded-[2rem] border border-white/20 bg-white/15 text-slate-800 shadow-[0_8px_32px_rgba(15,23,42,0.06)] backdrop-blur-2xl dark:border-slate-700/30 dark:bg-slate-900/40 dark:text-slate-100',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</div>
