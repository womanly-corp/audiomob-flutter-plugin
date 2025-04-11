package com.wromance.plugins.audioadmob

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
import kotlinx.coroutines.GlobalScope
import kotlinx.coroutines.launch
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.cancel
import kotlinx.coroutines.launch

class AudiomobFlutterPlugin : FlutterPlugin, ActivityAware,
    DefaultLifecycleObserver {
    private lateinit var audiomobPlugin: AudiomobPlugin
    private lateinit var audiomobObserver: IAudiomobCallback
    private lateinit var audiomobHostApi: AudiomobHostApi
    private var lifecycle: Lifecycle? = null

    /**
     * A coroutine scope tied to the Activity lifecycle for managing background-to-UI thread communication.
     * 
     * This scope is used to:
     * 1. Safely dispatch callbacks from Audiomob SDK (background thread) to Flutter (main thread)
     * 2. Automatically cancel ongoing coroutines when the Activity is destroyed
     * 3. Prevent memory leaks by properly cleaning up when the plugin is detached
     * 
     * The scope is reassigned during Activity configuration changes to maintain proper lifecycle management.
     */
    private var pluginScope: CoroutineScope? = null

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        audiomobPlugin = AudiomobPlugin(flutterPluginBinding.applicationContext)
        audiomobObserver = AudiomobObserverApiImpl(flutterPluginBinding, this)
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
        lifecycle?.removeObserver(this)
        lifecycle?.addObserver(this)
        pluginScope?.cancel()
        pluginScope = CoroutineScope(SupervisorJob() + Dispatchers.Main.immediate)
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        onAttachedToActivity(binding)
    }

    override fun onDetachedFromActivity() {
        lifecycle?.removeObserver(this)
        lifecycle = null
        pluginScope?.cancel()
        pluginScope = null
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

    fun launchOnMainThread(block: suspend CoroutineScope.() -> Unit) {
        pluginScope?.launch(block = block) ?: run {
            Log.e("AudiomobFlutterPlugin", "pluginScope is null. Cannot launch coroutine.")
        }
    }
}