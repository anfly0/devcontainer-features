#!/bin/bash
set -euo pipefail

ls -l

# Extract and find extracted directory
extracted_dir=$(find . -maxdepth 1 -type d -name "helix-*-x86_64-linux" | head -n 1)

if [[ -z "$extracted_dir" ]]; then
  echo "Failed to find extracted Helix directory."
  exit 1
fi

# Install binaries
mv "$extracted_dir/hx" /usr/local/bin/
mv "$extracted_dir/runtime" /usr/local/bin/

# Cleanup
rm -rf "$extracted_dir"

echo "Helix installed successfully."
