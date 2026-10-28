// Publish only the explicitly configured PDF; keep the renderer and reports local.
import { readFile, writeFile, rename, rm } from 'node:fs/promises';
import { resolve } from 'node:path';

const content = JSON.parse(await readFile(resolve('src/lib/content/portfolio.json'), 'utf8'));
const filename = content.resume.filename;
const safeFilename = (name) =>
	typeof name === 'string' && /^[a-z0-9][a-z0-9._-]*\.pdf$/i.test(name);
if (!safeFilename(filename)) throw new Error('resume.filename must be a plain PDF filename.');
const bytes = await readFile(resolve('private/output/resume.pdf'));
if (bytes.subarray(0, 5).toString() !== '%PDF-') throw new Error('Resume export is not a PDF.');

const manifest = resolve('private/output/published-resume.json');
let previous;
try {
	previous = JSON.parse(await readFile(manifest, 'utf8')).filename;
} catch (error) {
	if (error.code !== 'ENOENT') throw error;
}
const temporary = resolve('private/output/public-resume.tmp');
await writeFile(temporary, bytes);
await rename(temporary, resolve('static', filename));
if (previous !== filename && safeFilename(previous))
	await rm(resolve('static', previous), { force: true });
await writeFile(manifest, JSON.stringify({ filename }, null, 2));
console.log(`Public resume prepared: static/${filename}`);
