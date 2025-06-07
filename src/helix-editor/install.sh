#!/bin/bash
set -euo pipefail

source /etc/os-release

deps_install() {
  echo "Installing dependencies..."
  case "${ID}" in
  debian|ubuntu)
    apt-get update -y && apt-get -y install --no-install-recommends curl tar xz-utils ca-certificates
    ;;
  *)
    echo "OS not supported.." 
    exit 1
  esac
}




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

deps_install
helix_install