package com.sebastianloose.rotary_list

import android.content.Context
import android.view.MotionEvent
import android.view.ViewConfiguration
import androidx.annotation.NonNull
import androidx.core.view.InputDeviceCompat
import androidx.core.view.MotionEventCompat
import androidx.core.view.ViewConfigurationCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import kotlin.math.roundToInt

/** RotaryListPlugin */
class RotaryListPlugin : FlutterPlugin, MethodCallHandler, ActivityAware {
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "rotary_list")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        setMotionListener(binding.activity as FlutterActivity)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        setMotionListener(binding.activity as FlutterActivity)
    }

    override fun onDetachedFromActivityForConfigChanges() {}

    override fun onDetachedFromActivity() {}

    private fun setMotionListener(activity: FlutterActivity) {
        activity.window?.decorView?.rootView?.setOnGenericMotionListener { _, motionEvent ->
            motionListener(
                motionEvent,
                activity.context
            )
        }
    }

    private fun motionListener(event: MotionEvent?, context: Context): Boolean {
        if (event != null && event.action == MotionEvent.ACTION_SCROLL && event.isFromSource(
                InputDeviceCompat.SOURCE_ROTARY_ENCODER
            )
        ) {
            val delta = -event.getAxisValue(MotionEventCompat.AXIS_SCROLL) *
                    ViewConfigurationCompat.getScaledVerticalScrollFactor(
                        ViewConfiguration.get(context), context
                    )
            channel.invokeMethod("rotaryEvent", delta.roundToInt().toString())
        }
        return false
    }
}