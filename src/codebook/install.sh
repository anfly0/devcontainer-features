#!/bin/bash
set -euo pipefail

source /etc/os-release


codebook_install() {

  VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/blopker/codebook/releases/latest | grep -o '[^/]*$')

  curl -L "https://github.com/blopker/codebook/releases/download/${VERSION}/codebook-lsp-x86_64-unknown-linux-musl.tar.gz" -o codebook.tar.gz
  

  tar -xf codebook.tar.gz

  mv "./codebook-lsp" /usr/local/bin/

  rm -rf "codebook.tar.gz"

  echo "Codebook installed successfully."
}

codebook_install