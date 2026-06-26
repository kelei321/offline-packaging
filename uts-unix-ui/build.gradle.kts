plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

apply(plugin = "io.dcloud.uts.kotlin")

android {
    namespace = "uts.sdk.modules.unixUi"
    compileSdk = 35
    buildToolsVersion = "35.0.0"

    defaultConfig { minSdk = 27 }
}

dependencies {
    compileOnly(fileTree(mapOf("dir" to "../uniappx/libs", "include" to listOf("*.jar", "*.aar"))))
    compileOnly(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar", "*.aar"))))
    compileOnly("com.alibaba:fastjson:1.2.83")
    compileOnly("androidx.core:core-ktx:1.10.1")
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4")
}
