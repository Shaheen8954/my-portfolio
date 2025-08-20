# Shaheen's Portfolio

A modern, responsive portfolio website built with Hugo static site generator. This site showcases professional experience, projects, and technical blog posts.

## 🌟 Features

- **Fast & Secure**: Built with Hugo for lightning-fast performance
- **Responsive Design**: Mobile-first approach with modern CSS
- **SEO Optimized**: Meta tags, Open Graph, and structured data
- **Blog Section**: Technical articles and tutorials
- **Project Showcase**: Detailed project pages with technologies used
- **Professional About**: Skills, experience, and background information
- **GitHub Pages Ready**: Configured for easy deployment

## 🚀 Quick Start

### Prerequisites

- Hugo Extended (v0.120.0 or later)
- Git

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/Shaheen8954/my-portfolio.git
   cd Portfolio
   ```

2. **Install Hugo** (if not already installed)
   ```bash
   # On Ubuntu/Debian
   sudo apt-get install hugo
   
   # On macOS
   brew install hugo
   
   # On Windows
   choco install hugo-extended
   ```

3. **Start development server**
   ```bash
   hugo server -D
   ```

4. **Visit the site**
   Open [http://localhost:1313](http://localhost:1313) in your browser

## 📁 Project Structure

```
Portfolio/
├── content/                 # Content files (Markdown)
│   ├── _index.md           # Homepage
│   ├── about/
│   │   └── _index.md       # About page
│   ├── projects/
│   │   ├── _index.md       # Projects listing
│   │   └── ecommerce-platform.md
│   └── blogs/
│       ├── _index.md       # Blog listing
│       └── hugo-getting-started.md
├── layouts/                # HTML templates
│   └── _default/
│       ├── baseof.html     # Base template
│       ├── list.html       # List pages
│       └── single.html     # Single pages
├── static/                 # Static assets
├── hugo.yaml              # Site configuration
└── README.md              # This file
```

## 🎨 Customization

### Site Configuration

Edit `hugo.yaml` to customize:
- Site title and description
- Base URL
- Menu structure
- Theme settings

### Content Management

#### Adding New Blog Posts
```bash
hugo new blog/my-new-post.md
```

#### Adding New Projects
```bash
hugo new projects/my-new-project.md
```

#### Content Front Matter
```yaml
---
title: "Page Title"
description: "Page description for SEO"
date: 2025-01-27
draft: false
tags: ["tag1", "tag2"]
---
```

### Styling

The site uses custom CSS embedded in the base template. To modify styles:

1. Edit the `<style>` section in `layouts/_default/baseof.html`
2. Or create separate CSS files in `static/css/` and link them

## 🚀 Deployment

### GitHub Pages

This site is configured for GitHub Pages deployment with the following setup:

1. **Main Repository**: [my-portfolio](https://github.com/Shaheen8954/my-portfolio.git)
   - Contains the Hugo source code
   - Development and content management

2. **Pages Repository**: [my-portfolio-pages](https://github.com/Shaheen8954/my-portfolio-pages)
   - Submodule for GitHub Pages deployment
   - Contains the built static files

### Deployment Process

1. **Build the site**
   ```bash
   hugo --minify
   ```

2. **Deploy to GitHub Pages**
   ```bash
   # Navigate to the pages submodule
   cd public
   
   # Add and commit changes
   git add .
   git commit -m "Update site content"
   git push origin main
   ```

### Alternative Deployment Options

#### Netlify
1. Connect your GitHub repository to Netlify
2. Set build command: `hugo --minify`
3. Set publish directory: `public`

#### Vercel
1. Install Vercel CLI: `npm i -g vercel`
2. Run: `vercel`

## 📝 Content Guidelines

### Blog Posts
- Use clear, descriptive titles
- Include relevant tags for categorization
- Write engaging descriptions
- Use proper Markdown formatting
- Include code examples when relevant

### Project Pages
- Provide comprehensive project overviews
- List all technologies used
- Include live demos and source code links
- Describe challenges and solutions
- Add screenshots or videos when possible

### About Page
- Keep information current and relevant
- Highlight key skills and experience
- Include professional achievements
- Maintain a professional tone

## 🔧 Development

### Local Development
```bash
# Start development server with drafts
hugo server -D

# Build for production
hugo --minify

# Build with future posts
hugo -F
```

### Useful Commands
```bash
# Create new content
hugo new section/page.md

# List all content
hugo list all

# Check site configuration
hugo config
```

## 📊 Performance

The site is optimized for performance with:
- Minified HTML, CSS, and JavaScript
- Optimized images and assets
- Fast loading times
- SEO-friendly structure
- Mobile-responsive design

## 🔒 Security

- Static site generation eliminates server-side vulnerabilities
- No database or server-side code execution
- Secure HTTPS deployment
- Regular dependency updates

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test locally with `hugo server`
5. Submit a pull request

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

## 📞 Contact

- **Website**: [portfolio.shaheen.homes](https://portfolio.shaheen.homes)
- **Email**: [contact@shaheen.homes](mailto:contact@shaheen.homes)
- **GitHub**: [@Shaheen8954](https://github.com/Shaheen8954)
- **LinkedIn**: [Shaheen's Profile](https://linkedin.com/in/shaheen8954)

---

*Built with ❤️ using Hugo and modern web technologies*