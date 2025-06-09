#!/bin/bash

set -e

source dev-container-features-test-lib

# Feature-specific tests
# The 'check' command comes from the dev-container-features-test-lib.
check "Curl is installed" bash -c "curl -V"
check "xz is installed" bash -c "xz -V"
check "tar is installed" bash -c "tar --version"


# Report result
# If any of the checks above exited with a non-zero exit code, the test will fail.
reportResults
