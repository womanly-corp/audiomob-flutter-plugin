import 'android/messages.g.dart' as messages;
import 'enums.dart';

export 'android/messages.g.dart' show AudioAd;

class AudiomobEventListener {
  void onAdRequestStarted() {}
  void onAdPlaybackCompleted(final AdPlaybackResult adPlaybackResult) {}
  void onAdPlaybackPaused(final AdPauseReason adResumeReason) {}
  void onAdPlaybackResumed() {}
  void onAdPlaybackStarted(final messages.AudioAd audioAd) {}
  void onAdRequestCompleted(
    final AdRequestResult adRequestResult,
    final messages.AudioAd? audioAd,
  ) {}
}
