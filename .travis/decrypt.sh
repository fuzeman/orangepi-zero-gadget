#!/usr/bin/env bash

# Ensure .snapcraft/ directory exists
mkdir .snapcraft/

# Decrypt snapcraft credentials
openssl aes-256-cbc \
  -K $encrypted_11c168ff89cc_key \
  -iv $encrypted_11c168ff89cc_iv \
  -in .travis/snapcraft.cfg \
  -out .snapcraft/snapcraft.cfg -d
