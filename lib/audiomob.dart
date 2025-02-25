import 'package:audiomob/audiomob_event_listener.dart';
import 'package:audiomob/banner_type.dart';

import 'audiomob_platform_interface.dart';

class Audiomob {
  AudiomobEventListener? _listener;
  void setListener(AudiomobEventListener? listener) {
    _listener = listener;
  }

  void init() {
    AudiomobPlatform.instance.eventChannel
        .receiveBroadcastStream()
        .listen((dynamic data) {
      var _ = switch (data['type']) {
        'onAdAvailabilityRetrieved' => _listener?.onAdAvailabilityRetrieved(
            AdAvailability.fromMap(data['result']),
          ),
        'onAdRequestStarted' => _listener?.onAdRequestStarted(),
        'onAdRequestCompleted' => _listener?.onAdRequestCompleted(
            AdRequestResult.fromName(data['adRequestResult']),
            AudioAd.fromMap(data['audioAd']),
          ),
        'onAdPlaybackStarted' => _listener?.onAdPlaybackStarted(
            AudioAd.fromMap(data['audioAd']),
          ),
        'onAdPlaybackCompleted' => _listener?.onAdPlaybackCompleted(
            AdPlaybackResult.fromName(data['adPlaybackResult']),
          ),
        'onAdPlaybackPaused' => _listener?.onAdPlaybackPaused(
            PauseAdEnum.fromName(data['pauseReason']),
          ),
        'onAdPlaybackResumed' => _listener?.onAdPlaybackResumed(),
        _ => 999
      };
    });
  }

  Future<void> requestAndPlay(BannerType bannerType, bool skipable) {
    return AudiomobPlatform.instance.requestAndPlay(bannerType, skipable);
  }
}
