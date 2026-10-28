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

## Maintaining the portfolio and resume

Edit `src/lib/content/portfolio.json` for shared experience, projects, skills,
education, activities, and personal details. `src/lib/types.ts` checks the structure.
The portfolio is public: content included in that JSON and used on the site should
be suitable for public viewing. The hero includes a direct public PDF download;
the HTML resume renderer is not a public route.

### Website

```sh
npm ci
npx playwright install chromium # once per machine
npm run dev
npm run build
npm run preview
```

`npm run build` generates the light resume, prepares its public copy, and builds
the website in `build/`. The deployment workflow publishes that directory,
including the PDF named by `resume.filename` in the shared JSON.

`npm run dev` also prepares the download before starting Vite. Run
`npm run prepare:resume` to refresh it after editing data during a dev session.

### Resume export

```sh
npx playwright install chromium # once per machine
npm run build:pdf
```

This explicitly starts a separate renderer bound to `127.0.0.1`, generates a light
resume in `private/output/resume.pdf`, and stops the renderer. The renderer lives outside the website's route tree. Outputs are
Git-ignored. `npm run build:pdf` only exports this local file.
`npm run prepare:resume` additionally copies it to `static/` using `resume.filename`,
making it available as the public download and including it in subsequent builds.
Generated copies are Git-ignored; CI recreates the public PDF for each deployment. Use `RESUME_PORT=4322 npm run build:pdf` if port 4321 is busy.

The resume uses the same JSON, monochrome color tokens, glass surfaces,
monospace headings, Helvetica body text, and company logos as the portfolio.
The content is arranged for A4 rather than copying the scrolling web layout.
`projects[].includeInResume` selects projects independently of `featured`;
`workExperience[].earlyCareer` groups earlier roles. Decoration is flattened to
avoid PDF transparency seams; text stays selectable and links stay clickable.
The export includes projects with `includeInResume: true` and currently contains four A4 pages, with eight project cards on the final page.
Website-only project additions use `includeInResume: false`.
Export stops with a page overflow error if
content no longer fits; adjust the page grouping in
`src/lib/components/ResumePDF.svelte` before retrying. Run the private tests after
content changes to check the light resume. No running dev server is required.

### Tests

```sh
npm test                    # build the site/PDF and test downloads and private route isolation
npm run test:e2e            # rerun public tests against the last website build
npm run test:report         # public test report
npm run test:resume         # explicitly export and test the local PDF
npm run test:resume:report  # local-only report with rendered resume pages
```

Public tests cover mobile and desktop, both themes, shared content, missing local
assets, browser errors, overflow, theme persistence, and no-JavaScript contact.
They also require old resume URLs and private output paths to return 404, and
verify that only the configured public PDF is present, with no private folders.
The download test checks the PDF response, filename, and actual downloaded bytes.

Local PDF tests check A4 pagination, extractable content, links, opaque decoration,
and rendered surfaces. A negative test inserts a horizontal band to verify seam
detection. Text, intended edges, and small antialiasing differences are excluded
from surface comparisons; human layout review is still useful.

Public CI generates the light PDF for download, then runs public portfolio tests.
The separate PDF visual-test suite remains opt-in. Renderer sources, temporary
decoration, and private test reports are never deployed. The only published
resume file is the generated copy selected by `resume.filename`.

## Design and navigation

Education is kept in the shared data for the resume and is not displayed on the public portfolio. Company logos use complete PNG wordmarks without decorative frames.

The public site uses neutral glass surfaces, Maple Mono headings, and
Helvetica Neue / Helvetica body text (with Arial as a fallback). Color
is reserved for company logos and app screenshots. All logo artwork is served locally; origins and
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
PDFs are never committed. Deployment includes the configured public PDF, while
private renderer files and reports remain excluded.

### UI design and accessibility

The visual rules are documented in [docs/design-system.md](docs/design-system.md).
Public tests include axe accessibility scans in both themes, keyboard-operated
project disclosure, mobile menu dismissal and focus, touch target dimensions,
reduced motion, and portrait/landscape layouts.

### App screenshots

Projects with an `apps` array render as visible app showcases, outside the
More projects disclosure. Each app has a `name`, `storeUrl`, and `screenshots`
array (`src`, `alt`, `width`, `height`). A single project can contain multiple
apps, such as the Bisync Operator and Pasar AI Flutter flavors.

Store previews are local files under `static/assets/projects/`. Source listings
and original image URLs are recorded in `static/assets/projects/SOURCES.json`.
They show the current store presentation, separately from historical contribution
copy. Images keep their original proportions and can be opened full size.
App metadata and screenshot galleries affect only the website. The
resume retains its existing project content and links. The new Bisync / Pasar
entry is website-only (`includeInResume: false`).
