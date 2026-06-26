plugins {
    id("com.android.library")
    id("org.jetbrains.kotlin.android")
}

apply(plugin = "io.dcloud.uts.kotlin")

android {
    namespace = "com.topp.bakinginspection.uniappx"
    compileSdk = 35
    buildToolsVersion = "35.0.0"

    defaultConfig {
        minSdk = 27
        consumerProguardFiles("consumer-rules.pro")
    }

    androidResources {
        additionalParameters += listOf("--auto-add-overlay")
        ignoreAssetsPattern = "!.svn:!.git:.*:!CVS:!thumbs.db:!picasa.ini:!*.scc:*~"
    }

    packaging {
        jniLibs.useLegacyPackaging = true
        resources.excludes += setOf("META-INF/DEPENDENCIES", "META-INF/LICENSE", "META-INF/LICENSE.txt", "META-INF/NOTICE", "META-INF/NOTICE.txt", "META-INF/*.kotlin_module")
    }
}

dependencies {
    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar", "*.aar"))))

    implementation(project(":uts-firstui-uvue"))
    implementation(project(":uts-kux-mlkit-scancode"))
    implementation(project(":uts-kux-request"))
    implementation(project(":uts-kux-request-lite"))
    implementation(project(":uts-kux-request-interceptors"))
    implementation(project(":uts-uni-installApk"))
    implementation(project(":uts-unix-ui"))
    implementation(project(":uts-uts-openSchema"))
    implementation(project(":uts-z-paging-x"))

    implementation("androidx.core:core-ktx:1.10.1")
    implementation("androidx.recyclerview:recyclerview:1.3.2")
    implementation("androidx.appcompat:appcompat:1.0.0")
    implementation("androidx.exifinterface:exifinterface:1.3.6")
    implementation("androidx.localbroadcastmanager:localbroadcastmanager:1.0.0")
    implementation("androidx.constraintlayout:constraintlayout:2.1.4")
    implementation("androidx.webkit:webkit:1.6.0")
    implementation("com.google.android.material:material:1.4.0")
    implementation("androidx.viewpager2:viewpager2:1.1.0-beta02")
    implementation("com.alibaba:fastjson:1.2.83")
    implementation("com.facebook.fresco:fresco:3.4.0")
    implementation("com.facebook.fresco:middleware:3.4.0")
    implementation("com.facebook.fresco:animated-gif:3.4.0")
    implementation("com.facebook.fresco:webpsupport:3.4.0")
    implementation("com.facebook.fresco:animated-webp:3.4.0")
    implementation("com.caverock:androidsvg:1.4")
    implementation("com.github.bumptech.glide:glide:4.9.0")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-core:1.6.4")
    implementation("org.jetbrains.kotlinx:kotlinx-coroutines-android:1.6.4")
    implementation("org.jetbrains.kotlinx:kotlinx-serialization-json:1.4.1")
    implementation("com.squareup.okhttp3:okhttp:3.12.12")
    implementation("com.github.getActivity:XXPermissions:18.63")
    implementation("net.lingala.zip4j:zip4j:2.11.5")
}
