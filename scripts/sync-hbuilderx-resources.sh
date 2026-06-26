#!/usr/bin/env bash
set -euo pipefail
APPID="__UNI__BB37161"
RESOURCE_DIR="${1:-}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
TARGET_DIR="$ROOT_DIR/app/src/main/assets/apps/$APPID/www"
if [[ -z "$RESOURCE_DIR" ]]; then echo "Usage: $0 /path/to/unpackage/resources/$APPID"; exit 1; fi
if [[ ! -d "$RESOURCE_DIR" ]]; then echo "Resource directory not found: $RESOURCE_DIR"; exit 1; fi
SOURCE_WWW="$RESOURCE_DIR"
if [[ -d "$RESOURCE_DIR/www" ]]; then SOURCE_WWW="$RESOURCE_DIR/www"; fi
mkdir -p "$TARGET_DIR"
find "$TARGET_DIR" -mindepth 1 ! -name README.md ! -name .gitkeep -exec rm -rf {} +
cp -R "$SOURCE_WWW"/. "$TARGET_DIR"/
echo "Synced HBuilderX resources to $TARGET_DIR"
