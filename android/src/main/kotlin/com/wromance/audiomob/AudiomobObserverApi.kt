package com.wromance.audiomob

import com.audiomob.sdk.data.responses.AdAvailability
import com.audiomob.sdk.data.responses.AudioAd
import com.audiomob.sdk.enums.AdPlaybackResult
import com.audiomob.sdk.enums.AdRequestResult
import com.audiomob.sdk.enums.PauseAdEnum
import com.audiomob.sdk.interfaces.managers.IAudiomobCallback
import io.flutter.embedding.engine.plugins.FlutterPlugin
import com.wromance.audiomob.AdAvailability as PluginAdAvailability

class AudiomobObserverApiImpl(binding: FlutterPlugin.FlutterPluginBinding) : IAudiomobCallback {
    var observerApi: AudiomobObserverApi? = null

    init {
        observerApi = AudiomobObserverApi(binding.binaryMessenger)
    }

    override fun onAdAvailabilityRetrieved(result: AdAvailability) {
        observerApi!!.onAdAvailabilityRetrieved(PluginAdAvailability.fromList());
    }

    override fun onAdPlaybackCompleted(adPlaybackResult: AdPlaybackResult) {
        TODO("Not yet implemented")
    }

    override fun onAdPlaybackPaused(pauseReason: PauseAdEnum) {
        TODO("Not yet implemented")
    }

    override fun onAdPlaybackResumed() {
        TODO("Not yet implemented")
    }

    override fun onAdPlaybackStarted(audioAd: AudioAd) {
        TODO("Not yet implemented")
    }

    override fun onAdRequestCompleted(
        adRequestResult: AdRequestResult,
        audioAd: AudioAd?
    ) {
        TODO("Not yet implemented")
    }

    override fun onAdRequestStarted() {
        TODO("Not yet implemented")
    }
}