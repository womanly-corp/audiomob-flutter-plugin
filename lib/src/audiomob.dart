import 'dart:async';
import 'dart:io';

import 'android/android_audiomob.dart';
import 'android/messages.g.dart' as android_messages;
import 'audiomob_event_listener.dart';
import 'audiomob_exceptions.dart';
import 'audiomob_method_channel.dart';
import 'enums.dart';
import 'models.dart';

class AudiomobBase {
  bool get isInitialized => _isInitialized;
  var _isInitialized = false;
  final _androidApi = AndroidAudiomob();
}

/// Manages event listening and interaction with the Audiomob plugin.
class Audiomob extends AudiomobBase with AudiomobAvailability {
  Audiomob._();

  /// there should be only one instance of Audiomob
  static final instance = Audiomob._();
  late final _observer = AudiomobAndroidObserver(audiomob: this);

  AudiomobEventListener? _listener;
  StreamSubscription? _eventChannelListener;

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
    await _eventChannelListener?.cancel();
    _eventChannelListener = null;
  }

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
    return MethodChannelAudiomob.instance.resume();
  }
}

mixin AudiomobAvailability on AudiomobBase {
  Completer<AdAvailability>? _availabilityCompleter;
  Future<AdAvailability> getAdAvailability(final Placement placement) async {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    _completeAvailability(const AdAvailability());

    final completer = _availabilityCompleter ??= Completer<AdAvailability>();

    await _androidApi.getAdAvailability(placement.toMessage());
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

class AudiomobAndroidObserver implements android_messages.AudiomobObserverApi {
  AudiomobAndroidObserver({required this.audiomob});
  final Audiomob audiomob;
  AudiomobEventListener? get _listener => audiomob._listener;

  @override
  void onAdRequestStarted() => _listener?.onAdRequestStarted();

  @override
  void onAdRequestCompleted(
    final android_messages.AdRequestResult adRequestResult,
    final AudioAd? result,
  ) => _listener?.onAdRequestCompleted(
    AdRequestResult.fromMessage(adRequestResult),
    result,
  );

  @override
  void onAdPlaybackStarted(final AudioAd audioAd) =>
      _listener?.onAdPlaybackStarted(audioAd);

  @override
  void onAdPlaybackCompleted(
    final android_messages.AdPlaybackResult adPlaybackResult,
  ) => _listener?.onAdPlaybackCompleted(
    AdPlaybackResult.fromMessage(adPlaybackResult),
  );

  @override
  void onAdAvailabilityRetrieved(
    final android_messages.AdAvailability result,
  ) => audiomob._completeAvailability(AdAvailability.fromMessage(result));

  @override
  void onAdPlaybackPaused(final android_messages.AdPauseReason adPauseReason) =>
      _listener?.onAdPlaybackPaused(AdPauseReason.fromMessage(adPauseReason));

  @override
  void onAdPlaybackResumed() => _listener?.onAdPlaybackResumed();
}
