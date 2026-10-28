# Portfolio design system

This refines the existing portfolio using guidance from
[UI UX Pro Max](https://github.com/nextlevelbuilder/ui-ux-pro-max-skill).
The owner's visual preferences take precedence over generated presets.

## Visual direction

- Keep a neutral black-and-white palette, with color reserved for company logos.
- Use bundled Maple Mono for display headings and technical tags. Use Helvetica
  for project titles and body text, with medium-weight titles to establish hierarchy.
- Header branding pairs the name with a circular grayscale initials avatar.
  Both come from the shared JSON (`name` and `initials`). Keep the full name visible on mobile,
  wrapping it on very narrow screens. No photo or boxed logo tile is needed.
- Use glass for the floating navigation, identity card, featured work and contact.
  Keep the career history and toolkit plain for easier reading.
- Hero graphic: a gently tilted profile card, a circular BS monogram, and a
  subtle second glass pane. Integrate the current role as a link to Experience.
  No decorative sphere, floating badges, fake controls, or continuous motion.
- Use the tokens in `src/app.css` for all themes and the private PDF renderer.
  Avoid adding another set of colors or component overrides at the end of the stylesheet.

## Layout and text

- Maximum reading container: 1200px, with 20px mobile and 48px desktop gutters.
- Main body text: 16px minimum; 1.6–1.7 line height.
- Labels and technical pills: 11–12px; use them only for useful context.
- Sections: 72px mobile / 96px desktop vertical spacing.
- Featured work: three equal cards on desktop; one column below 900px.
- Other projects: native expandable disclosure with a visible project count.
  Every project remains in the HTML and can be opened without JavaScript.
- All content comes from `src/lib/content/portfolio.json`. Resume inclusion is
  separate from website prominence; the private light resume includes all projects.

## Interaction and accessibility

- Navigation, theme and primary actions have 44px or larger hit areas.
- Keep visible keyboard focus and adequate offsets for the floating header.
- Mobile navigation supports native keyboard interaction, Escape, outside click,
  and focus transfer to the selected section.
- Use native controls for disclosures. Do not make static cards look clickable.
- External project links have descriptive accessible names.
- Apply saved theme before first paint. Respect reduced motion.
- Body and secondary text should meet 4.5:1 contrast in both themes. Glass needs
  review against its composed background; automated scans cannot prove every case.

## Verification

`npm test` covers mobile/desktop layouts, themes, keyboard interactions, text
content, company assets, privacy and automated accessibility checks.
`npm run test:resume` validates the private light PDF separately.
`BASE_PATH=/portfolio node scripts/check-pages.mjs` checks a Pages-path build.
