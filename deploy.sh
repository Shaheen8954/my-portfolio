#!/bin/bash

# Deploy script for Hugo portfolio site
# This script builds the site and deploys it to GitHub Pages

set -e  # Exit on any error

echo "🚀 Starting deployment process..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if Hugo is installed
if ! command -v hugo &> /dev/null; then
    print_error "Hugo is not installed. Please install Hugo first."
    exit 1
fi

print_status "Hugo version: $(hugo version)"

# Clean previous build
print_status "Cleaning previous build..."
rm -rf public/

# Build the site
print_status "Building site with Hugo..."
hugo --minify

# Check if build was successful
if [ ! -d "public" ]; then
    print_error "Build failed! public directory not found."
    exit 1
fi

print_status "Site built successfully!"

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    print_warning "Not in a git repository. Skipping deployment."
    print_status "Site built in public/ directory. You can manually deploy the contents."
    exit 0
fi

# Check if public is a git submodule
if [ -f "public/.git" ]; then
    print_status "Detected public/ as git submodule. Deploying to GitHub Pages..."
    
    # Navigate to public directory
    cd public
    
    # Check if there are changes
    if git diff --quiet && git diff --cached --quiet; then
        print_warning "No changes detected. Deployment skipped."
        cd ..
        exit 0
    fi
    
    # Add all changes
    git add .
    
    # Commit changes
    COMMIT_MESSAGE="Update site content - $(date '+%Y-%m-%d %H:%M:%S')"
    git commit -m "$COMMIT_MESSAGE"
    
    # Push to remote
    print_status "Pushing changes to GitHub Pages..."
    git push origin main
    
    cd ..
    print_status "✅ Deployment completed successfully!"
    print_status "Your site should be available at: https://portfolio.shaheen.homes"
    
else
    print_warning "public/ is not a git submodule."
    print_status "To enable automatic deployment:"
    echo "1. Remove the public/ directory"
    echo "2. Add your GitHub Pages repository as a submodule:"
    echo "   git submodule add https://github.com/Shaheen8954/my-portfolio-pages.git public"
    echo "3. Run this script again"
fi

print_status "🎉 Deployment process completed!" 