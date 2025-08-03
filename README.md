# Portfolio - Modern Svelte Portfolio App

A beautiful, responsive portfolio website built with SvelteKit, featuring glassmorphism design, smooth animations, and PDF generation capabilities.

![Portfolio Preview](https://github.com/user-attachments/assets/7e1c0f3f-b8b3-402e-967b-28499944342e)

## ✨ Features

- **🎨 Glassmorphism UI Design** - Modern liquid glass aesthetics with backdrop blur effects
- **📱 Fully Responsive** - Works perfectly on desktop, tablet, and mobile devices
- **⚡ Static Site Generation** - Built with SvelteKit and static adapter for GitHub Pages
- **🚀 GitHub Actions Deployment** - Automatic deployment to GitHub Pages on every push to main
- **📄 PDF Resume Generation** - Download portfolio content as PDF with one click
- **🎯 Smooth Animations** - Floating elements, gradient animations, and smooth scrolling
- **♿ Accessible** - Built with accessibility best practices
- **🛠️ Maintainable Content** - Easy-to-update configuration files for portfolio data

## 🏗️ Project Structure

```
src/
├── lib/
│   ├── components/          # Reusable Svelte components
│   │   ├── About.svelte
│   │   ├── Contact.svelte
│   │   ├── DownloadButton.svelte
│   │   ├── Education.svelte
│   │   ├── Experience.svelte
│   │   ├── Footer.svelte
│   │   ├── Hero.svelte
│   │   ├── Navigation.svelte
│   │   ├── Projects.svelte
│   │   └── Skills.svelte
│   ├── data.ts             # Portfolio content configuration
│   └── types.ts            # TypeScript type definitions
├── routes/
│   ├── +layout.svelte      # Global layout
│   ├── +layout.ts          # Layout configuration
│   └── +page.svelte        # Main portfolio page
├── app.css                 # Global styles and animations
└── app.html                # HTML template
```

## 🚀 Quick Start

### Prerequisites

- Node.js 18+ and npm
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone <your-repo-url>
   cd portfolio
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Start development server**
   ```bash
   npm run dev
   ```
   
   Open [http://localhost:5173](http://localhost:5173) to view your portfolio.

4. **Build for production**
   ```bash
   npm run build
   ```

## 📝 Customization

### Updating Portfolio Content

All portfolio content is centralized in `src/lib/data.ts`. Simply update this file to customize:

- Personal information (name, title, bio, contact details)
- Work experience
- Projects (with links to GitHub and live demos)
- Education and certifications
- Skills and technologies

Example:
```typescript
export const portfolioData: PortfolioData = {
  personalInfo: {
    name: "Your Name",
    title: "Your Title",
    email: "your.email@example.com",
    // ... more fields
  },
  // ... other sections
};
```

### Adding Your Photo

1. Place your profile image in the `static/` folder
2. Update the `profileImage` field in `src/lib/data.ts`
3. Add project images to `static/projects/` and update project `imageUrl` fields

### Customizing Colors and Animations

Modify the glassmorphism effects and animations in `src/app.css`:
- `.glass` - Main glassmorphism effect
- `.animated-gradient` - Background gradient animation
- `.floating` - Floating animation for profile image

## 🌐 Deployment

### GitHub Pages (Automatic)

1. **Enable GitHub Pages**
   - Go to your repository settings
   - Navigate to "Pages"
   - Select "GitHub Actions" as the source

2. **Push to main branch**
   ```bash
   git add .
   git commit -m "Deploy portfolio"
   git push origin main
   ```
   
   The GitHub Action will automatically build and deploy your site.

### Manual Deployment

Build the static site and deploy to any static hosting service:

```bash
npm run build
# Deploy the `build` folder to your hosting service
```

## 💡 Key Features Explained

### PDF Generation
- Click the floating download button to generate a PDF resume
- Uses html2pdf.js library to convert the portfolio content
- Automatically optimized for print layout

### Glassmorphism Design
- Backdrop blur effects using CSS `backdrop-filter`
- Semi-transparent overlays with `bg-white/10` opacity
- Smooth hover transitions and animations

### Responsive Navigation
- Sticky navigation with smooth scrolling
- Mobile-friendly hamburger menu
- Active section highlighting

### Performance Optimizations
- Static site generation for fast loading
- Optimized images and assets
- Minimal JavaScript bundle size

## 🛠️ Development

### Available Scripts

- `npm run dev` - Start development server
- `npm run build` - Build for production
- `npm run preview` - Preview production build
- `npm run check` - Run TypeScript checks
- `npm run lint` - Run ESLint
- `npm run format` - Format code with Prettier

### Tech Stack

- **Framework**: SvelteKit with TypeScript
- **Styling**: TailwindCSS with custom animations
- **Deployment**: GitHub Actions + GitHub Pages
- **PDF Generation**: html2pdf.js
- **Icons**: SVG icons (heroicons style)

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the [issues page](../../issues).

## 📧 Support

If you have any questions or need help customizing your portfolio, please open an issue or contact me directly.

---

**Made with ❤️ using SvelteKit and TailwindCSS**
