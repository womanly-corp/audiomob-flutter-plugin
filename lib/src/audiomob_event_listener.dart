import 'android/messages.g.dart' as messages;
import 'enums.dart';

export 'android/messages.g.dart' show AudioAd;

/// Listener for Audiomob SDK events
class AudiomobEventListener {
  /// The audio ad request has started
  void onAdRequestStarted() {}

  /// The audio ad playback has finished (the user can now be given a reward).
  /// [adPlaybackResult] enum value will notify the Finished, Skipped, Failed, Stopped status of playback
  ///
  /// ```dart
  /// // Playback has completed, use this callback to resume your app's audio.
  /// if (adPlaybackResult == AdPlaybackResult.finished) {
  ///     // The ad completed, reward your user here.
  /// }
  /// ```
  void onAdPlaybackCompleted(final AdPlaybackResult adPlaybackResult) {}

  /// The audio ad playback is paused when the:
  /// - App is in the background
  /// - Device volume is below the required threshold
  /// - User has paused the ad playback
  /// - Audio focus is released
  void onAdPlaybackPaused(final AdPauseReason adPauseReason) {}

  /// Audio ad playback is resumed when the:
  /// - App is in the foreground
  /// - Device volume is increased either through the unmute prompt or manually raising the volume
  /// - User has resumed the app
  void onAdPlaybackResumed() {}

  /// The audio ad playback has started
  ///
  /// Playback of the ad has begun, use the callback to pause your app's audio.
  void onAdPlaybackStarted(final messages.AudioAd audioAd) {}

  /// The audio ad request completed as an audio ad is ready to play
  void onAdRequestCompleted(
    final AdRequestResult adRequestResult,
    final messages.AudioAd? audioAd,
  ) {}
}
