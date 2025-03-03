package com.wromance.audiomob

import android.util.Log
import com.audiomob.sdk.data.responses.AdAvailability
import com.audiomob.sdk.data.responses.AudioAd
import com.audiomob.sdk.enums.AdPlaybackResult
import com.audiomob.sdk.enums.AdRequestResult
import com.audiomob.sdk.enums.PauseAdEnum
import com.audiomob.sdk.interfaces.managers.IAudiomobCallback
import io.flutter.plugin.common.EventChannel

class AudiomobPluginListener: IAudiomobCallback {
    var eventSink: EventChannel.EventSink? = null
    var audioAd: AudioAd? = null

    override fun onAdAvailabilityRetrieved(result: AdAvailability) {
        eventSink?.success(mapOf("type" to "onAdAvailabilityRetrieved", "result" to result.toMap()))
        Log.d("Audiomob Demo Project", "Ads are available: " + result.toMap())
    }

    override fun onAdRequestStarted() {
        eventSink?.success(mapOf("type" to "onAdRequestStarted"))
        Log.d("Audiomob Demo Project", "onAdRequestStarted")
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
        Log.d("Audiomob Demo Project", "onAdRequestCompleted: $adRequestResult, $audioAd")
        if (adRequestResult != AdRequestResult.FINISHED) {
            // The ad request was not successful.
        }
    }

    override fun onAdPlaybackStarted(audioAd: AudioAd) {
        this.audioAd = audioAd
        printViewHierarchy(BannerManager.getRoot()!!)
        eventSink?.success(mapOf("type" to "onAdPlaybackStarted", "audioAd" to audioAd.toMap()))
        Log.d("Audiomob Demo Project", "onAdPlaybackStarted: $audioAd")
        // Playback of the ad has begun, use the callback to mute your app's sound.
    }

    override fun onAdPlaybackCompleted(adPlaybackResult: AdPlaybackResult) {
        this.audioAd = null
        printViewHierarchy(BannerManager.getRoot()!!)
        eventSink?.success(
            mapOf(
                "type" to "onAdPlaybackCompleted",
                "adPlaybackResult" to adPlaybackResult.name
            )
        )
        Log.d("Audiomob Demo Project", "onAdPlaybackCompleted: $adPlaybackResult")
        // Playback has completed, use this callback to unmute your app's sound.
        if (adPlaybackResult == AdPlaybackResult.FINISHED) {
            // The ad completed, reward your user here.
        }
    }

    override fun onAdPlaybackPaused(pauseReason: PauseAdEnum) {
        eventSink?.success(mapOf("type" to "onAdPlaybackPaused", "pauseReason" to pauseReason.name))
        Log.d("Audiomob Demo Project", "onAdPlaybackPaused: $pauseReason")

    }

    override fun onAdPlaybackResumed() {
        eventSink?.success(mapOf("type" to "onAdPlaybackResumed"))
        Log.d("Audiomob Demo Project", "onAdPlaybackResumed")

    }
}