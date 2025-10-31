# Tasky Landing Page

Standalone HTML/CSS landing page for Tasky System, optimized for SEO and performance.

## Overview

This is a static landing page project converted from the Vue.js `LandingPage.vue` component. It uses pure HTML, CSS, and vanilla JavaScript for better SEO, faster initial load times, and easier deployment.

## Project Structure

```
tasky-landing/
├── index.html          # Main HTML file
├── styles.css          # All CSS styles
├── assets/             # Image assets
│   └── images/
│       ├── tasky-white.png
│       └── landing/
│           ├── hero-image.png
│           ├── productivity-icon.svg
│           ├── communication-icon.svg
│           ├── resources-icon.svg
│           ├── time-icon.svg
│           ├── task-management.svg
│           ├── integrated-communication.svg
│           ├── metrics-productivity.svg
│           ├── efficient-collaboration.svg
│           ├── x-logo.svg
│           ├── youtube.svg
│           └── linkedin.svg
└── README.md
```

## Setup

### 1. Copy Assets

Copy the required images from the main project:

```bash
# From the tasky-system root directory
mkdir -p tasky-landing/assets/images/landing

# Copy logo
cp tasky-system/src/assets/images/tasky-white.png tasky-landing/assets/images/

# Copy landing page images
cp tasky-system/src/assets/images/landing/* tasky-landing/assets/images/landing/
```

### 2. Local Development

You can serve this locally using any static file server:

**Using Python:**
```bash
cd tasky-landing
python3 -m http.server 8000
```

**Using Node.js (http-server):**
```bash
npx http-server tasky-landing -p 8000
```

**Using PHP:**
```bash
cd tasky-landing
php -S localhost:8000
```

Then open `http://localhost:8000` in your browser.

### 3. Deployment

This project can be deployed to any static hosting service:

- **Vercel**: Connect your GitHub repo and set the build directory to `tasky-landing`
- **Netlify**: Drag and drop the `tasky-landing` folder
- **GitHub Pages**: Push to a `gh-pages` branch
- **AWS S3**: Upload files to an S3 bucket with static website hosting enabled

## Features

- ✅ **SEO Optimized**: Meta tags, Open Graph, and Twitter Card support
- ✅ **Responsive Design**: Works on desktop, tablet, and mobile devices
- ✅ **Fast Loading**: No JavaScript framework overhead
- ✅ **Smooth Scrolling**: Vanilla JS for anchor link navigation
- ✅ **Accessible**: Semantic HTML and proper alt tags
- ✅ **Modern CSS**: CSS Variables and modern layout techniques

## Customization

### Colors

Edit the CSS variables in `styles.css`:

```css
:root {
  --primary-rgb: 66, 99, 235;
  --primary-dark: rgb(51, 78, 194);
  --secondary-dark-color: #00143b;
  --success-color: rgb(10, 197, 125);
}
```

### Links

Update the links in `index.html` to point to your application:

- `/login` - Login page
- `/cadastrar` - Sign up page
- Footer links (privacy, terms, etc.)

### Meta Tags

Update the Open Graph and Twitter Card meta tags in `index.html` with your actual URLs and images.

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Notes

- All images should be optimized for web before deployment
- Consider adding a favicon in the `<head>` section
- For production, minify CSS and enable compression on your hosting service
- Consider adding Google Analytics if needed

## Migration Notes

This landing page was migrated from `tasky-system/src/pages/public/LandingPage.vue`:

**Changes made:**
- Converted Vue template to HTML
- Converted Vue `<style scoped>` to external CSS
- Replaced `router-link` with regular `<a>` tags
- Removed Vue dependencies
- Added SEO meta tags
- Added smooth scroll JavaScript
- Updated asset paths to relative paths

**Preserved:**
- All styling and animations
- All content and structure
- Responsive breakpoints
- Color scheme and branding

