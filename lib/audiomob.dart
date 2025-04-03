import 'dart:async';

import 'package:audiomob/audiomob_event_listener.dart';
import 'package:audiomob/audiomob_method_channel.dart';

/// Manages event listening and interaction with the Audiomob plugin.
class Audiomob {
  AudiomobEventListener? _listener;
  StreamSubscription? _eventChannelListener;

  /// Sets the event listener for handling Audiomob events
  void setListener(AudiomobEventListener? listener) {
    _listener = listener;
  }

  /// Initializes the event channel listener to receive and handle Audiomob events
  Future<void> init(
    String apiKey,
    String bundleId,
    bool isBackgroundModeEnabled,
  ) async {
    _eventChannelListener = MethodChannelAudiomob.instance.eventChannel
        .receiveBroadcastStream()
        .listen((dynamic rawData) {
      final data = (rawData as Map).cast<String, dynamic>();
      var _ = switch (data['type']) {
        'onAdAvailabilityRetrieved' => _listener?.onAdAvailabilityRetrieved(
            AdAvailability.fromMap(
                (data['result'] as Map).cast<String, dynamic>()),
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
    });
    await MethodChannelAudiomob.instance.init(
      apiKey,
      bundleId,
      isBackgroundModeEnabled,
    );
  }

  /// Disposes the event listener to clean up resources
  void dispose() {
    _eventChannelListener?.cancel();
    _eventChannelListener = null;
  }

  /// Requests and plays an ad through the Audiomob plugin.
  Future<void> requestAndPlay() {
    return MethodChannelAudiomob.instance.requestAndPlay();
  }

  /// Pauses the currently playing ad.
  Future<void> pause() {
    return MethodChannelAudiomob.instance.pause();
  }

  /// Resumes playback of a paused ad.
  Future<void> resume() {
    return MethodChannelAudiomob.instance.resume();
  }

  Future<void> getAdAvailability(Placement placement) {
    return MethodChannelAudiomob.instance.getAdAvailability(placement);
  }
}
