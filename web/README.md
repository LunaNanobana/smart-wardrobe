# FashOn Website

## Overview
FashOn is a single-page website for the FashOn AI Fashion App.
Built with pure HTML, CSS, and Vanilla JavaScript — no frameworks required.

## Pages / Sections
| Section ID  | Description                        |
|-------------|------------------------------------|
| `home`      | Hero, stats, features grid         |
| `login`     | Login/Sign Up form                 |
| `search`    | Visual search + product grid       |
| `try-on`    | Virtual try-on with progress demo  |
| `dress-me`  | AI outfit generator                |
| `my-page`   | User profile + digital closet      |

## Running Locally

Simply open `index.html` in a browser:
```bash
open index.html
# or serve with any static server:
npx serve .
python3 -m http.server 8080
```

## File Structure
```
fashion_website/
  index.html          # Main HTML (all pages as sections)
  css/
    styles.css        # All styles with CSS variables
  js/
    main.js           # Navigation, animations, interactive demos
  assets/
    images/           # All images used in the site
  README.md
```

## Features
- Responsive design (mobile-friendly)
- SPA navigation (no page reloads)
- Animated progress bar on try-on page
- Interactive chip selectors on Dress Me page
- Product grid with search functionality
- Social login buttons
- Footer with navigation

## Customization
All colors are CSS variables in `css/styles.css`:
```css
:root {
  --deep-pink: #D4597A;
  --primary-pink: #E8A0B4;
  --bg: #FCE8F0;
  ...
}
```
