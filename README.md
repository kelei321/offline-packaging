# 烘烤检验 uni-app x Android 离线打包工程

根据上传的 uni-app x 项目生成，目标对齐 HBuilderX 4.76 及以下云端打包环境。

## 应用信息

| 项 | 值 |
| --- | --- |
| 应用名 | 烘烤检验 |
| AppID | `__UNI__BB37161` |
| versionName | `1.0.19` |
| versionCode | `100000019` |
| applicationId | `com.topp.bakinginspection` |
| minSdk | `27` |
| compileSdk / targetSdk | `35 / 35` |

`applicationId` 是按项目名称生成的默认值。如果之前云端打包已使用正式包名，离线打包前必须改成云端一致的包名，否则不能覆盖升级。

## 环境版本

| 项 | 版本 |
| --- | --- |
| Android 编译 SDK | `35` |
| Android 构建工具 | `35.0.0` |
| Gradle | `8.11.1` |
| Android Gradle Plugin | `8.7.3` |
| Kotlin Android Plugin | `1.9.10` |
| JDK | `17`，建议 Amazon Corretto `17.0.12.7.1` |

## 使用步骤

1. 下载与 HBuilderX 4.76 匹配的 uni-app x Android 离线 SDK，把 AAR/JAR 放到 `app/libs/`。
2. 用 HBuilderX 打开原项目，生成 Android 本地打包资源，得到 `unpackage/resources/__UNI__BB37161/www`。
3. 执行：`./scripts/sync-hbuilderx-resources.sh /path/to/unpackage/resources/__UNI__BB37161`。
4. 复制 `keystore.properties.example` 为 `keystore.properties` 并填写本地证书。
5. 用 Android Studio 打开本仓库，选择 JDK 17，执行 `assembleRelease`。

## 已识别的 Android 插件点

- `kux-mlkit-scancode`：已加入 CameraX、ML Kit、AppCompat 等依赖。
- `firstui-uvue`、`unix-ui`：要求 `minSdkVersion 27`，因此本工程使用 `minSdk = 27`。
- `uni-installApk`：没有 `config.json`，但存在 Android UTS 入口，生成资源和打包时不要漏掉。

## 注意

本仓库不会提交官方 DCloud SDK、签名证书、HBuilderX 生成资源和原始项目 zip。它们都应在本地或私有制品库管理。
