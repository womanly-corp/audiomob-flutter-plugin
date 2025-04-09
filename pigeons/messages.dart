// ignore_for_file: constant_identifier_names, avoid_positional_boolean_parameters, lines_longer_than_80_chars

import 'package:pigeon/pigeon.dart';

@ConfigurePigeon(
  PigeonOptions(
    dartOut: 'lib/src/android/messages.g.dart',
    kotlinOut: 'android/src/main/kotlin/com/wromance/audiomob/Messages.kt',
    kotlinOptions: KotlinOptions(package: 'com.wromance.audiomob'),
    copyrightHeader: 'pigeons/copyright.txt',
  ),
)
/// Results of an audio ad request
enum AdRequestResult {
  /// The audio ad request completed as an audio ad is ready to play
  finished,

  /// There was no ad found for this user
  noAdAvailable,

  /// The user has reached the maximum number of ads for this session
  frequencyCapReached,

  /// The audio ad request failed due to an error
  failed,

  /// The skippble ad was not requested as the device volume is not audible
  skippableRequestVolumeNotAudible,

  /// Unknown result
  unknown,
}

enum AdPauseReason {
  /// The user has lowered the phone volume
  phoneVolumeLowered,

  /// The user has called the pause method
  pauseMethodCalled,

  /// The app is in the background
  appInBackground,
}

/// Results of an audio ad playback
enum AdPlaybackResult {
  /// The audio ad playback has finished (the user can now be given a reward)
  finished,

  /// The audio ad was stopped by the 'stopAd' function
  stopped,

  /// The audio ad playback failed due to an error
  failed,

  /// The ad was canceled by the user before it started
  canceled,

  /// The audio ad playback was skipped by the user
  skipped,
}

/// Information about ad availability
class AdAvailability {
  const AdAvailability({
    this.adsAvailable = false,
    this.estimatedRevenue = 0,
    this.estimatedCpm = 0,
    this.geo = '',
  });

  /// An estimation of whether or not you will receive ads in this region
  final bool adsAvailable;

  /// Estimated revenue for an ad (if an impression is detected)
  final double estimatedRevenue;

  /// Estimated Cost Per Thousand Impressions for an ad (if an impression is detected)
  final double estimatedCpm;

  /// The ISO 3166 alpha-2 country code of the region the user is in
  final String geo;
}

enum Placement { rewarded, skippable }

enum BannerSize { noBanner, mediumRectangle, mobileLeaderboard }

/// Information about an audio ad
class AudioAd {
  const AudioAd({
    this.id = '',
    this.estimatedCpm = 0,
    this.estimatedRevenue = 0,
    this.duration = 0,
  });

  /// The unique id of this audio ad
  final String id;

  /// Estimated Cost Per Thousand Impressions for this ad (if an impression is detected)
  final double estimatedCpm;

  /// Estimated revenue for an ad (if an impression is detected)
  final double estimatedRevenue;

  /// The duration of the ad
  final double duration;
}

/// Flutter API Interface for Audiomob callbacks
@FlutterApi()
abstract class AudiomobObserverApi {
  /// The audio ad request has started
  void onAdRequestStarted();

  /// The audio ad request completed as an audio ad is ready to play
  void onAdRequestCompleted(
    final AdRequestResult adRequestResult,
    final AudioAd? result,
  );

  /// The audio ad playback has started
  void onAdPlaybackStarted(final AudioAd result);

  /// The audio ad playback has finished (the user can now be given a reward)
  void onAdPlaybackCompleted(final AdPlaybackResult adPlaybackResult);

  /// The audio ad playback is paused
  void onAdPlaybackPaused(final AdPauseReason adPauseReason);

  /// Audio ad playback is resumed
  void onAdPlaybackResumed();

  /// The ad availability request completed and has Ad Availability object
  void onAdAvailabilityRetrieved(final AdAvailability result);
}

/// Host API Interface for Audiomob
@HostApi()
abstract class AudiomobHostApi {
  /// Initializes the Audiomob Android SDK
  void initialise(
    final String apiKey,
    final String bundleId,
    final bool backgroundModeEnabled,
  );

  /// Requests a background audio ad and begins the ad playback as soon as it's ready
  void requestAndPlayAd();

  /// Pauses the SDK's lifecycle, call this method when the app goes into the background (non-background ads only)
  void pauseLifeCycle();

  /// Resumes the SDK's lifecycle, call this method when the app comes into the foreground (non-background ads only)
  void resumeLifeCycle();

  /// Releases resources used by Audiomob, ensure to call this function when the context is destroyed
  void release();

  /// Starts the asynchronous call to get the AdAvailability information
  void getAdAvailability(final Placement placement);

  /// Pauses the playing audio ad
  void pauseAd();

  /// Resumes the paused audio ad
  void resumePausedAd();

  /// Stops the audio ad playback
  void stopAd();

  /// Returns true if the ad playback is in progress
  bool hasAdBegunPlaying();

  /// Return true if the ad is paused
  bool isAdPaused();

  /// Returns the seconds remaining for the ad that is currently playing
  double getTimeRemaining();

  /// If set as true, the server will return test ads even if live ads are enabled on the dashboard
  void setForceTestAds(final bool enabled);

  /// If set as true, and user has given the permission, SDK will fetch latitude and longitude and send in ad request
  void setSendGeoLocation(final bool enabled);

  /// Sets whether or not to send the user's Android Advertising Id with the ad request if it's available
  void setSendAdvertisingId(final bool enabled);

  /// Sets whether or not to send the Android ID as a fallback ID if the Android Advertising Id is not available
  void setSendAndroidIdAsAFallback(final bool enabled);

  /// Sets whether or not to not send any device ID in the ad request if the Android Advertising Id is not available
  void setDoNotSendAnyDeviceIdsForNonConsentedUsers(final bool enabled);

  /// Sets whether or not to send consent strings set by a Consent Management Platform or in SharedPreferences
  void setSendConsentStrings(final bool enabled);

  /// Sets whether or not to only send contextual signals in the ad request
  void setOnlySendContextualSignals(final bool enabled);
}
