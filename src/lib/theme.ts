import { browser } from '$app/environment';
import { writable } from 'svelte/store';

type Theme = 'light' | 'dark';

const defaultTheme: Theme = 'light';

function createThemeStore() {
	const { subscribe, set, update } = writable<Theme>(defaultTheme);

	return {
		subscribe,
		set: (theme: Theme) => {
			if (browser) {
				if (theme === 'dark') {
					document.documentElement.classList.add('dark');
				} else {
					document.documentElement.classList.remove('dark');
				}
				localStorage.setItem('theme', theme);
			}
			set(theme);
		},
		toggle: () => {
			update(theme => {
				const newTheme = theme === 'light' ? 'dark' : 'light';
				if (browser) {
					if (newTheme === 'dark') {
						document.documentElement.classList.add('dark');
					} else {
						document.documentElement.classList.remove('dark');
					}
					localStorage.setItem('theme', newTheme);
				}
				return newTheme;
			});
		},
		init: () => {
			if (browser) {
				const stored = localStorage.getItem('theme') as Theme | null;
				const prefersDark = window.matchMedia('(prefers-color-scheme: dark)').matches;
				const initialTheme = stored || (prefersDark ? 'dark' : 'light');
				
				if (initialTheme === 'dark') {
					document.documentElement.classList.add('dark');
				} else {
					document.documentElement.classList.remove('dark');
				}
				
				set(initialTheme);
			}
		}
	};
}

export const theme = createThemeStore();