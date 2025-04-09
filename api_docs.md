# API Reference

This document details the API Reference of the Audiomob Android SDK.

## AudiomobPlugin: class

### Methods

- **initialise(apiKey: String, bundleId: String, backgroundModeEnabled: Boolean?)**
  - Initializes the Audiomob Android SDK.
- **requestAndPlayAd(adConfiguration: AdConfiguration)**
  - Requests a non-background audio ad and begins playback.
  - Accepted `AdConfiguration` types:
    - `RewardedBannerAdConfiguration`
    - `RewardedAudioOnlyAdConfiguration`
    - `SkippableBannerAdConfiguration`
    - `SkippableAudioOnlyAdConfiguration`
- **requestAndPlayAd()**
  - Requests a background audio ad and begins playback.
- **pauseLifeCycle()**
  - Pauses the SDK's lifecycle (non-background ads only). Call when the app goes into the background.
- **resumeLifeCycle()**
  - Resumes the SDK's lifecycle (non-background ads only). Call when the app comes into the foreground.
- **release()**
  - Releases resources used by Audiomob. Call when the context is destroyed.
- **setCallbacks(observer: IAudiomobCallback)**
  - Subscribes the given observer to Audiomob's callbacks.
- **removeCallbacks(observer: IAudiomobCallback)**
  - Unsubscribes the given observer from Audiomob's callbacks.
- **getAdAvailability(placement: Placement)**
  - Asynchronously gets ad availability information. Use `Placement.REWARDED` for background mode ads.
- **pauseAd()**
  - Pauses the playing audio ad.
- **resumePausedAd()**
  - Resumes the paused audio ad.
- **stopAd()**
  - Stops the audio ad playback.
- **hasAdBegunPlaying(): Boolean**
  - Returns `true` if the ad playback is in progress.
- **isAdPaused(): Boolean**
  - Returns `true` if the ad is paused.
- **getTimeRemaining(): Float**
  - Returns the seconds remaining for the currently playing ad.

### Properties

- **forceTestAds: Boolean**
  - If `true`, the server returns test ads even if live ads are enabled.
- **sendGeoLocation: Boolean**
  - If `true` and permission is granted, sends the user's latitude and longitude in the ad request.
- **sendAdvertisingId: Boolean**
  - Sets whether to send the user's Android Advertising ID with the ad request.
- **sendAndroidIdAsAFallback: Boolean**
  - Sets whether to send the Android ID as a fallback if the Advertising ID is unavailable.
- **doNotSendAnyDeviceIdsForNonConsentedUsers: Boolean**
  - If `true`, no device ID is sent if the Advertising ID is unavailable.
- **sendConsentStrings: Boolean**
  - Sets whether to send consent strings set by a Consent Management Platform or in SharedPreferences.
- **onlySendContextualSignals: Boolean**
  - Sets whether to only send contextual signals in the ad request.

## AdRequestResult: enum

- **FINISHED**
  - The audio ad request completed successfully. An audio ad is ready to play.
- **NO_AD_AVAILABLE**
  - No ad was found for this user.
- **FREQUENCY_CAP_REACHED**
  - The user has reached the maximum number of ads for this session.
- **FAILED**
  - The audio ad request failed due to an error.
- **SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE**
  - The skippable ad was not requested because the device volume is not audible.

## AdPlaybackResult: enum

- **FINISHED**
  - The audio ad playback has finished. The user can now be given a reward.
- **STOPPED**
  - The audio ad was stopped by the `stopAd` function.
- **FAILED**
  - The audio ad playback failed due to an error.
- **CANCELED**
  - The ad was canceled by the user before it started.
- **SKIPPED**
  - The audio ad playback was skipped by the user.

## IAudiomobCallback: interface

### Methods

- **onAdRequestStarted()**
  - The audio ad request has started.
- **onAdRequestCompleted(AdRequestResult adRequestResult, AudioAd result)**
  - The audio ad request completed. An audio ad is ready to play.
- **onAdPlaybackStarted(AudioAd result)**
  - The audio ad playback has started.
- **onAdPlaybackCompleted(AdPlaybackResult adPlaybackResult)**
  - The audio ad playback has finished. The `AdPlaybackResult` enum value indicates the status (Finished, Skipped, Failed, Stopped).
- **onAdPlaybackPaused(PauseAdEnum pauseReason)**
  - The audio ad playback is paused. Reasons include:
    - App is in the background
    - Device volume is below the required threshold
    - User has paused the ad playback
    - Audio focus is released
- **onAdPlaybackResumed()**
  - Audio ad playback is resumed. Conditions include:
    - App is in the foreground
    - Device volume is increased
    - User has resumed the app
- **onAdAvailabilityRetrieved(ADAvailability result)**
  - The ad availability request completed and has Ad Availability object.

## AdAvailability: class

### Properties

- **adsAvailable: Boolean?**
  - An estimation of whether or not you will receive ads in this region.
- **estimatedRevenue: Float?**
  - Estimated revenue for an ad (if an impression is detected).
- **estimatedCpm: Float?**
  - Estimated Cost Per Thousand Impressions for an ad (if an impression is detected).
- **geo: String?**
  - The ISO 3166 alpha-2 country code of the region the user is in.

## RewardedBannerAdConfiguration: class

### Properties

- **banner: BannerConfiguration**
  - This class which has banner size and placeholder.
- **unmutePrompt: UnmutePromptConfiguration**
  - This class has unmute prompt view, text , raise volume button/view and stop Ad Button/View.
- **countdownConfiguration: CountdownConfiguration**
  - This class has count down timer text and filler progress bar.

## RewardedAudioOnlyAdConfiguration: class

### Properties

- **unmutePrompt: UnmutePromptConfiguration**
  - This class has unmute prompt view, text, raise volume button/view and stop Ad Button/View.
- **countdownConfiguration: CountdownConfiguration**
  - This class has count down timer text and filler progress bar.
- **adPlayingNotice: View**
  - A View which is displayed instead of banner when Audio Only Ad plays.

## SkippableBannerAdConfiguration: class

### Properties

- **banner: BannerConfiguration**
  - This class which has banner size and placeholder.
- **countdownConfiguration: CountdownConfiguration**
  - This class has count down timer text and filler progress bar.
- **skipButton: View**
  - A View to display skip icon.

## SkippableAudioOnlyAdConfiguration: class

### Properties

- **countdownConfiguration: CountdownConfiguration**
  - This class has count down timer text and filler progress bar.
- **skipButton: View**
  - A View to display skip icon.
- **adPlayingNotice: View**
  - A View which is displayed instead of banner when Audio Only Ad plays.

## UnmutePromptConfiguration: class

### Properties

- **unmutePrompt: View**
  - A View or Layout which holds all the view of UnmutePromptConfiguration class.
- **promptText: TextView**
  - TextView to display unmute text.
- **raiseVolumeButton: View**
  - A Button/View to raise volume.
- **stopAdButton: View**
  - A Button/View to stop the Ad.

## BannerConfiguration: class

### Properties

- **bannerSize: BannerSize**
  - Enum which has Banner Size for Rectangle and LeaderBoard banners.
- **bannerImage: ShapeableImageView**
  - A place holder for banners.

## AudioAd: class

### Properties

- **id: String**
  - The unique id of this audio ad.
- **estimatedCpm: Float**
  - Estimated Cost Per Thousand Impressions for this ad (if an impression is detected).
- **estimatedRevenue: Float**
  - Estimated revenue for an ad (if an impression is detected).
- **duration: Float**
  - The duration of the ad.
- **companionBanner: CompanionBanner?**
  - The companion banner for this audio ad, if one was requested.

## CompanionBanner: interface

### Properties

- **bannerSize: BannerSize?**
  - The size of the companion banner.
- **image: Bitmap?**
  - The bitmap graphic of the companion banner.
