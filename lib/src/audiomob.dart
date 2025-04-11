// ignore_for_file: avoid_positional_boolean_parameters

import 'dart:async';
import 'dart:io';

import 'android/android_audiomob.dart';
import 'audiomob_event_listener.dart';
import 'audiomob_exceptions.dart';

/// {@template AndroidAudiomobBase.base}
/// Since there is different API's for iOS and Android, this class purpose
/// only for Android.
/// {@endtemplate}
class AndroidAudiomobBase {
  /// {@template AndroidAudiomobBase.is_initialized}
  /// Whether the Audiomob instance is initialized
  /// {@endtemplate}
  bool get isInitialized => _isInitialized;
  var _isInitialized = false;
  AndroidAudiomob get _androidPlatform =>
      AndroidAudiomobPlatform.instance as AndroidAudiomob;
}

/// {@template AndroidAudiomobBase.audiomob}
/// Manages event listening and interaction with the Audiomob plugin.
/// {@endtemplate}
class Audiomob extends AndroidAudiomobBase with AudiomobAvailability {
  Audiomob._();

  /// {@template AndroidAudiomobBase.instance}
  /// There should be only one instance of Audiomob
  /// {@endtemplate}
  static final instance = Audiomob._();
  late final _observer = _AudiomobAndroidObserver(audiomob: this);

  AudiomobEventListener? _listener;

  /// {@template AndroidAudiomobBase.set_listener}
  /// Sets the event listener for handling Audiomob events
  /// {@endtemplate}
  // ignore: use_setters_to_change_properties
  void setListener(final AudiomobEventListener? listener) {
    _listener = listener;
  }

  /// {@template AndroidAudiomobBase.init}
  /// Initializes the event channel listener to receive and
  /// handle Audiomob events
  ///
  /// Parameters:
  /// - [apiKey] - The API key for Audiomob
  /// - [bundleId] - The bundle ID of the application
  /// - [isBackgroundModeEnabled] - Whether background mode is enabled
  /// {@endtemplate}
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
    await _androidPlatform.init(
      apiKey: apiKey,
      bundleId: bundleId,
      isBackgroundModeEnabled: isBackgroundModeEnabled,
    );
    _androidPlatform.setObserver(_observer);

    _isInitialized = true;
  }

  /// {@template AndroidAudiomobBase.dispose}
  /// Disposes the event listener to clean up resources
  /// {@endtemplate}
  Future<void> dispose() async {
    _listener = null;
    await _androidPlatform.dispose();
  }
}

/// {@template AndroidAudiomobBase.proxy_methods}
/// Extension methods for the Audiomob class with Android specific methods
/// {@endtemplate}
extension AudiomobAndroidProxyMethods on Audiomob {
  /// {@template AndroidAudiomobBase.request_and_play}
  /// Requests and plays an ad through the Audiomob plugin.
  ///
  /// Throws [AudiomobNotInitializedException] if not initialized
  /// {@endtemplate}
  Future<void> requestAndPlay() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidPlatform.requestAndPlayAd();
  }

  /// {@template AndroidAudiomobBase.pause_ad}
  /// Pauses the currently playing ad.
  ///
  /// Throws [AudiomobNotInitializedException] if not initialized
  /// {@endtemplate}
  Future<void> pause() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidPlatform.pauseAd();
  }

  /// {@template AndroidAudiomobBase.stop_ad}
  /// Stop the currently playing ad.
  ///
  /// Throws [AudiomobNotInitializedException] if not initialized
  /// {@endtemplate}
  Future<void> stop() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidPlatform.stopAd();
  }

  /// {@template AndroidAudiomobBase.resume_ad}
  /// Resumes playback of a paused ad.
  ///
  /// Throws [AudiomobNotInitializedException] if not initialized
  /// {@endtemplate}
  Future<void> resume() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return _androidPlatform.resumePausedAd();
  }

  /// {@template AndroidAudiomobBase.has_ad_begun_playing}
  /// Returns true if the ad playback is in progress
  /// {@endtemplate}
  Future<bool> get hasAdBegunPlaying => _androidPlatform.hasAdBegunPlaying;

  /// {@template AndroidAudiomobBase.is_ad_paused}
  /// Return true if the ad is paused
  /// {@endtemplate}
  Future<bool> get isAdPaused => _androidPlatform.isAdPaused;

  /// {@template AndroidAudiomobBase.time_remaining}
  /// Returns the seconds remaining for the ad that is currently playing
  /// {@endtemplate}
  Future<double> get timeRemaining => _androidPlatform.timeRemaining;

  /// {@template AndroidAudiomobBase.set_force_test_ads}
  /// If set as true, the server will return test ads even if live ads are
  /// enabled on the dashboard
  /// {@endtemplate}
  Future<void> setForceTestAds(final bool enabled) =>
      _androidPlatform.setForceTestAds(enabled);

  /// {@template AndroidAudiomobBase.set_send_geo_location}
  /// Sets whether or not to send the user's location with the ad request
  /// {@endtemplate}
  Future<void> setSendGeoLocation(final bool enabled) =>
      _androidPlatform.setSendGeoLocation(enabled);

  /// {@template AndroidAudiomobBase.set_send_advertising_id}
  /// Sets whether or not to send the user's Android Advertising Id with
  /// the ad request if it's available
  /// {@endtemplate}
  Future<void> setSendAdvertisingId(final bool enabled) =>
      _androidPlatform.setSendAdvertisingId(enabled);

  /// {@template AndroidAudiomobBase.set_send_android_id_as_fallback}
  /// Sets whether or not to send the Android ID as a fallback ID if the
  /// Android Advertising Id is not available
  /// {@endtemplate}
  Future<void> setSendAndroidIdAsAFallback(final bool enabled) =>
      _androidPlatform.setSendAndroidIdAsAFallback(enabled);

  /// {@template AndroidAudiomobBase.set_do_not_send_device_ids}
  /// Sets whether or not to not send any device ID in the ad request if the
  /// Android Advertising Id is not available
  /// {@endtemplate}
  Future<void> setDoNotSendAnyDeviceIdsForNonConsentedUsers(
    final bool enabled,
  ) =>
      _androidPlatform.setDoNotSendAnyDeviceIdsForNonConsentedUsers(enabled);

  /// {@template AndroidAudiomobBase.set_send_consent_strings}
  /// Sets whether or not to send consent strings set by a Consent
  /// Management Platform or in SharedPreferences
  /// {@endtemplate}
  Future<void> setSendConsentStrings(final bool enabled) =>
      _androidPlatform.setSendConsentStrings(enabled);

  /// {@template AndroidAudiomobBase.set_only_send_contextual_signals}
  /// Sets whether or not to only send contextual signals in the ad request
  /// {@endtemplate}
  Future<void> setOnlySendContextualSignals(final bool enabled) =>
      _androidPlatform.setOnlySendContextualSignals(enabled);
}

/// {@template AndroidAudiomobBase.availability}
/// Mixin for checking ad availability
/// {@endtemplate}
mixin AudiomobAvailability on AndroidAudiomobBase {
  Completer<AdAvailability>? _availabilityCompleter;

  /// {@template AndroidAudiomobBase.get_ad_availability}
  /// Gets the ad availability for a given placement.
  /// For background mode ads, always pass [Placement.rewarded]
  ///
  /// Throws [AudiomobNotInitializedException] if not initialized
  /// {@endtemplate}
  Future<AdAvailability> getAdAvailability(final Placement placement) async {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    _completeAvailability(AdAvailability());

    final completer = _availabilityCompleter ??= Completer<AdAvailability>();

    await _androidPlatform.getAdAvailability(placement);
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

/// {@template AndroidAudiomobBase.android_observer}
/// Handler for Android Audiomob events
///
/// Passes events to the [Audiomob] listener which can be attached
/// to the [Audiomob] instance
/// {@endtemplate}
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
  ) =>
      _listener?.onAdRequestCompleted(adRequestResult, result);

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
