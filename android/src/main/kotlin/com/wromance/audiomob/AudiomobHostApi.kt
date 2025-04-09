package com.wromance.audiomob

import android.content.Context
import com.audiomob.sdk.AudiomobPlugin
import com.audiomob.sdk.enums.Placement as SdkPlacement
import io.flutter.embedding.engine.plugins.FlutterPlugin

class AudiomobHostApiImplementation(
    private val audiomobPlugin: AudiomobPlugin
) : AudiomobHostApi {
    override fun initialize(
        apiKey: String,
        bundleId: String,
        backgroundModeEnabled: Boolean,
    ) {
        try {
            audiomobPlugin.initialise(apiKey, bundleId, backgroundModeEnabled)
        } catch (e: Exception) {
            throw FlutterError("initialization_error", "Failed to initialize AudioMob: ${e.message}", e.cause)
        }
    }

    override fun requestAndPlayAd() {
        try {
            audiomobPlugin.requestAndPlayAd()
        } catch (e: Exception) {
            throw FlutterError("request_play_error", "Failed to request and play ad: ${e.message}", e.cause)
        }
    }

    override fun pauseLifeCycle() {
        try {
            audiomobPlugin.pauseLifeCycle()
        } catch (e: Exception) {
            throw FlutterError("pause_lifecycle_error", "Failed to pause lifecycle: ${e.message}", e.cause)
        }
    }

    override fun resumeLifeCycle() {
        try {
            audiomobPlugin.resumeLifeCycle()
        } catch (e: Exception) {
            throw FlutterError("resume_lifecycle_error", "Failed to resume lifecycle: ${e.message}", e.cause)
        }
    }

    override fun release() {
        try {
            audiomobPlugin.release()
        } catch (e: Exception) {
            throw FlutterError("release_error", "Failed to release resources: ${e.message}", e.cause)
        }
    }

    override fun getAdAvailability(placement: Placement) {
        try {
            val sdkPlacement = when (placement) {
                Placement.REWARDED -> SdkPlacement.REWARDED
                Placement.SKIPPABLE -> SdkPlacement.SKIPPABLE
            }
            audiomobPlugin.getAdAvailability(sdkPlacement)
        } catch (e: Exception) {
            throw FlutterError("ad_availability_error", "Failed to get ad availability: ${e.message}", e.cause)
        }
    }

    override fun pauseAd() {
        try {
            audiomobPlugin.pauseAd()
        } catch (e: Exception) {
            throw FlutterError("pause_ad_error", "Failed to pause ad: ${e.message}", e.cause)
        }
    }

    override fun resumePausedAd() {
        try {
            audiomobPlugin.resumePausedAd()
        } catch (e: Exception) {
            throw FlutterError("resume_ad_error", "Failed to resume paused ad: ${e.message}", e.cause)
        }
    }

    override fun stopAd() {
        try {
            audiomobPlugin.stopAd()
        } catch (e: Exception) {
            throw FlutterError("stop_ad_error", "Failed to stop ad: ${e.message}", e.cause)
        }
    }

    override fun hasAdBegunPlaying(): Boolean {
        return try {
            audiomobPlugin.hasAdBegunPlaying()
        } catch (e: Exception) {
            false // Return false as a safe default
        }
    }

    override fun isAdPaused(): Boolean {
        return try {
            audiomobPlugin.isAdPaused()
        } catch (e: Exception) {
            true // Return true as a safe default
        }
    }

    override fun getTimeRemaining(): Double {
        return try {
            audiomobPlugin.getTimeRemaining().toDouble()
        } catch (e: Exception) {
            0.0 // Return 0.0 as a safe default
        }
    }

    override fun setForceTestAds(enabled: Boolean) {
        try {
            audiomobPlugin.forceTestAds = enabled
        } catch (e: Exception) {
            throw FlutterError("force_test_ads_error", "Failed to set force test ads: ${e.message}", e.cause)
        }
    }

    override fun setSendGeoLocation(enabled: Boolean) {
        try {
            audiomobPlugin.sendGeoLocation = enabled
        } catch (e: Exception) {
            throw FlutterError("geo_location_error", "Failed to set geo location: ${e.message}", e.cause)
        }
    }

    override fun setSendAdvertisingId(enabled: Boolean) {
        try {
            audiomobPlugin.sendAdvertisingId = enabled
        } catch (e: Exception) {
            throw FlutterError("advertising_id_error", "Failed to set advertising ID: ${e.message}", e.cause)
        }
    }

    override fun setSendAndroidIdAsAFallback(enabled: Boolean) {
        try {
            audiomobPlugin.sendAndroidIdAsAFallback = enabled
        } catch (e: Exception) {
            throw FlutterError("android_id_fallback_error", "Failed to set Android ID fallback: ${e.message}", e.cause)
        }
    }

    override fun setDoNotSendAnyDeviceIdsForNonConsentedUsers(enabled: Boolean) {
        try {
            audiomobPlugin.doNotSendAnyDeviceIdsForNonConsentedUsers = enabled
        } catch (e: Exception) {
            throw FlutterError("device_ids_consent_error", "Failed to set device IDs consent setting: ${e.message}", e.cause)
        }
    }

    override fun setSendConsentStrings(enabled: Boolean) {
        try {
            audiomobPlugin.sendConsentStrings = enabled
        } catch (e: Exception) {
            throw FlutterError("consent_strings_error", "Failed to set consent strings: ${e.message}", e.cause)
        }
    }

    override fun setOnlySendContextualSignals(enabled: Boolean) {
        try {
            audiomobPlugin.onlySendContextualSignals = enabled
        } catch (e: Exception) {
            throw FlutterError("contextual_signals_error", "Failed to set contextual signals: ${e.message}", e.cause)
        }
    }
}
