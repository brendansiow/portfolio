# Brendan Siow · Senior Software Engineer

Building reliable backend systems and product experiences that hold up in production.

[Golang](https://go.dev/) · [Kubernetes](https://kubernetes.io/) · [OpenSearch](https://opensearch.org/) · [SvelteKit](https://kit.svelte.dev/) · [Flutter](https://flutter.dev/)

---

Senior software engineer at FeedMe, building payments and merchant systems across five markets. Previously worked on MB.OS data services at Mercedes-Benz Malaysia, payment integrations at Revenue Monster, and investment apps at iFAST.

## 🚀 Selected Work

| Project                          | Stack                                          | Context                                         |
| -------------------------------- | ---------------------------------------------- | ----------------------------------------------- |
| MB.OS Data Registry              | Golang, OpenSearch, Kubernetes, Azure EventHub | EU Data Act compliance, metadata governance     |
| Revenue Monster Payment Platform | Golang, Echo, Next.js                          | Payment gateway, Apple Pay, Google Pay          |
| iFAST Global Markets             | Flutter, Spring Boot, Jenkins                  | Regional investment app, CI/CD, mobile delivery |

## 🏆 Recognition

- **Top 6 Finalist** — Vibathon / VHACK 2025 (AI-powered interview analysis)

## 📬 Contact

- [LinkedIn](https://linkedin.com/in/brendan-siow)
- [GitHub](https://github.com/brendansiow)
- [Email](mailto:brendansiowx96@gmail.com)

---

Built with [SvelteKit](https://kit.svelte.dev/), [Tailwind CSS](https://tailwindcss.com/), and deployed on [GitHub Pages](https://pages.github.com/).

## Maintaining the portfolio and local resume

Edit `src/lib/content/portfolio.json` for shared experience, projects, skills,
education, activities, and personal details. `src/lib/types.ts` checks the structure.
The portfolio is public: content included in that JSON and used on the site should
be suitable for public viewing. There is no public resume route or download.

### Website

```sh
npm ci
npm run dev
npm run build
npm run preview
```

`npm run build` creates only the public website in `build/`. It does not generate
or copy resumes. The deployment workflow publishes only `build/`.

### Local resume export

```sh
npx playwright install chromium # once per machine
npm run build:pdf
```

This explicitly starts a separate renderer bound to `127.0.0.1`, generates a light
resume in `private/output/resume.pdf`, and stops the renderer. The renderer lives outside the website's route tree. Outputs are
Git-ignored and never copied to `static/` or `build/`; share files manually with
the people you choose. Use `RESUME_PORT=4322 npm run build:pdf` if port 4321 is busy.

The local resume uses the same JSON, monochrome color tokens, glass surfaces,
monospace headings, Helvetica body text, and company logos as the portfolio.
The content is arranged for A4 rather than copying the scrolling web layout.
`projects[].includeInResume` selects projects independently of `featured`;
`workExperience[].earlyCareer` groups earlier roles. Decoration is flattened to
avoid PDF transparency seams; text stays selectable and links stay clickable.
The export includes every project and currently contains five A4 pages.
Export stops with a page overflow error if
content no longer fits; adjust the page grouping in
`src/lib/components/ResumePDF.svelte` before retrying. Run the private tests after
content changes to check the light resume. No running dev server is required.

### Tests

```sh
npm test                    # build and test the public portfolio, including privacy
npm run test:e2e            # rerun public tests against the last website build
npm run test:report         # public test report
npm run test:resume         # explicitly export and test the local PDF
npm run test:resume:report  # local-only report with rendered resume pages
```

Public tests cover mobile and desktop, both themes, shared content, missing local
assets, browser errors, overflow, theme persistence, and no-JavaScript contact.
They also require old resume URLs and private output paths to return 404, and
verify that the publish directory contains no PDFs or private folders.

Local PDF tests check A4 pagination, extractable content, links, opaque decoration,
and rendered surfaces. A negative test inserts a horizontal band to verify seam
detection. Text, intended edges, and small antialiasing differences are excluded
from surface comparisons; human layout review is still useful.

Public CI runs no resume generation or private PDF tests. Its uploaded reports
contain only public portfolio tests. Resume outputs and reports stay in ignored
local folders under `private/`; `.resume-artifacts/` holds temporary decoration
references. Do not publish those folders or reports.

## Design and navigation

Education is kept in the shared data for the local resume and is not displayed on the public portfolio. Company logos use complete PNG wordmarks without decorative frames.

The public site uses neutral glass surfaces, system monospace headings, and
Helvetica Neue / Helvetica body text (with Arial as a fallback). Brand colors
are limited to company logos. All logo artwork is served locally; origins and
theme variants are recorded in `static/assets/logos/SOURCES.md`.

The floating header links to About, Work, Experience, Skills, Activity,
and Contact. On smaller screens these links move into a native disclosure menu
that works without JavaScript. With JavaScript, it closes after navigation and
supports Escape and active section tracking. Theme preference persists locally,
and the root canvas uses the current theme to avoid white overscroll flashes.

Career dates, projects, skills, and education were reconciled with the supplied
LinkedIn profile export. FeedMe is the current employer; the merchant financing
project is explicitly labelled pre-launch. Edit the shared JSON for future changes.

The short About introduction lives in the hero glass card, before Selected Work.
Edit `personalInfo.aboutSummary` for the card and `heroSummary` for the headline introduction.

GitHub Pages deploys from the public `main` branch. The workflow tests the public
website, then rebuilds with `BASE_PATH=/portfolio` for project hosting. Generated
resume PDFs and private test reports are never committed or uploaded.
