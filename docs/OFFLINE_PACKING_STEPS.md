# Android 离线打包步骤

1. 将 HBuilderX 4.76 对应的官方 Android 离线 SDK AAR/JAR 放入 `app/libs/`。
2. 用 HBuilderX 生成 `unpackage/resources/__UNI__BB37161/www`。
3. 运行 `scripts/sync-hbuilderx-resources.sh` 或 `.ps1` 同步资源。
4. 配置 `keystore.properties`。
5. Android Studio 使用 JDK 17 构建 release。

如果导入 SDK 后仍停留在提示页，请对照官方 SDK 示例工程，把真实的 `application android:name` 和 launcher activity 合并到本工程。
