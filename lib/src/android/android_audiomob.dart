// ignore_for_file: avoid_positional_boolean_parameters

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'messages.g.dart';

/// Platform interface for the Audiomob SDK
abstract class AndroidAudiomobPlatform extends PlatformInterface {
  /// Constructs platform interface
  AndroidAudiomobPlatform() : super(token: _token);
  static final _token = Object();
  static final AndroidAudiomobPlatform _instance = _PlaceholderImplementation();

  /// The instance of the AndroidAudiomobPlatform
  static AndroidAudiomobPlatform get instance => _instance;

  /// Platform-specific plugins should override this with their own
  /// platform-specific class that extends [VideoPlayerPlatform] when they
  /// register themselves.
  static set instance(final AndroidAudiomobPlatform instance) {
    PlatformInterface.verify(instance, _token);
    AndroidAudiomobPlatform.instance = instance;
  }

  final _api = AudiomobHostApi();
}

class _PlaceholderImplementation extends AndroidAudiomobPlatform {}

/// Android implementation of the Audiomob SDK
class AndroidAudiomob extends AndroidAudiomobPlatform {
  AndroidAudiomob._() : super();

  /// Registers this class as the default instance of [AndroidAudiomob].
  static void registerWith() =>
      AndroidAudiomobPlatform.instance = AndroidAudiomob._();

  /// Initializes the Audiomob Android SDK
  Future<void> init({
    required final String apiKey,
    required final String bundleId,
    required final bool isBackgroundModeEnabled,
  }) => _api.initialise(apiKey, bundleId, isBackgroundModeEnabled);

  /// Requests a background audio ad and begins the ad playback as soon as it's ready
  Future<void> requestAndPlayAd() => _api.requestAndPlayAd();

  /// Pauses the SDK's lifecycle, call this method when the app goes into the background (non-background ads only)
  Future<void> pauseLifeCycle() => _api.pauseLifeCycle();

  /// Resumes the SDK's lifecycle, call this method when the app comes into the foreground (non-background ads only)
  Future<void> resumeLifeCycle() => _api.resumeLifeCycle();

  /// Releases resources used by Audiomob, ensure to call this function when the context is destroyed
  Future<void> dispose() => _api.release();

  /// Starts the asynchronous call to get the AdAvailability information.
  /// For background mode ads, always pass Placement.REWARDED
  Future<void> getAdAvailability(final Placement placement) =>
      _api.getAdAvailability(placement);

  /// Pauses the playing audio ad
  Future<void> pauseAd() => _api.pauseAd();

  /// Resumes the paused audio ad
  Future<void> resumePausedAd() => _api.resumePausedAd();

  /// Stops the audio ad playback
  Future<void> stopAd() => _api.stopAd();

  /// Returns true if the ad playback is in progress
  Future<bool> get hasAdBegunPlaying => _api.hasAdBegunPlaying();

  /// Return true if the ad is paused
  Future<bool> get isAdPaused => _api.isAdPaused();

  /// Returns the seconds remaining for the ad that is currently playing
  Future<double> get timeRemaining => _api.getTimeRemaining();

  /// Sets whether or not to send the user's Android Advertising Id with the ad request if it's available
  Future<void> setSendAdvertisingId(final bool enabled) =>
      _api.setSendAdvertisingId(enabled);

  /// Sets whether or not to send the Android ID as a fallback ID if the Android Advertising Id is not available
  Future<void> setSendAndroidIdAsAFallback(final bool enabled) =>
      _api.setSendAndroidIdAsAFallback(enabled);

  /// Sets whether or not to not send any device ID in the ad request if the Android Advertising Id is not available
  Future<void> setDoNotSendAnyDeviceIdsForNonConsentedUsers(
    final bool enabled,
  ) => _api.setDoNotSendAnyDeviceIdsForNonConsentedUsers(enabled);

  /// Sets whether or not to send the user's location with the ad request
  Future<void> setSendGeoLocation(final bool enabled) =>
      _api.setSendGeoLocation(enabled);

  /// Sets whether or not to send consent strings set by a Consent Management Platform or in SharedPreferences
  Future<void> setSendConsentStrings(final bool enabled) =>
      _api.setSendConsentStrings(enabled);

  /// Sets whether or not to only send contextual signals in the ad request
  Future<void> setOnlySendContextualSignals(final bool enabled) =>
      _api.setOnlySendContextualSignals(enabled);

  /// If set as true, the server will return test ads even if live ads are enabled on the dashboard
  Future<void> setForceTestAds(final bool enabled) =>
      _api.setForceTestAds(enabled);

  /// Subscribes the given observer to Audiomob's callbacks
  void setObserver(final AudiomobObserverApi observer) =>
      AudiomobObserverApi.setUp(observer);
}
