#!/usr/bin/env bash
# Test that the flake-registry.json format is valid
set -euo pipefail

cd "$(dirname "$0")"

nix run --flake-registry "$PWD/flake-registry.json" nixpkgs#hello
