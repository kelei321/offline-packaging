#!/usr/bin/env bash
set -euo pipefail

APPID="__UNI__BB37161"
EXPORT_DIR="${1:-}"
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

if [[ -z "$EXPORT_DIR" ]]; then
  echo "Usage: $0 /path/to/unpackage/resources/app-android"
  exit 1
fi

if [[ ! -d "$EXPORT_DIR" ]]; then
  echo "Export directory not found: $EXPORT_DIR"
  exit 1
fi

copy_dir() {
  local src="$1"
  local dst="$2"
  if [[ -d "$src" ]]; then
    mkdir -p "$dst"
    find "$dst" -mindepth 1 ! -name README.md ! -name .gitkeep -exec rm -rf {} +
    cp -R "$src"/. "$dst"/
    echo "[OK] $src -> $dst"
  else
    echo "[SKIP] $src"
  fi
}

copy_file() {
  local src="$1"
  local dst="$2"
  if [[ -f "$src" ]]; then
    mkdir -p "$(dirname "$dst")"
    cp "$src" "$dst"
    perl -0pi -e 's/\s+package="[^"]+"//' "$dst"
    echo "[OK] $src -> $dst"
  else
    echo "[SKIP] $src"
  fi
}

sync_plugin() {
  local plugin="$1"
  local module="$2"
  local src="$EXPORT_DIR/uni_modules/$plugin"
  local dst="$ROOT_DIR/$module"

  if [[ ! -d "$src" ]]; then
    echo "[SKIP] $plugin"
    return
  fi

  copy_file "$src/AndroidManifest.xml" "$dst/src/main/AndroidManifest.xml"
  copy_dir "$src/src" "$dst/src/main/java"
  copy_dir "$src/res" "$dst/src/main/res"
  copy_dir "$src/assets" "$dst/src/main/assets"
  copy_dir "$src/libs" "$dst/libs"
}

copy_dir "$EXPORT_DIR/uniappx/app-android/src" "$ROOT_DIR/uniappx/src/main/java"
copy_dir "$EXPORT_DIR/uniappx/app-android/res" "$ROOT_DIR/uniappx/src/main/res"
copy_dir "$EXPORT_DIR/uniappx/app-android/assets" "$ROOT_DIR/uniappx/src/main/assets"
copy_dir "$EXPORT_DIR/apps/$APPID" "$ROOT_DIR/uniappx/src/main/assets/apps/$APPID"

sync_plugin "firstui-uvue" "uts-firstui-uvue"
sync_plugin "kux-mlkit-scancode" "uts-kux-mlkit-scancode"
sync_plugin "kux-request" "uts-kux-request"
sync_plugin "kux-request-lite" "uts-kux-request-lite"
sync_plugin "kux-request-interceptors" "uts-kux-request-interceptors"
sync_plugin "uni-installApk" "uts-uni-installApk"
sync_plugin "unix-ui" "uts-unix-ui"
sync_plugin "uts-openSchema" "uts-uts-openSchema"
sync_plugin "z-paging-x" "uts-z-paging-x"

echo "Synced HBuilderX Android export."
