package com.topp.bakinginspection

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.widget.TextView

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        if (tryStartDCloudEntry()) {
            finish()
            return
        }
        setContentView(TextView(this).apply {
            text = "烘烤检验离线打包工程已生成。\n\n请先把 HBuilderX 4.76 对应的官方离线 SDK 放入 app/libs，并把本地打包资源复制到 assets/apps/__UNI__BB37161/www。\n\n如果导入 SDK 后仍停留在此页，请按官方 SDK 示例工程调整 AndroidManifest 入口类。"
            textSize = 16f
            setPadding(48, 96, 48, 48)
        })
    }

    private fun tryStartDCloudEntry(): Boolean {
        val candidates = listOf("io.dcloud.PandoraEntry", "io.dcloud.PandoraEntryActivity", "io.dcloud.uniapp.UniAppActivity", "io.dcloud.uniapp.UniAppXActivity")
        for (className in candidates) {
            try {
                val clazz = Class.forName(className)
                if (!Activity::class.java.isAssignableFrom(clazz)) continue
                @Suppress("UNCHECKED_CAST")
                startActivity(Intent(this, clazz as Class<out Activity>))
                return true
            } catch (_: Throwable) {
            }
        }
        return false
    }
}
