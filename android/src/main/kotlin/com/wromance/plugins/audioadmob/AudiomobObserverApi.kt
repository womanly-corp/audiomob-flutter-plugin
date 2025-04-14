package com.wromance.plugins.audioadmob

import com.audiomob.sdk.data.responses.AdAvailability
import com.audiomob.sdk.data.responses.AudioAd
import com.audiomob.sdk.enums.AdPlaybackResult
import com.audiomob.sdk.enums.AdRequestResult
import com.audiomob.sdk.enums.PauseAdEnum
import com.audiomob.sdk.interfaces.managers.IAudiomobCallback
import io.flutter.embedding.engine.plugins.FlutterPlugin
import com.wromance.plugins.audioadmob.AdAvailability as PluginAdAvailability
import com.wromance.plugins.audioadmob.AdPauseReason as PluginAdPauseReason
import com.wromance.plugins.audioadmob.AdPlaybackResult as PluginAdPlaybackResult
import com.wromance.plugins.audioadmob.AdRequestResult as PluginAdRequestResult
import com.wromance.plugins.audioadmob.AudioAd as PluginAudioAd

/**
 * Native-to-Flutter bridge implementation for AudioMob SDK callbacks.
 * 
 * This class serves as the callback handler for the AudioMob SDK events and forwards them to Flutter.
 * It implements [IAudiomobCallback] to receive SDK events and uses Pigeon-generated [AudiomobObserverApi]
 * to communicate these events back to Flutter.
 * 
 * Key responsibilities:
 * 1. Event Handling: Receives callbacks from AudioMob SDK about ad states and events
 * 2. Thread Management: Ensures callbacks are properly dispatched to Flutter on the main thread
 * 3. Type Conversion: Converts SDK types to Flutter-compatible types
 * 4. Error Handling: Provides safe handling of null values and type conversions
 * 
 * Threading behavior:
 * - Most SDK callbacks are received on the main thread
 * - [onAdAvailabilityRetrieved] is an exception that comes from a background thread
 * - Uses [AudiomobFlutterPlugin.launchOnMainThread] to ensure Flutter communication on main thread
 * 
 * Type mappings:
 * - SDK [AdAvailability] → Plugin [PluginAdAvailability]
 * - SDK [AudioAd] → Plugin [PluginAudioAd]
 * - SDK [AdPlaybackResult] → Plugin [PluginAdPlaybackResult]
 * - SDK [AdRequestResult] → Plugin [PluginAdRequestResult]
 * - SDK [PauseAdEnum] → Plugin [PluginAdPauseReason]
 * 
 * Usage:
 * ```kotlin
 * val observer = AudiomobObserverApiImpl(flutterBinding, plugin)
 * audiomobPlugin.setCallbacks(observer)
 * ```
 */
class AudiomobObserverApiImpl(binding: FlutterPlugin.FlutterPluginBinding, private val plugin: AudiomobFlutterPlugin) : IAudiomobCallback {
    private var observerApi: AudiomobObserverApi? = null

    /**
     * Initializes the observer with a Flutter binary messenger.
     * Creates the Pigeon-generated API instance for Flutter communication.
     */
    init {
        observerApi = AudiomobObserverApi(binding.binaryMessenger)
    }

    /**
     * Handles ad availability information from the SDK.
     * 
     * Note: This callback is received on a background thread, unlike other callbacks.
     * Uses [AudiomobFlutterPlugin.launchOnMainThread] to safely dispatch to Flutter.
     * 
     * @param result The ad availability information from the SDK
     */
    override fun onAdAvailabilityRetrieved(result: AdAvailability) {
        plugin.launchOnMainThread {
            val pluginAdAvailability = PluginAdAvailability(
                adsAvailable = result.adsAvailable == true,
                estimatedRevenue = result.estimatedRevenue?.toDouble() ?: 0.0,
                estimatedCpm = result.estimatedCpm?.toDouble() ?: 0.0,
                geo = result.geo ?: ""
            )
            observerApi?.onAdAvailabilityRetrieved(pluginAdAvailability) { /* Handle callback result if needed */ }
        }
    }
    
    override fun onAdPlaybackCompleted(adPlaybackResult: AdPlaybackResult) {
        val pluginResult = when (adPlaybackResult) {
            AdPlaybackResult.FINISHED -> PluginAdPlaybackResult.FINISHED
            AdPlaybackResult.STOPPED -> PluginAdPlaybackResult.STOPPED
            AdPlaybackResult.FAILED -> PluginAdPlaybackResult.FAILED
            AdPlaybackResult.CANCELED -> PluginAdPlaybackResult.CANCELED
            AdPlaybackResult.SKIPPED -> PluginAdPlaybackResult.SKIPPED
        }
        observerApi?.onAdPlaybackCompleted(pluginResult) { /* Handle callback result if needed */ }
    }

    override fun onAdPlaybackPaused(pauseReason: PauseAdEnum) {
        val pluginPauseReason = when (pauseReason) {
            PauseAdEnum.PhoneVolumeLowered -> PluginAdPauseReason.PHONE_VOLUME_LOWERED
            PauseAdEnum.PauseMethodCalled -> PluginAdPauseReason.PAUSE_METHOD_CALLED
            PauseAdEnum.AppInBackground -> PluginAdPauseReason.APP_IN_BACKGROUND
        }
        observerApi?.onAdPlaybackPaused(pluginPauseReason) { /* Handle callback result if needed */ }
    }

    override fun onAdPlaybackResumed() {
        observerApi?.onAdPlaybackResumed() { /* Handle callback result if needed */ }
    }

    override fun onAdPlaybackStarted(audioAd: AudioAd) {
        val pluginAudioAd = PluginAudioAd(
            id = audioAd.id,
            estimatedCpm = audioAd.estimatedCpm.toDouble(),
            estimatedRevenue = audioAd.estimatedRevenue.toDouble(),
            durationInSeconds = audioAd.duration.toLong()
        )
        observerApi?.onAdPlaybackStarted(pluginAudioAd) { /* Handle callback result if needed */ }
    }

    override fun onAdRequestCompleted(
        adRequestResult: AdRequestResult,
        audioAd: AudioAd?
    ) {
        val pluginResult = when (adRequestResult) {
            AdRequestResult.FINISHED -> PluginAdRequestResult.FINISHED
            AdRequestResult.NO_AD_AVAILABLE -> PluginAdRequestResult.NO_AD_AVAILABLE
            AdRequestResult.FREQUENCY_CAP_REACHED -> PluginAdRequestResult.FREQUENCY_CAP_REACHED
            AdRequestResult.FAILED -> PluginAdRequestResult.FAILED
            AdRequestResult.SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE -> 
                PluginAdRequestResult.SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE

            AdRequestResult.UNKNOWN -> PluginAdRequestResult.UNKNOWN
        }
        
        val pluginAudioAd = audioAd?.let {
            PluginAudioAd(
                id = it.id,
                estimatedCpm = it.estimatedCpm.toDouble(),
                estimatedRevenue = it.estimatedRevenue.toDouble(),
                durationInSeconds = it.duration.toLong()
            )
        }
        
        observerApi?.onAdRequestCompleted(pluginResult, pluginAudioAd) { /* Handle callback result if needed */ }
    }

    override fun onAdRequestStarted() {
        observerApi?.onAdRequestStarted() { /* Handle callback result if needed */ }
    }
}