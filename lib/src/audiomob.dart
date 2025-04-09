// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:async';
import 'dart:io';

import 'android/android_audiomob.dart';
import 'audiomob_event_listener.dart';
import 'audiomob_exceptions.dart';

/// Since there is different API's for iOS and Android, this class purpose
/// only for Android.
class AndroidAudiomobBase {
  bool get isInitialized => _isInitialized;
  var _isInitialized = false;
  AndroidAudiomob get _androidApi =>
      AndroidAudiomobPlatform.instance as AndroidAudiomob;
}

/// Manages event listening and interaction with the Audiomob plugin.
class Audiomob extends AndroidAudiomobBase with AudiomobAvailability {
  Audiomob._();

  /// there should be only one instance of Audiomob
  static final instance = Audiomob._();
  late final _observer = _AudiomobAndroidObserver(audiomob: this);

  AudiomobEventListener? _listener;

  /// Sets the event listener for handling Audiomob events
  void setListener(final AudiomobEventListener? listener) {
    _listener = listener;
  }

  /// Initializes the event channel listener to receive and handle Audiomob events
  Future<void> init({
    required final String apiKey,
    required final String bundleId,
    required final bool isBackgroundModeEnabled,
  }) async {
    /// If the event channel listener is already initialized, return.
    if (isInitialized) return;
    if (!Platform.isAndroid) {
      throw UnimplementedError('Audiomob is not implemented on this platform');
    }
    await _androidApi.init(
      apiKey: apiKey,
      bundleId: bundleId,
      isBackgroundModeEnabled: isBackgroundModeEnabled,
    );
    _androidApi.setObserver(_observer);

    _isInitialized = true;
  }

  /// Disposes the event listener to clean up resources
  Future<void> dispose() async {
    _listener = null;
    await _androidApi.dispose();
  }
}

extension AudiomobAndroidProxyMethods on Audiomob {
  /// Requests and plays an ad through the Audiomob plugin.
  Future<void> requestAndPlay() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidApi.requestAndPlayAd();
  }

  /// Pauses the currently playing ad.
  Future<void> pause() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidApi.pauseAd();
  }

  /// Resumes playback of a paused ad.
  Future<void> resume() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidApi.resumePausedAd();
  }

  /// Returns true if the ad playback is in progress
  Future<bool> get hasAdBegunPlaying => _androidApi.hasAdBegunPlaying;

  /// Return true if the ad is paused
  Future<bool> get isAdPaused => _androidApi.isAdPaused;

  /// Returns the seconds remaining for the ad that is currently playing
  Future<double> get timeRemaining => _androidApi.timeRemaining;

  /// If set as true, the server will return test ads even if live ads are enabled on the dashboard
  Future<void> setForceTestAds(final bool enabled) =>
      _androidApi.setForceTestAds(enabled);

  /// Sets whether or not to send the user's location with the ad request
  Future<void> setSendGeoLocation(final bool enabled) =>
      _androidApi.setSendGeoLocation(enabled);

  /// Sets whether or not to send the user's Android Advertising Id with the ad request if it's available
  Future<void> setSendAdvertisingId(final bool enabled) =>
      _androidApi.setSendAdvertisingId(enabled);

  /// Sets whether or not to send the Android ID as a fallback ID if the Android Advertising Id is not available
  Future<void> setSendAndroidIdAsAFallback(final bool enabled) =>
      _androidApi.setSendAndroidIdAsAFallback(enabled);

  /// Sets whether or not to not send any device ID in the ad request if the Android Advertising Id is not available
  Future<void> setDoNotSendAnyDeviceIdsForNonConsentedUsers(
    final bool enabled,
  ) => _androidApi.setDoNotSendAnyDeviceIdsForNonConsentedUsers(enabled);

  /// Sets whether or not to send consent strings set by a Consent Management Platform or in SharedPreferences
  Future<void> setSendConsentStrings(final bool enabled) =>
      _androidApi.setSendConsentStrings(enabled);

  /// Sets whether or not to only send contextual signals in the ad request
  Future<void> setOnlySendContextualSignals(final bool enabled) =>
      _androidApi.setOnlySendContextualSignals(enabled);
}

mixin AudiomobAvailability on AndroidAudiomobBase {
  Completer<AdAvailability>? _availabilityCompleter;

  /// Gets the ad availability for a given placement.
  /// For background mode ads, always pass [Placement.rewarded]
  Future<AdAvailability> getAdAvailability(final Placement placement) async {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    _completeAvailability(AdAvailability());

    final completer = _availabilityCompleter ??= Completer<AdAvailability>();

    await _androidApi.getAdAvailability(placement);
    return completer.future;
  }

  void _completeAvailability(final AdAvailability availability) {
    final oldCompleter = _availabilityCompleter;
    _availabilityCompleter = null;
    if (oldCompleter != null && !oldCompleter.isCompleted) {
      oldCompleter.complete(availability);
    }
  }
}

/// Handler for Android Audiomob events
///
/// Passes events to the [Audiomob] listener which can be attached
/// to the [Audiomob] instance
class _AudiomobAndroidObserver implements AudiomobObserverApi {
  _AudiomobAndroidObserver({required this.audiomob});
  final Audiomob audiomob;
  AudiomobEventListener? get _listener => audiomob._listener;

  @override
  void onAdRequestStarted() => _listener?.onAdRequestStarted();

  @override
  void onAdRequestCompleted(
    final AdRequestResult adRequestResult,
    final AudioAd? result,
  ) => _listener?.onAdRequestCompleted(adRequestResult, result);

  @override
  void onAdPlaybackStarted(final AudioAd audioAd) =>
      _listener?.onAdPlaybackStarted(audioAd);

  @override
  void onAdPlaybackCompleted(final AdPlaybackResult adPlaybackResult) =>
      _listener?.onAdPlaybackCompleted(adPlaybackResult);

  @override
  void onAdAvailabilityRetrieved(final AdAvailability result) =>
      audiomob._completeAvailability(result);

  @override
  void onAdPlaybackPaused(final AdPauseReason adPauseReason) =>
      _listener?.onAdPlaybackPaused(adPauseReason);

  @override
  void onAdPlaybackResumed() => _listener?.onAdPlaybackResumed();
}
