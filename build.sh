#!/bin/bash

# Jekyll build and serve script for local development
# This script builds the site to the build/ directory and serves it locally

echo "🔧 Building Jekyll site for local development..."

# Set PATH for Homebrew Ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Clean previous build
echo "🧹 Cleaning previous build..."
rm -rf build/ .sass-cache/ .jekyll-cache/

# Build the site
echo "🏗️  Building Jekyll site to build/ directory..."
/opt/homebrew/lib/ruby/gems/3.4.0/bin/jekyll build

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo "📁 Generated files in build/ directory:"
    ls -la build/

    # Verify key files were generated
    if [ -f "build/index.html" ] && [ -f "build/assets/css/style.css" ]; then
        echo "✅ Key files generated successfully!"
        echo "🌐 Site ready for local development!"

        # Ask if user wants to serve the site
        echo ""
        read -p "🚀 Serve site locally? (y/N): " -n 1 -r
        echo
        if [[ $REPLY =~ ^[Yy]$ ]]; then
            echo "🌐 Starting local server at http://localhost:4000"
            echo "Press Ctrl+C to stop the server"
            /opt/homebrew/lib/ruby/gems/3.4.0/bin/jekyll serve --destination build
        fi
    else
        echo "❌ Warning: Some key files may be missing"
    fi
else
    echo "❌ Build failed!"
    exit 1
fi

echo "🎉 Build complete!"