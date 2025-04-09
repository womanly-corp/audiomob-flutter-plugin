package com.wromance.audiomob


class AudiomobHostApiImplementation : AudiomobHostApi {

    override fun initialise(
        apiKey: String,
        bundleId: String,
        backgroundModeEnabled: Boolean?
    ) {
        TODO("Not yet implemented")
    }

    override fun requestAndPlayAd() {
        TODO("Not yet implemented")
    }

    override fun pauseLifeCycle() {
        TODO("Not yet implemented")
    }

    override fun resumeLifeCycle() {
        TODO("Not yet implemented")
    }

    override fun release() {
        TODO("Not yet implemented")
    }

    override fun getAdAvailability(placement: com.wromance.audiomob.Placement) {
        TODO("Not yet implemented")
    }

    override fun pauseAd() {
        TODO("Not yet implemented")
    }

    override fun resumePausedAd() {
        TODO("Not yet implemented")
    }

    override fun stopAd() {
        TODO("Not yet implemented")
    }

    override fun hasAdBegunPlaying(): Boolean {
        TODO("Not yet implemented")
    }

    override fun isAdPaused(): Boolean {
        TODO("Not yet implemented")
    }

    override fun getTimeRemaining(): Double {
        TODO("Not yet implemented")
    }

    override fun setForceTestAds(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun setSendGeoLocation(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun setSendAdvertisingId(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun setSendAndroidIdAsAFallback(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun setDoNotSendAnyDeviceIdsForNonConsentedUsers(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun setSendConsentStrings(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }

    override fun setOnlySendContextualSignals(
        enabled: Boolean,
        callback: (kotlin.Result<Unit>) -> Unit
    ) {
        TODO("Not yet implemented")
    }
}
