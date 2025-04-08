import 'dart:async';

import 'audiomob_event_listener.dart';
import 'audiomob_exceptions.dart';
import 'audiomob_method_channel.dart';

/// Manages event listening and interaction with the Audiomob plugin.
class Audiomob {
  AudiomobEventListener? _listener;
  StreamSubscription? _eventChannelListener;
  bool get isInitialized => _eventChannelListener != null;

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
    _eventChannelListener = MethodChannelAudiomob.instance.eventChannel
        .receiveBroadcastStream()
        .listen((final rawData) {
      final data = (rawData as Map).cast<String, dynamic>();
      final _ = switch (data['type']) {
        'onAdAvailabilityRetrieved' => _listener?.onAdAvailabilityRetrieved(
            AdAvailability.fromMap(
              (data['result'] as Map).cast<String, dynamic>(),
            ),
          ),
        'onAdRequestStarted' => _listener?.onAdRequestStarted(),
        'onAdRequestCompleted' => _listener?.onAdRequestCompleted(
            AdRequestResult.fromName(data['adRequestResult']),
            AudioAd.fromMap((data['audioAd'] as Map).cast<String, dynamic>()),
          ),
        'onAdPlaybackStarted' => _listener?.onAdPlaybackStarted(
            AudioAd.fromMap((data['audioAd'] as Map).cast<String, dynamic>()),
          ),
        'onAdPlaybackCompleted' => _listener?.onAdPlaybackCompleted(
            AdPlaybackResult.fromName(data['adPlaybackResult']),
          ),
        'onAdPlaybackPaused' => _listener?.onAdPlaybackPaused(
            PauseAdEnum.fromName(data['pauseReason']),
          ),
        'onAdPlaybackResumed' => _listener?.onAdPlaybackResumed(),
        _ => throw Exception('MethodChannelAudiomob: unsupported event')
      };
    })
      ..onDone(() {
        _eventChannelListener = null;
      });
    await MethodChannelAudiomob.instance.init(
      apiKey: apiKey,
      bundleId: bundleId,
      isBackgroundModeEnabled: isBackgroundModeEnabled,
    );
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
    return MethodChannelAudiomob.instance.requestAndPlay();
  }

  /// Pauses the currently playing ad.
  Future<void> pause() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return MethodChannelAudiomob.instance.pause();
  }

  /// Resumes playback of a paused ad.
  Future<void> resume() {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return MethodChannelAudiomob.instance.resume();
  }

  Future<void> getAdAvailability(final Placement placement) {
    if (!isInitialized) {
      throw const AudiomobNotInitializedException();
    }
    return MethodChannelAudiomob.instance.getAdAvailability(placement);
  }
}
