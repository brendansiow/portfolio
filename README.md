# SvelteKit Portfolio

A beautiful and responsive portfolio website built with SvelteKit and static site generation. This portfolio showcases professional experience, projects, and skills in a modern, clean design with liquid glass effects.

## ✨ Features

- **Static Site Generation**: Ultra-fast loading with SvelteKit's SSG capabilities
- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Liquid Glass Effects**: Modern glassmorphism design with backdrop blur effects
- **Dark/Light Theme**: Toggle between themes with localStorage persistence
- **Smooth Animations**: CSS animations and scroll-based interactions
- **Six Main Sections**:
  - **About**: Hero section with personal introduction and call-to-action buttons
  - **Experience**: Professional timeline with detailed achievements and glass cards
  - **Projects**: Featured projects showcase with technology tags and live demo links
  - **Education & Certifications**: Academic background and professional certifications
  - **Skills & Languages**: Technical expertise with animated progress bars
  - **Contact**: Contact form with social media links and glass effects
- **Smooth Navigation**: Animated scroll-to-section navigation with mobile menu
- **Auto-deployment**: GitHub Actions workflow for automatic deployment to GitHub Pages

## 🚀 Tech Stack

- **Framework**: SvelteKit with Static Site Generation
- **Styling**: TailwindCSS with custom glass morphism effects
- **Icons**: Lucide Svelte
- **Animation**: CSS animations and transitions
- **Build Tool**: Vite
- **Deployment**: GitHub Pages with GitHub Actions

## 🎨 Design Features

- **Glassmorphism**: Modern glass effects with backdrop blur and transparency
- **Gradient Text**: Beautiful gradient text effects for headings
- **Floating Elements**: Subtle floating animations throughout the design
- **Interactive Cards**: Hover effects and smooth transitions on all interactive elements
- **Responsive Grid**: Flexible layouts that adapt to all screen sizes
- **Professional Typography**: Clean, readable fonts with proper hierarchy

## 🛠️ Getting Started

### Prerequisites

- Node.js (version 18 or higher)
- npm or yarn package manager

### Installation

1. Clone the repository:
```bash
git clone https://github.com/brendansiow/portfolio.git
cd portfolio
```

2. Install dependencies:
```bash
npm install
```

3. Start the development server:
```bash
npm run dev
```

4. Open your browser and navigate to `http://localhost:5173`

### Build for Production

To build the application for production:

```bash
npm run build
```

The built files will be available in the `build` directory, ready for deployment.

## 📦 Deployment

### GitHub Pages (Automatic)

This repository is configured for automatic deployment to GitHub Pages using GitHub Actions.

Every push to the `main` branch will automatically:
1. Build the SvelteKit application with static site generation
2. Deploy it to GitHub Pages
3. Create a GitHub release with the deployment URL
4. Make it available at `https://brendansiow.github.io/portfolio/`

### Manual Deployment Options

#### Netlify
1. Connect your repository to Netlify
2. Set build command: `npm run build`
3. Set publish directory: `build`

#### Vercel
1. Connect your repository to Vercel
2. Vercel will automatically detect SvelteKit and configure the build

#### Other Static Hosting
1. Run `npm run build`
2. Upload the contents of the `build` directory to your hosting provider

## 🎯 Customization

### Personalizing Content

Update the following components with your information:

1. **About Section** (`src/lib/components/About.svelte`):
   - Name, title, and personal description
   - Profile image placeholder
   - CV download link

2. **Experience Section** (`src/lib/components/Experience.svelte`):
   - Work experience details
   - Company names, positions, and dates
   - Achievements and responsibilities

3. **Projects Section** (`src/lib/components/Projects.svelte`):
   - Project names, descriptions, and technologies
   - Live demo and GitHub repository links
   - Project images and gradients

4. **Education Section** (`src/lib/components/Education.svelte`):
   - Educational background and degrees
   - Professional certifications
   - Institution names and dates

5. **Skills Section** (`src/lib/components/Skills.svelte`):
   - Technical skills and proficiency levels
   - Programming languages and tools
   - Language proficiencies

6. **Contact Section** (`src/lib/components/Contact.svelte`):
   - Contact information (email, phone, location)
   - Social media links
   - Contact form integration

### Styling Customization

- **Colors**: Update the color palette in `tailwind.config.js`
- **Fonts**: Modify font imports in `src/app.css`
- **Glass Effects**: Customize glass morphism styles in `src/app.css`
- **Animations**: Adjust animation timings and effects in component files

## 📁 Project Structure

```
src/
├── lib/
│   └── components/
│       ├── About.svelte          # Hero/About section
│       ├── Contact.svelte        # Contact form and footer
│       ├── Education.svelte      # Education and certifications
│       ├── Experience.svelte     # Work experience timeline
│       ├── Navigation.svelte     # Navigation bar with mobile menu
│       ├── Projects.svelte       # Projects showcase
│       └── Skills.svelte         # Skills and languages
├── routes/
│   ├── +layout.svelte           # Main layout with theme system
│   ├── +layout.js               # Layout configuration
│   └── +page.svelte             # Main page component
├── app.css                      # Global styles and glass effects
├── app.d.ts                     # TypeScript declarations
└── app.html                     # HTML template
```

## 🔧 Configuration Files

- `svelte.config.js`: SvelteKit configuration with static adapter
- `tailwind.config.js`: TailwindCSS configuration with custom theme
- `vite.config.js`: Vite build tool configuration
- `package.json`: Project dependencies and scripts

## 🌟 Key Improvements over Flutter Version

- **Performance**: Static site generation provides instant loading
- **SEO**: Better search engine optimization with pre-rendered HTML
- **Accessibility**: Improved accessibility with semantic HTML
- **Bundle Size**: Significantly smaller bundle size compared to Flutter web
- **Development Experience**: Hot module replacement for faster development
- **Modern CSS**: Utilizes modern CSS features like backdrop-filter for glass effects

## 📱 Browser Support

- Chrome/Chromium 88+
- Firefox 94+
- Safari 15.4+
- Edge 88+

Note: Glass morphism effects require modern browsers with backdrop-filter support.

## 🤝 Contributing

Feel free to fork this project and customize it for your own portfolio. If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 📧 Contact

- **Email**: john.doe@email.com
- **LinkedIn**: [linkedin.com/in/johndoe](https://linkedin.com/in/johndoe)
- **GitHub**: [github.com/johndoe](https://github.com/johndoe)

---

**Built with ❤️ using SvelteKit, TailwindCSS, and modern web technologies.**