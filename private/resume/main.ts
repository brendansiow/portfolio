import { mount } from 'svelte';
import '../../src/app.css';
import { theme } from '../../src/lib/theme';
import ResumePDF from '../../src/lib/components/ResumePDF.svelte';

theme.init();
mount(ResumePDF, { target: document.getElementById('app')! });
