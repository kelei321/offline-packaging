pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
    }
}

dependencyResolutionManagement {
    repositoriesMode.set(RepositoriesMode.FAIL_ON_PROJECT_REPOS)
    repositories {
        google()
        mavenCentral()
        maven { url = uri("https://jitpack.io") }
        flatDir { dirs("app/libs") }
        flatDir { dirs("uniappx/libs") }
        flatDir { dirs("plugins") }
    }
}

rootProject.name = "BakingInspectionOffline"
include(":app")
include(":uniappx")
include(":uts-firstui-uvue")
include(":uts-kux-mlkit-scancode")
include(":uts-kux-request")
include(":uts-kux-request-lite")
include(":uts-kux-request-interceptors")
include(":uts-uni-installApk")
include(":uts-unix-ui")
include(":uts-uts-openSchema")
include(":uts-z-paging-x")
