import java.util.Properties

plugins {
    id("com.android.application")
    id("org.jetbrains.kotlin.android")
}

val keystorePropertiesFile = rootProject.file("keystore.properties")
val keystoreProperties = Properties().apply {
    if (keystorePropertiesFile.exists()) keystorePropertiesFile.inputStream().use { load(it) }
}

android {
    namespace = "com.topp.bakinginspection"
    compileSdk = 35
    buildToolsVersion = "35.0.0"

    defaultConfig {
        applicationId = "com.topp.bakinginspection"
        minSdk = 27
        targetSdk = 35
        versionCode = 100000019
        versionName = "1.0.19"
        vectorDrawables.useSupportLibrary = true
    }

    signingConfigs {
        create("release") {
            if (keystorePropertiesFile.exists()) {
                storeFile = file(keystoreProperties.getProperty("storeFile"))
                storePassword = keystoreProperties.getProperty("storePassword")
                keyAlias = keystoreProperties.getProperty("keyAlias")
                keyPassword = keystoreProperties.getProperty("keyPassword")
            }
        }
    }

    buildTypes {
        debug { isMinifyEnabled = false }
        release {
            isMinifyEnabled = false
            isShrinkResources = false
            signingConfig = if (keystorePropertiesFile.exists()) signingConfigs.getByName("release") else signingConfigs.getByName("debug")
            proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
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
    implementation(project(":uniappx"))
    implementation(project(":uts-firstui-uvue"))
    implementation(project(":uts-kux-mlkit-scancode"))
    implementation(project(":uts-kux-request"))
    implementation(project(":uts-kux-request-lite"))
    implementation(project(":uts-kux-request-interceptors"))
    implementation(project(":uts-uni-installApk"))
    implementation(project(":uts-unix-ui"))
    implementation(project(":uts-uts-openSchema"))
    implementation(project(":uts-z-paging-x"))

    implementation(fileTree(mapOf("dir" to "libs", "include" to listOf("*.jar", "*.aar"))))
    implementation(fileTree(mapOf("dir" to "../uniappx/libs", "include" to listOf("*.jar", "*.aar"))))
}
