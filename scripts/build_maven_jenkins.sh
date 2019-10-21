#!/bin/bash

# Additional flags for build script
additional_flags=$@;

# Check if we are in Jenkins or not if we are, then just keep going
if [ -z "${BUILD_NUMBER}" ]; then
  cd /workspace
fi

mvn -U clean install 
