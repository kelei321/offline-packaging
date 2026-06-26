plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

apply(plugin = "io.dcloud.uts.kotlin")

android {
    namespace = "cn.kviewui.uniModules.kuxMlkitScancode"
    compileSdk = 35
    buildToolsVersion = "35.0.0"

    defaultConfig { minSdk = 21 }
}

dependencies {
    compileOnly(fileTree(mapOf("dir" to "../uniappx/libs", "include" to listOf("*.jar", "*.aar"))))
    compileOnly(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar", "*.aar"))))
    compileOnly("com.alibaba:fastjson:1.2.83")
    compileOnly("androidx.core:core-ktx:1.10.1")
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")
    compileOnly("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4")

    implementation("androidx.camera:camera-camera2:1.2.1")
    implementation("androidx.camera:camera-core:1.2.1")
    implementation("androidx.camera:camera-lifecycle:1.2.1")
    implementation("androidx.camera:camera-view:1.2.1")
    implementation("com.google.mlkit:barcode-scanning:17.2.0")
    implementation("androidx.constraintlayout:constraintlayout:1.1.0")
    implementation("androidx.databinding:databinding-runtime:7.4.0")
    implementation("androidx.recyclerview:recyclerview:1.0.0")
    implementation("androidx.activity:activity:1.2.0")
    implementation("androidx.appcompat:appcompat:1.1.0")
}
