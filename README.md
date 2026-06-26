# 烘烤检验 uni-app x Android 离线打包工程

根据上传的 uni-app x 项目生成，目标对齐 HBuilderX 4.76 及以下云端打包环境，并按官方 uni-app x 原生 SDK 方式补齐 `uniappx` 主模块和 Android UTS 插件模块。

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

## 工程模块

| 模块 | 作用 |
| --- | --- |
| `app` | Android Application 壳工程 |
| `uniappx` | DCloud uni-app x 原生 SDK 主模块 |
| `uts-firstui-uvue` | `firstui-uvue` UTS 模块 |
| `uts-kux-mlkit-scancode` | `kux-mlkit-scancode` UTS 模块，含 ML Kit / CameraX 依赖 |
| `uts-kux-request` | `kux-request` UTS 模块 |
| `uts-kux-request-lite` | `kux-request-lite` UTS 模块 |
| `uts-kux-request-interceptors` | `kux-request-interceptors` UTS 模块 |
| `uts-uni-installApk` | `uni-installApk` UTS 模块 |
| `uts-unix-ui` | `unix-ui` UTS 模块 |
| `uts-uts-openSchema` | `uts-openSchema` UTS 模块 |
| `uts-z-paging-x` | `z-paging-x` UTS 模块 |

## 使用步骤

1. 下载与 HBuilderX 4.76 匹配的 uni-app x Android 离线 SDK。
2. 复制 DCloud 基础 AAR/JAR 到 `uniappx/libs/`。
3. 复制 SDK 中的 UTS Gradle 插件 jar 到 `plugins/`：
   - `uts-kotlin-compiler-plugin-0.0.1.jar`
   - `uts-kotlin-gradle-plugin-0.0.1.jar`
4. 用 HBuilderX 打开原项目，生成 Android 本地打包资源，得到 `unpackage/resources/app-android`。
5. 同步 HBuilderX 导出资源：

```bash
./scripts/sync-hbuilderx-android-export.sh /path/to/unpackage/resources/app-android
```

Windows：

```powershell
./scripts/sync-hbuilderx-android-export.ps1 D:/path/to/unpackage/resources/app-android
```

6. 复制 `keystore.properties.example` 为 `keystore.properties` 并填写本地证书。
7. 用 Android Studio 打开本仓库，选择 JDK 17，执行 `assembleRelease`。

## 已识别的 Android 插件点

- `kux-mlkit-scancode`：已加入 CameraX、ML Kit、AppCompat 等依赖。
- `firstui-uvue`、`unix-ui`：要求 `minSdkVersion 27`，因此本工程使用 `minSdk = 27`。
- `uni-installApk`：没有 `config.json`，但存在 Android UTS 入口和 Manifest，已作为独立模块纳入。
- `kux-request`：源码中存在 `utssdk/app-android/config.json`，已作为独立模块纳入。

更多细节见 `docs/UTS_PLUGINS.md`。

## 注意

本仓库不会提交官方 DCloud SDK、签名证书、HBuilderX 生成资源和原始项目 zip。它们都应在本地或私有制品库管理。
