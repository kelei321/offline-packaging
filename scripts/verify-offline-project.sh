#!/usr/bin/env bash
set -euo pipefail
ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
APPID="__UNI__BB37161"
STATUS=0
check(){ if eval "$2"; then echo "[OK] $1"; else echo "[FAIL] $1"; STATUS=1; fi }
check "compileSdk = 35" "grep -q 'compileSdk = 35' '$ROOT_DIR/app/build.gradle.kts'"
check "buildToolsVersion = 35.0.0" "grep -q 'buildToolsVersion = \"35.0.0\"' '$ROOT_DIR/app/build.gradle.kts'"
check "AGP = 8.7.3" "grep -q 'com.android.application.*8.7.3' '$ROOT_DIR/build.gradle.kts'"
check "Kotlin = 1.9.10" "grep -q 'org.jetbrains.kotlin.android.*1.9.10' '$ROOT_DIR/build.gradle.kts'"
check "appid control xml" "grep -q '$APPID' '$ROOT_DIR/app/src/main/assets/data/dcloud_control.xml'"
check "official SDK AAR/JAR exists" "find '$ROOT_DIR/app/libs' -maxdepth 1 \( -name '*.aar' -o -name '*.jar' \) | grep -q ."
check "HBuilderX www resources copied" "find '$ROOT_DIR/app/src/main/assets/apps/$APPID/www' -mindepth 1 ! -name README.md ! -name .gitkeep | grep -q ."
exit $STATUS
