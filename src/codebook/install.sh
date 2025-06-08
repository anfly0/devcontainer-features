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




codebook_install() {

  VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/blopker/codebook/releases/latest | grep -o '[^/]*$')

  curl -L "https://github.com/blopker/codebook/releases/download/${VERSION}/codebook-lsp-x86_64-unknown-linux-musl.tar.gz" -o codebook.tar.gz
  

  tar -xf codebook.tar.gz

  mv "./codebook-lsp" /usr/local/bin/

  rm -rf "codebook.tar.gz"

  echo "Codebook installed successfully."
}

deps_install
codebook_install