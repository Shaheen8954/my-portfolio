# CI/CD Setup for Hugo Portfolio

This document explains the Continuous Integration and Continuous Deployment (CI/CD) setup for the Hugo portfolio site.

## 🚀 Overview

The portfolio site uses a dual deployment strategy:
1. **GitHub Actions CI/CD** - Automated deployment on push to main branch
2. **Local Deployment Script** - Manual deployment for testing and quick updates

## 📁 Repository Structure

```
Portfolio/
├── .github/workflows/     # GitHub Actions workflows
│   └── deploy.yml        # Main deployment workflow
├── content/              # Hugo content files
├── layouts/              # Hugo templates
├── public/               # Git submodule for GitHub Pages
├── deploy.sh             # Local deployment script
└── hugo.yaml            # Hugo configuration
```

## 🔧 CI/CD Components

### 1. GitHub Actions Workflow (`.github/workflows/deploy.yml`)

**Triggers:**
- Push to `main` branch
- Pull requests to `main` branch
- Manual workflow dispatch

**Process:**
1. **Install Hugo CLI** - Downloads and installs Hugo Extended
2. **Checkout Repository** - Clones with submodules
3. **Setup Pages** - Configures GitHub Pages environment
4. **Build Site** - Runs Hugo with production settings
5. **Upload Artifact** - Uploads built site to GitHub Pages
6. **Deploy** - Deploys to GitHub Pages

### 2. Local Deployment Script (`deploy.sh`)

**Features:**
- Builds site with Hugo
- Handles git submodule operations
- Resolves merge conflicts automatically
- Provides detailed error reporting
- Compatible with CI/CD workflows

## 🛠️ Usage

### Automated Deployment (Recommended)

1. **Make changes** to your content or templates
2. **Commit and push** to the main branch:
   ```bash
   git add .
   git commit -m "Update site content"
   git push origin main
   ```
3. **GitHub Actions** will automatically:
   - Build the site
   - Deploy to GitHub Pages
   - Update your site at `https://portfolio.shaheen.homes`

### Manual Deployment

For testing or quick updates:

```bash
./deploy.sh
```

This will:
- Build the site locally
- Deploy to the GitHub Pages submodule
- Handle any git conflicts

## 🔍 Troubleshooting

### Common Issues

#### 1. Merge Conflicts

**Problem:** Git conflicts between local and remote changes

**Solution:**
```bash
cd public
git pull origin main --no-rebase
# Resolve conflicts if any
git push origin main
cd ..
```

#### 2. Submodule Issues

**Problem:** Submodule not properly initialized

**Solution:**
```bash
git submodule update --init --recursive
```

#### 3. Build Failures

**Problem:** Hugo build errors

**Solution:**
```bash
# Check Hugo version
hugo version

# Build with verbose output
hugo --verbose

# Check for syntax errors in templates
hugo --templateMetrics
```

### Debugging CI/CD

1. **Check GitHub Actions** - Go to Actions tab in your repository
2. **View Workflow Logs** - Click on the failed workflow run
3. **Check Build Output** - Look for specific error messages
4. **Test Locally** - Run `hugo server` to test locally first

## 📊 Monitoring

### GitHub Actions Status

- **Green Check** - Deployment successful
- **Red X** - Deployment failed (check logs)
- **Yellow Circle** - Deployment in progress

### Site Status

- **Live Site** - `https://portfolio.shaheen.homes`
- **Build Time** - Usually 1-2 minutes
- **Cache** - GitHub Pages caches for ~5 minutes

## 🔒 Security

### Permissions

The workflow uses minimal required permissions:
- `contents: read` - Read repository content
- `pages: write` - Deploy to GitHub Pages
- `id-token: write` - Authentication

### Secrets

No secrets are required for this setup as it uses GitHub's built-in authentication.

## 🚀 Best Practices

### 1. Content Management

- **Use drafts** for work-in-progress content
- **Test locally** before pushing
- **Use descriptive commit messages**

### 2. Deployment

- **Push to main** triggers automatic deployment
- **Use pull requests** for major changes
- **Monitor deployment status**

### 3. Maintenance

- **Keep Hugo updated** - Update version in workflow
- **Regular backups** - Repository serves as backup
- **Monitor performance** - Check site loading times

## 📝 Configuration

### Hugo Configuration

Key settings in `hugo.yaml`:
```yaml
baseURL: 'https://portfolio.shaheen.homes/'
environment: production
minify: true
```

### GitHub Pages Settings

- **Source** - Deploy from a branch
- **Branch** - `gh-pages` (managed by Actions)
- **Custom Domain** - `portfolio.shaheen.homes`

## 🔄 Workflow Lifecycle

1. **Development** - Make changes locally
2. **Testing** - Run `hugo server` to preview
3. **Commit** - Stage and commit changes
4. **Push** - Push to trigger CI/CD
5. **Build** - GitHub Actions builds site
6. **Deploy** - Site deployed to GitHub Pages
7. **Live** - Site available at custom domain

## 📞 Support

If you encounter issues:

1. **Check this documentation**
2. **Review GitHub Actions logs**
3. **Test locally with `hugo server`**
4. **Check Hugo documentation**

---

*This CI/CD setup ensures reliable, automated deployment of your Hugo portfolio site.* 