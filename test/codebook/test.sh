#!/bin/bash

# This test file will be executed against one of the scenarios devcontainer.json test that
# includes the 'color' feature with "favorite": "gold" option.

set -e

# Optional: Import test library bundled with the devcontainer CLI
source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Check codebook version" bash -c "codebook-lsp -V | grep 'codebook'"

# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
