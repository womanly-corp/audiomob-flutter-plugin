import 'package:audiomob/audiomob_event_listener.dart';
import 'package:audiomob/audiomob_method_channel.dart';

class Audiomob {
  AudiomobEventListener? _listener;
  void setListener(AudiomobEventListener? listener) {
    _listener = listener;
  }

  void init() {
    MethodChannelAudiomob.instance.eventChannel
        .receiveBroadcastStream()
        .listen((dynamic rawData) {
      final data = (rawData as Map).cast<String, dynamic>();
      var _ = switch (data['type']) {
        'onAdAvailabilityRetrieved' => _listener?.onAdAvailabilityRetrieved(
            AdAvailability.fromMap((data['result'] as Map).cast<String, dynamic>()),
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
  }

  Future<void> requestAndPlay() {
    return MethodChannelAudiomob.instance.requestAndPlay();
  }

  Future<void> pause() {
    return MethodChannelAudiomob.instance.pause();
  }

  Future<void> resume() {
    return MethodChannelAudiomob.instance.resume();
  }
}
