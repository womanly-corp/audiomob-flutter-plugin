package com.wromance.audiomob

import android.util.Log
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import com.audiomob.sdk.AudiomobPlugin
import com.audiomob.sdk.data.responses.AdAvailability
import com.audiomob.sdk.data.responses.AudioAd
import com.audiomob.sdk.enums.AdPlaybackResult
import com.audiomob.sdk.enums.AdRequestResult
import com.audiomob.sdk.enums.PauseAdEnum
import com.audiomob.sdk.interfaces.managers.IAudiomobCallback
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class AudiomobFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    DefaultLifecycleObserver {
    private lateinit var audiomobPlugin: AudiomobPlugin
    private lateinit var channel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private val audiomobListener = AudiomobPluginListener()
    private var lifecycle: Lifecycle? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audiomob")
        channel.setMethodCallHandler(this)


        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "audiomob/events")
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                audiomobListener.eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                audiomobListener.eventSink = null
            }
        })

        audiomobPlugin = AudiomobPlugin(flutterPluginBinding.applicationContext)
        // TODO HARDCODE
        // TODO check bundle id
        audiomobPlugin.initialise("YG3pZ95T7Wk9ZBj0EB9M", "com.wromance.mobile.ads", true)
        audiomobPlugin.setCallbacks(audiomobListener)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        audiomobPlugin.release()
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "requestAndPlay") {
            audiomobPlugin.requestAndPlayAd()
            result.success(null)
        } else if (call.method == "pause") {
            if (audiomobListener.audioAd != null)
                audiomobPlugin.pauseAd()
            result.success(null)
        } else if (call.method == "resume") {
            if (audiomobListener.audioAd != null)
                audiomobPlugin.resumePausedAd()
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    //// ActivityAware implementation
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        lifecycle = (binding.lifecycle as HiddenLifecycleReference).lifecycle
        lifecycle?.addObserver(this)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        lifecycle = (binding.lifecycle as HiddenLifecycleReference).lifecycle
        lifecycle?.addObserver(this)
    }

    override fun onDetachedFromActivity() {
        lifecycle?.removeObserver(this)
        lifecycle = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        lifecycle?.removeObserver(this)
        lifecycle = null
    }

    //// Application lifecycle observer

    override fun onStop(owner: LifecycleOwner) {
        super.onStop(owner)
        audiomobPlugin.pauseLifeCycle()
    }

    override fun onStart(owner: LifecycleOwner) {
        super.onStart(owner)
        audiomobPlugin.resumeLifeCycle()
    }
}

class AudiomobPluginListener: IAudiomobCallback {
    var eventSink: EventChannel.EventSink? = null
    var audioAd: AudioAd? = null

    override fun onAdAvailabilityRetrieved(result: AdAvailability) {
        eventSink?.success(mapOf("type" to "onAdAvailabilityRetrieved", "result" to result.toMap()))
        Log.d("Audiomob", "Ads are available: " + result.toMap())
    }

    override fun onAdRequestStarted() {
        eventSink?.success(mapOf("type" to "onAdRequestStarted"))
        Log.d("Audiomob", "onAdRequestStarted")
    }

    override fun onAdRequestCompleted(adRequestResult: AdRequestResult, audioAd: AudioAd?) {
        this.audioAd = audioAd
        eventSink?.success(
            mapOf(
                "type" to "onAdRequestCompleted",
                "adRequestResult" to adRequestResult.name,
                "audioAd" to audioAd?.toMap()
            )
        )
        Log.d("Audiomob", "onAdRequestCompleted: $adRequestResult, $audioAd")
    }

    override fun onAdPlaybackStarted(audioAd: AudioAd) {
        this.audioAd = audioAd
        eventSink?.success(mapOf("type" to "onAdPlaybackStarted", "audioAd" to audioAd.toMap()))
        Log.d("Audiomob", "onAdPlaybackStarted: $audioAd")
        // Playback of the ad has begun, use the callback to mute your app's sound.
    }

    override fun onAdPlaybackCompleted(adPlaybackResult: AdPlaybackResult) {
        this.audioAd = null
        eventSink?.success(
            mapOf(
                "type" to "onAdPlaybackCompleted",
                "adPlaybackResult" to adPlaybackResult.name
            )
        )
        Log.d("Audiomob", "onAdPlaybackCompleted: $adPlaybackResult")
    }

    override fun onAdPlaybackPaused(pauseReason: PauseAdEnum) {
        eventSink?.success(mapOf("type" to "onAdPlaybackPaused", "pauseReason" to pauseReason.name))
        Log.d("Audiomob", "onAdPlaybackPaused: $pauseReason")

    }

    override fun onAdPlaybackResumed() {
        eventSink?.success(mapOf("type" to "onAdPlaybackResumed"))
        Log.d("Audiomob", "onAdPlaybackResumed")

    }
}
