#!/bin/bash

# Jekyll build and serve script for local development
# This script builds the site to the build/ directory and serves it locally
# For GitHub Pages with docs/ folder as root

echo "🔧 Building Jekyll site for local development..."
echo "📁 Using docs/ folder as content source (GitHub Pages style)"

# Set PATH for Homebrew Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf build/ .sass-cache/ .jekyll-cache/

# For local development, we need to copy docs content to root temporarily
echo "📋 Setting up docs folder for GitHub Pages style build..."
# Create temp directory for docs content
mkdir -p temp_docs
# Copy docs folder content to root for GitHub Pages style build (this puts .md files at root)
cp -r docs/* temp_docs/
# Copy root files needed for Jekyll
cp _config.yml temp_docs/
cp -r _layouts temp_docs/ 2>/dev/null || true
cp -r _includes temp_docs/ 2>/dev/null || true
cp -r _data temp_docs/ 2>/dev/null || true
cp -r _sass temp_docs/ 2>/dev/null || true
cp -r assets temp_docs/ 2>/dev/null || true

# Build from temp_docs directory
echo "🏗️  Building Jekyll site from docs/ structure..."
cd temp_docs
/opt/homebrew/lib/ruby/gems/3.4.0/bin/jekyll build --destination ../build
cd ..

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "📁 Generated files in build/ directory:"
    ls -la build/

    # Rename README.html to index.html for proper homepage
    if [ -f "build/README.html" ]; then
        echo "🔄 Renaming README.html to index.html for proper homepage..."
        mv build/README.html build/index.html
    fi

    # Also handle the case where there might be docs/README.html
    if [ -f "build/docs/README.html" ]; then
        echo "🔄 Found docs/README.html, moving to root as index.html..."
        mv build/docs/README.html build/index.html
    fi

    # Verify key files were generated
    if [ -f "build/index.html" ]; then
        echo "✅ Key files generated successfully!"
        echo "🌐 Site ready for local development!"
        echo "📄 Main index file: build/index.html (from docs/README.md)"
        echo "🔗 Access at: http://localhost:4000/ (matches https://llm.uz0.dev/ behavior)"
    else
        echo "❌ Warning: Some key files may be missing"
        echo "🔍 Checking for README.html..."
        if [ -f "build/README.html" ]; then
            echo "✅ Found README.html that should be renamed to index.html"
        fi
    fi

    # Cleanup temp directory
    echo "🧹 Cleaning up temporary files..."
    rm -rf temp_docs

    # Ask if user wants to serve the site
    echo ""
    read -p "🚀 Serve site locally? (y/N): " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        echo "🌐 Starting local server at http://localhost:4000"
        echo "Press Ctrl+C to stop the server"
        echo "📝 Note: Serving static files from build/ directory (no Jekyll processing)"
        echo "🔗 Access homepage at: http://localhost:4000/ (matches https://llm.uz0.dev/)"
        echo "🔗 Example: http://localhost:4000/01_prompt.html (matches https://llm.uz0.dev/01_prompt.html)"

        # Change to build directory and serve static files
        cd build
        python3 -m http.server 4000
    fi
else
    echo "❌ Build failed!"
    # Cleanup temp directory on failure
    rm -rf temp_docs
    exit 1
fi

echo "🎉 Build complete!"
echo "💡 For GitHub Pages: The docs/ folder will serve as the site root automatically"