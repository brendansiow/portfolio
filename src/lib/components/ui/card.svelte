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
		'rounded-[2rem] text-slate-800 dark:text-slate-100',
		className
	)}
	{...restProps}
>
	{@render children?.()}
</div>
