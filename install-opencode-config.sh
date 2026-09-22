#!/usr/bin/env bash
set -euo pipefail
SRC="$(cd "$(dirname "$0")" && pwd)/opencode.json"
mkdir -p "$HOME/.config/opencode"
cp "$SRC" "$HOME/.config/opencode/opencode.json"
echo "Installed opencode.json to ~/.config/opencode/opencode.json"
