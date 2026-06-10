#!/bin/bash
set -e

COMFY_DIR="/Volumes/MacMoneyMakerSSD/Ai_apps/ComfyUI"
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"

WAS_DIR="$COMFY_DIR/custom_nodes/was-ns"

if [ ! -d "$WAS_DIR" ]; then
  echo "ERROR: WAS node folder not found at:"
  echo "$WAS_DIR"
  exit 1
fi

mkdir -p "$WAS_DIR"

if [ -f "$WAS_DIR/styles.csv" ]; then
  cp "$WAS_DIR/styles.csv" "$WAS_DIR/styles.csv.bak.$(date +%Y%m%d_%H%M%S)"
fi

cp "$REPO_DIR/was-ns/styles/styles.csv" "$WAS_DIR/styles.csv"
cp "$REPO_DIR/was-ns/styles/fooocus_styles_for_was.csv" "$WAS_DIR/fooocus_styles_for_was.csv"

echo "Installed WAS Fooocus styles to:"
echo "$WAS_DIR/styles.csv"
