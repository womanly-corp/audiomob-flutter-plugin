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
import com.audiomob.sdk.enums.Placement
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
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch

class AudiomobFlutterPlugin : FlutterPlugin, ActivityAware,
    DefaultLifecycleObserver {
    private lateinit var audiomobPlugin: AudiomobPlugin
    private lateinit var audiomobObserver: IAudiomobCallback
    private lateinit var audiomobHostApi: AudiomobHostApi
    private var lifecycle: Lifecycle? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        audiomobPlugin = AudiomobPlugin(flutterPluginBinding.applicationContext)
        audiomobObserver = AudiomobObserverApiImpl(flutterPluginBinding)
        audiomobHostApi = AudiomobHostApiImplementation(audiomobPlugin)
        AudiomobHostApi.setUp(flutterPluginBinding.binaryMessenger, audiomobHostApi)
        audiomobPlugin.setCallbacks(audiomobObserver)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        audiomobPlugin.release()
        AudiomobHostApi.setUp(binding.binaryMessenger, null)
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
        // TODO: move to dart side
        audiomobPlugin.pauseLifeCycle()
    }

    override fun onStart(owner: LifecycleOwner) {
        super.onStart(owner)
        // TODO: move to dart side
        audiomobPlugin.resumeLifeCycle()
    }
}


//class AudiomobPluginListener : IAudiomobCallback {
//    var eventSink: EventChannel.EventSink? = null
//    var audioAd: AudioAd? = null
//
//    override fun onAdAvailabilityRetrieved(result: AdAvailability) {
//        // for some reason that event is exceptional: it is called from some not-main thread
//        // please fill issue for that case
//        GlobalScope.launch(Dispatchers.Main) {
//            eventSink?.success(
//                mapOf(
//                    "type" to "onAdAvailabilityRetrieved",
//                    "result" to result.toMap()
//                )
//            )
//        }
//        Log.d("Audiomob", "Ads are available: " + result.toMap())
//    }
//
//}
