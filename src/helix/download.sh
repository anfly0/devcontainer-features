#!/bin/bash

# This file is used to update helix to the lates version

set -e
# Get latest helix release tag dynamically
LATEST_RELEASE=$(curl -Ls -o /dev/null -w %{url_effective} https://github.com/helix-editor/helix/releases/latest | grep -o '[^/]*$')

echo installing helix ${LATEST_RELEASE}
# Fetch and extract the actual archive
curl -L "https://github.com/helix-editor/helix/releases/download/${LATEST_RELEASE}/helix-${LATEST_RELEASE}-x86_64-linux.tar.xz" -o helix.tar.xz

tar -xf helix.tar.xz
rm helix.tar.xz