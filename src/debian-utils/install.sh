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

deps_install