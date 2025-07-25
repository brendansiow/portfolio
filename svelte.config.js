
import adapter from '@sveltejs/adapter-static';
import preprocess from 'svelte-preprocess';

/** @type {import('@sveltejs/kit').Config} */
const config = {
  kit: {
	adapter: adapter({
	  pages: 'build',
	  assets: 'build',
	  fallback: undefined,
	  precompress: false,
	  strict: true
	}),
	paths: {
	  base: process.env.NODE_ENV === 'production' ? '/portfolio' : '',
	  relative: false
	}
  },
  preprocess: preprocess()
};

export default config;