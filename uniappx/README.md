# uniappx 模块

这是 uni-app x Android 离线 SDK 主模块。

本地需要补充：

1. 从 HBuilderX 4.76 对应的官方原生离线 SDK 复制基础 AAR 到 `uniappx/libs/`。
2. 用 HBuilderX 生成本地打包资源后，运行同步脚本复制：
   - `uniappx/app-android/src` -> `uniappx/src/main/java`
   - `apps/__UNI__BB37161` -> `uniappx/src/main/assets/apps/__UNI__BB37161`

官方 SDK、HBuilderX 生成资源不提交到公开仓库。
