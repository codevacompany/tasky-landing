#!/bin/bash

# Script to copy assets from the main project to the landing page project

SOURCE_DIR="../tasky-system/src/assets/images"
TARGET_DIR="./assets/images"

# Create target directory structure
mkdir -p "$TARGET_DIR/landing"

# Copy logo
if [ -f "$SOURCE_DIR/tasky-white.png" ]; then
  cp "$SOURCE_DIR/tasky-white.png" "$TARGET_DIR/"
  echo "✓ Copied tasky-white.png"
else
  echo "⚠ Warning: tasky-white.png not found"
fi

# Copy landing page images
if [ -d "$SOURCE_DIR/landing" ]; then
  cp -r "$SOURCE_DIR/landing"/* "$TARGET_DIR/landing/"
  echo "✓ Copied landing page images"
else
  echo "⚠ Warning: landing directory not found"
fi

# Copy favicons
FAVICON_SOURCE_DIR="../tasky-system/public"
FAVICON_TARGET_DIR="./assets/favicons"
mkdir -p "$FAVICON_TARGET_DIR"

# favicon.ico goes to root (browser default lookup)
if [ -f "$FAVICON_SOURCE_DIR/favicon.ico" ]; then
  cp "$FAVICON_SOURCE_DIR/favicon.ico" .
  echo "✓ Copied favicon.ico to root"
fi

# Other favicons go to assets/favicons/
if [ -f "$FAVICON_SOURCE_DIR/favicon-16x16.png" ]; then
  cp "$FAVICON_SOURCE_DIR/favicon-16x16.png" "$FAVICON_SOURCE_DIR/favicon-32x32.png" "$FAVICON_SOURCE_DIR/apple-touch-icon.png" "$FAVICON_TARGET_DIR/"
  echo "✓ Copied favicons to assets/favicons/"
else
  echo "⚠ Warning: favicons not found"
fi

echo ""
echo "Assets copied successfully!"
echo ""
echo "Next steps:"
echo "1. Verify all images are in ./assets/images/"
echo "2. Test the landing page locally"
echo "3. Update meta tags in index.html with your domain"

