buildscript {
    repositories {
        google()
        mavenCentral()
        flatDir { dirs("plugins") }
    }
    dependencies {
        classpath(files("plugins/uts-kotlin-compiler-plugin-0.0.1.jar"))
        classpath(files("plugins/uts-kotlin-gradle-plugin-0.0.1.jar"))
    }
}

plugins {
    id("com.android.application") version "8.7.3" apply false
    id("com.android.library") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "1.9.10" apply false
}
