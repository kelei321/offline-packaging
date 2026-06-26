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
check "Jetifier enabled" "grep -q 'android.enableJetifier=true' '$ROOT_DIR/gradle.properties'"
check "uniappx module included" "grep -q 'include(\":uniappx\")' '$ROOT_DIR/settings.gradle.kts'"
check "UTS modules included" "grep -q 'uts-kux-mlkit-scancode' '$ROOT_DIR/settings.gradle.kts' && grep -q 'uts-uni-installApk' '$ROOT_DIR/settings.gradle.kts'"
check "UTS gradle plugins copied" "test -f '$ROOT_DIR/plugins/uts-kotlin-compiler-plugin-0.0.1.jar' && test -f '$ROOT_DIR/plugins/uts-kotlin-gradle-plugin-0.0.1.jar'"
check "DCloud SDK AAR/JAR exists" "find '$ROOT_DIR/uniappx/libs' -maxdepth 1 \( -name '*.aar' -o -name '*.jar' \) | grep -q ."
check "appid control xml" "grep -q '$APPID' '$ROOT_DIR/uniappx/src/main/assets/data/dcloud_control.xml'"
check "HBuilderX app resources copied" "find '$ROOT_DIR/uniappx/src/main/assets/apps/$APPID' -mindepth 1 ! -name README.md ! -name .gitkeep | grep -q ."
exit $STATUS
