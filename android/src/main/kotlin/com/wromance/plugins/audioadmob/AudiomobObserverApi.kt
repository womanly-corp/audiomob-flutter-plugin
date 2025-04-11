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

class AudiomobObserverApiImpl(binding: FlutterPlugin.FlutterPluginBinding, private val plugin: AudiomobFlutterPlugin) : IAudiomobCallback {
    private var observerApi: AudiomobObserverApi? = null

    init {
        observerApi = AudiomobObserverApi(binding.binaryMessenger)
    }

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
            duration = audioAd.duration.toDouble()
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
                duration = it.duration.toDouble()
            )
        }
        
        observerApi?.onAdRequestCompleted(pluginResult, pluginAudioAd) { /* Handle callback result if needed */ }
    }

    override fun onAdRequestStarted() {
        observerApi?.onAdRequestStarted() { /* Handle callback result if needed */ }
    }
}