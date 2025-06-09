#!/bin/bash
set -euo pipefail

source /etc/os-release

helix_install() {

  VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/helix-editor/helix/releases/latest | grep -o '[^/]*$')

  curl -L "https://github.com/helix-editor/helix/releases/download/${VERSION}/helix-${VERSION}-x86_64-linux.tar.xz" -o helix.tar.xz

  tar -xf helix.tar.xz

  extracted_dir=$(find . -maxdepth 1 -type d -name "helix-*-x86_64-linux" | head -n 1)

  if [[ -z "$extracted_dir" ]]; then
    echo "Failed to find extracted Helix directory."
    exit 1
  fi

  mv "$extracted_dir/hx" /usr/local/bin/
  mv "$extracted_dir/runtime" /usr/local/bin/

  rm -rf "$extracted_dir"

  echo "Helix installed successfully."
}

helix_install