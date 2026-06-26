# UTS 插件离线打包配置

本工程按 HBuilderX 4.76 及以下云端环境补齐 uni-app x Android 离线打包模块结构。

## 实际识别到的 Android UTS 插件

| uni_modules 插件 | 离线工程模块 | minSdk | 说明 |
| --- | --- | ---: | --- |
| firstui-uvue | uts-firstui-uvue | 27 | component-uts |
| kux-mlkit-scancode | uts-kux-mlkit-scancode | 21 | CameraX + ML Kit + 自带 AAR |
| kux-request | uts-kux-request | 21 | UTS 请求基础模块 |
| kux-request-lite | uts-kux-request-lite | 21 | UTS 请求 lite 模块 |
| kux-request-interceptors | uts-kux-request-interceptors | 21 | UTS 请求拦截器模块 |
| uni-installApk | uts-uni-installApk | 21 | 没有 config.json，但有 AndroidManifest.xml 和 index.uts |
| unix-ui | uts-unix-ui | 27 | component-uts |
| uts-openSchema | uts-uts-openSchema | 21 | yq-update-x 依赖 |
| z-paging-x | uts-z-paging-x | 21 | component-uts |

主工程 `minSdk` 取最大值 27。

## 资源来源

不要直接把源码仓库里的 `uni_modules/*/utssdk/app-android` 当最终产物复制进 Android 工程。正确来源是 HBuilderX 生成后的：

```text
unpackage/resources/app-android/uni_modules/<plugin>
unpackage/resources/app-android/uniappx/app-android/src
unpackage/resources/app-android/apps/__UNI__BB37161
```

可运行：

```bash
./scripts/sync-hbuilderx-android-export.sh /path/to/unpackage/resources/app-android
```

Windows：

```powershell
./scripts/sync-hbuilderx-android-export.ps1 D:/path/to/unpackage/resources/app-android
```

## 本地必须补的文件

这些文件不提交到公开仓库：

- `plugins/uts-kotlin-compiler-plugin-0.0.1.jar`
- `plugins/uts-kotlin-gradle-plugin-0.0.1.jar`
- `uniappx/libs/*.aar`
- 各 UTS 插件模块自身 `libs/*.aar` / `libs/*.jar`
- `keystore.properties`
- HBuilderX 导出的 `apps/__UNI__BB37161` 运行资源
