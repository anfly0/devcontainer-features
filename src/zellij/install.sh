#!/bin/bash
set -euo pipefail

source /etc/os-release


snippet_install() {

  VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/zellij-org/zellij/releases/latest | grep -o '[^/]*$')
  curl -L "https://github.com/zellij-org/zellij/releases/download/${VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz" -o zellij.tar.gz
  tar -xf zellij.tar.gz

  mv "./zellij" /usr/local/bin/

  rm -rf "zellij.tar.gz"

  echo "Zellij installed successfully."
}

snippet_install