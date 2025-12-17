#!/bin/bash

# Jekyll build script for GitHub Pages
# This script builds the site to the docs/ directory for deployment

echo "🔧 Building Jekyll site for GitHub Pages..."

# Set PATH for Homebrew Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf docs/_site docs/.sass-cache docs/.jekyll-cache

# Build the site
echo "🏗️  Building Jekyll site to docs/ directory..."
/opt/homebrew/lib/ruby/gems/3.4.0/bin/jekyll build --destination docs

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "📁 Generated files in docs/ directory:"
    ls -la docs/

    # Verify key files were generated
    if [ -f "docs/index.html" ] && [ -f "docs/assets/css/style.css" ]; then
        echo "✅ Key files generated successfully!"
        echo "🌐 Site ready for GitHub Pages deployment!"
    else
        echo "❌ Warning: Some key files may be missing"
    fi
else
    echo "❌ Build failed!"
    exit 1
fi

echo "🎉 Build complete!"