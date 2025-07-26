#!/bin/bash
# Simple validation script for the Flutter portfolio project
# This script checks basic project health before deployment

echo "🔍 Validating Flutter Portfolio Project..."

# Check if all required files exist
echo "📁 Checking required files..."
files=(
    "pubspec.yaml"
    "lib/main.dart"
    "web/index.html"
    "web/manifest.json"
    "web/favicon.png"
    "web/icons/Icon-192.png"
    "web/icons/Icon-512.png"
    ".github/workflows/deploy.yml"
)

for file in "${files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file exists"
    else
        echo "❌ $file is missing"
        exit 1
    fi
done

# Check YAML syntax
echo "📋 Validating YAML files..."
if python3 -c "import yaml; yaml.safe_load(open('pubspec.yaml'))" 2>/dev/null; then
    echo "✅ pubspec.yaml syntax is valid"
else
    echo "❌ pubspec.yaml has syntax errors"
    exit 1
fi

if python3 -c "import yaml; yaml.safe_load(open('.github/workflows/deploy.yml'))" 2>/dev/null; then
    echo "✅ deploy.yml syntax is valid"
else
    echo "❌ deploy.yml has syntax errors"
    exit 1
fi

# Check Dart imports
echo "🎯 Checking Dart imports..."
if grep -r "import.*flutter" lib/ > /dev/null; then
    echo "✅ Flutter imports found"
else
    echo "❌ No Flutter imports found in lib/"
    exit 1
fi

# Check web configuration
echo "🌐 Checking web configuration..."
if grep -q "base href" web/index.html; then
    echo "✅ Base href configured in index.html"
else
    echo "❌ Base href not found in index.html"
    exit 1
fi

if grep -q "icons" web/manifest.json; then
    echo "✅ Icons configured in manifest.json"
else
    echo "❌ Icons not configured in manifest.json"
    exit 1
fi

echo ""
echo "🎉 All validations passed! Project should be ready for deployment."
echo ""
echo "🚀 Key improvements made:"
echo "   - Flutter version: 3.22.3 (stable)"
echo "   - Compatible dependency versions"
echo "   - Complete web asset setup"
echo "   - Enhanced workflow with caching and error handling"
echo "   - Build verification steps"
echo ""
echo "ℹ️  The next push to main branch should trigger a successful deployment."