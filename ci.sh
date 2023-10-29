#!/usr/bin/env bash
# Test that the flake-registry.json format is sorted & valid
set -euo pipefail

cd "$(dirname "$0")"

# Ensure current flake-registry.json file is sorted.
nix registry list --tarball-ttl 0 --flake-registry "$PWD/flake-registry.json" \
  | grep -- '^global ' | LC_ALL=C sort -u -c

nix run --flake-registry "$PWD/flake-registry.json" nixpkgs#hello
