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
├── vercel.json         # Vercel deployment configuration
└── README.md
```

## Setup

### 1. Copy Assets

Copy the required images from the main project:

```bash
# From the tasky-system root directory
bash copy-assets.sh

# Or manually:
mkdir -p assets/images/landing
cp ../tasky-system/src/assets/images/tasky-white.png assets/images/
cp ../tasky-system/src/assets/images/landing/* assets/images/landing/
```

### 2. Local Development

**Important:** When developing locally, use relative paths (which are already set in the HTML). Make sure you're running a local server from the `tasky-landing` directory.

**Using Python:**

```bash
cd tasky-landing
python3 -m http.server 8000
```

Then open `http://localhost:8000/index.html`

**Using Node.js (http-server):**

```bash
npx http-server tasky-landing -p 8000
```

**Using VS Code Live Server:**

- Right-click on `index.html` → "Open with Live Server"
- Make sure the root directory is set to `tasky-landing`

### 3. Deployment to Vercel

The `vercel.json` is configured to handle both relative and absolute paths. When you deploy:

1. **Option A: Deploy `tasky-landing` folder directly**

   - The relative paths will work as-is

2. **Option B: Deploy from project root**

   - If deploying from the main project root, Vercel will automatically serve files correctly

3. **Deploy via Vercel CLI:**

   ```bash
   cd tasky-landing
   vercel
   ```

4. **Deploy via GitHub:**
   - Connect your GitHub repo to Vercel
   - Set the root directory to `tasky-landing` in Vercel project settings
   - Vercel will automatically detect and deploy

**Note:** After deploying to Vercel, if paths don't work, you may need to update paths to absolute (starting with `/`) in `index.html`. The current setup uses relative paths which work locally and should work on Vercel if the root is set correctly.

## Path Configuration

- **Local development:** Uses relative paths (e.g., `styles.css`, `assets/images/...`)
- **Vercel deployment:** The `vercel.json` handles path routing
- **If issues persist:** Change paths to absolute (e.g., `/styles.css`, `/assets/images/...`) in `index.html`

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

- `https://app.taskypro.com.br/login` - Login page
- `https://app.taskypro.com.br/cadastrar` - Sign up page
- Footer links (privacy, terms, etc.)

### Meta Tags

Update the Open Graph and Twitter Card meta tags in `index.html` with your actual URLs and images.

## Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)

## Troubleshooting

### CSS not loading locally

- Make sure you're running a local server (not opening `file://`)
- Check that `styles.css` is in the same directory as `index.html`
- Verify the server is running from the `tasky-landing` directory

### Images not loading locally

- Ensure the `assets` folder exists and contains all images
- Run `bash copy-assets.sh` to copy assets from the main project
- Check browser console for 404 errors

### CSS not loading on Vercel

- Verify `vercel.json` is present and correctly formatted
- Check Vercel deployment logs
- Try changing paths to absolute (starting with `/`) in `index.html`

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
- Updated asset paths to relative paths (work both locally and on Vercel)

**Preserved:**

- All styling and animations
- All content and structure
- Responsive breakpoints
- Color scheme and branding
