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

echo ""
echo "Assets copied successfully!"
echo ""
echo "Next steps:"
echo "1. Verify all images are in ./assets/images/"
echo "2. Test the landing page locally"
echo "3. Update meta tags in index.html with your domain"

