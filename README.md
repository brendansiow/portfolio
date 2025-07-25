# Flutter Web Portfolio

A beautiful and responsive portfolio website built with Flutter web. This portfolio showcases professional experience, projects, and skills in a modern, clean design.

## Features

- **Responsive Design**: Works seamlessly on desktop, tablet, and mobile devices
- **Modern UI**: Clean, professional design with smooth animations
- **Three Main Sections**:
  - **About**: Hero section with personal introduction and call-to-action buttons
  - **Working Experience**: Professional timeline with detailed achievements
  - **Projects**: Featured projects showcase with technology tags and links
- **Contact Form**: Integrated contact form with social media links
- **Smooth Navigation**: Animated scroll-to-section navigation

## Getting Started

### Prerequisites

- Flutter SDK (latest stable version)
- Web development enabled: `flutter config --enable-web`

### Installation

1. Clone the repository:
```bash
git clone https://github.com/brendansiow/portfolio.git
cd portfolio
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the application:
```bash
flutter run -d chrome
```

### Build for Production

To build the web application for production:

```bash
flutter build web
```

The built files will be available in the `build/web` directory.

## Project Structure

```
lib/
├── main.dart                 # Main application entry point
├── screens/
│   └── home_screen.dart     # Main home screen with navigation
├── widgets/
│   ├── navigation_bar.dart  # Custom navigation bar
│   ├── about_section.dart   # About/Hero section
│   ├── experience_section.dart # Work experience timeline
│   ├── projects_section.dart   # Projects showcase
│   └── footer_section.dart     # Footer with contact form
└── utils/
    └── app_constants.dart   # Colors, text styles, and constants
```

## Customization

### Updating Personal Information

1. **About Section** (`lib/widgets/about_section.dart`):
   - Update name, title, and description
   - Replace profile image placeholder

2. **Experience Section** (`lib/widgets/experience_section.dart`):
   - Update job titles, companies, and dates
   - Modify descriptions and achievements

3. **Projects Section** (`lib/widgets/projects_section.dart`):
   - Add your actual projects
   - Update GitHub and live demo URLs
   - Modify technology stacks

4. **Contact Information** (`lib/widgets/footer_section.dart`):
   - Update email, phone, and location
   - Add your social media links

### Styling

- Colors and themes can be modified in `lib/utils/app_constants.dart`
- Font styles are defined using Google Fonts (Montserrat)
- Responsive breakpoints are handled in `ResponsiveHelper`

## Dependencies

- `flutter`: SDK for building the application
- `google_fonts`: For custom typography (Montserrat)
- `url_launcher`: For opening external links
- `font_awesome_flutter`: For additional icons

## Deployment

### GitHub Pages
1. Build the web application: `flutter build web`
2. Deploy the `build/web` directory to GitHub Pages

### Netlify/Vercel
1. Connect your repository to Netlify or Vercel
2. Set build command: `flutter build web`
3. Set publish directory: `build/web`

### Firebase Hosting
1. Install Firebase CLI: `npm install -g firebase-tools`
2. Initialize Firebase: `firebase init hosting`
3. Build and deploy: `flutter build web && firebase deploy`

## Contributing

Feel free to fork this project and customize it for your own portfolio. If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request.

## License

This project is open source and available under the [MIT License](LICENSE).

## Contact

- Email: john.doe@email.com
- LinkedIn: [linkedin.com/in/johndoe](https://linkedin.com/in/johndoe)
- GitHub: [github.com/johndoe](https://github.com/johndoe)

---

**Note**: This is a template portfolio with dummy content. Replace all placeholder information with your actual details before deploying.