#!/bin/bash
set -euo pipefail

source /etc/os-release


snippet_install() {

  VERSION=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/quantonganh/snippets-ls/releases/latest | grep -o '[^/]*$')
  curl -L "https://github.com/quantonganh/snippets-ls/releases/download/${VERSION}/snippets-ls_Linux_x86_64.tar.gz" -o snippets-ls.tar.xz

  tar -xf snippets-ls.tar.xz

  mv "./snippets-ls" /usr/local/bin/

  rm -rf "snippets-ls.tar.xz"

  echo "Snippet-ls installed successfully."
}

snippet_install