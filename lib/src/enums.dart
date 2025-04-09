import 'android/messages.g.dart' as messages;

enum AdRequestResult {
  finished,
  noAdAvailable,
  frequencyCapReached,
  failed,
  skippableRequestVolumeNotAudible;

  factory AdRequestResult.fromMessage(
    final messages.AdRequestResult result,
  ) => switch (result) {
    messages.AdRequestResult.FINISHED => AdRequestResult.finished,
    messages.AdRequestResult.NO_AD_AVAILABLE => AdRequestResult.noAdAvailable,
    messages.AdRequestResult.FREQUENCY_CAP_REACHED =>
      AdRequestResult.frequencyCapReached,
    messages.AdRequestResult.FAILED => AdRequestResult.failed,
    messages.AdRequestResult.SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE =>
      AdRequestResult.skippableRequestVolumeNotAudible,
  };

  messages.AdRequestResult toMessage() => switch (this) {
    AdRequestResult.finished => messages.AdRequestResult.FINISHED,
    AdRequestResult.noAdAvailable => messages.AdRequestResult.NO_AD_AVAILABLE,
    AdRequestResult.frequencyCapReached =>
      messages.AdRequestResult.FREQUENCY_CAP_REACHED,
    AdRequestResult.failed => messages.AdRequestResult.FAILED,
    AdRequestResult.skippableRequestVolumeNotAudible =>
      messages.AdRequestResult.SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE,
  };
}

enum AdPlaybackResult {
  finished,
  stopped,
  skipped,
  failed,
  canceled;

  factory AdPlaybackResult.fromMessage(
    final messages.AdPlaybackResult result,
  ) => switch (result) {
    messages.AdPlaybackResult.FINISHED => AdPlaybackResult.finished,
    messages.AdPlaybackResult.STOPPED => AdPlaybackResult.stopped,
    messages.AdPlaybackResult.SKIPPED => AdPlaybackResult.skipped,
    messages.AdPlaybackResult.FAILED => AdPlaybackResult.failed,
    messages.AdPlaybackResult.CANCELED => AdPlaybackResult.canceled,
  };

  messages.AdPlaybackResult toMessage() => switch (this) {
    AdPlaybackResult.finished => messages.AdPlaybackResult.FINISHED,
    AdPlaybackResult.stopped => messages.AdPlaybackResult.STOPPED,
    AdPlaybackResult.skipped => messages.AdPlaybackResult.SKIPPED,
    AdPlaybackResult.failed => messages.AdPlaybackResult.FAILED,
    AdPlaybackResult.canceled => messages.AdPlaybackResult.CANCELED,
  };
}

enum AdPauseReason {
  phoneVolumeLowered,
  pauseMethodCalled,
  appInBackground;

  factory AdPauseReason.fromMessage(
    final messages.AdPauseReason message,
  ) => switch (message) {
    messages.AdPauseReason.PHONE_VOLUME_LOW => AdPauseReason.phoneVolumeLowered,
    messages.AdPauseReason.PAUSE_METHOD_CALLED =>
      AdPauseReason.pauseMethodCalled,
    messages.AdPauseReason.APP_IN_BACKGROUND => AdPauseReason.appInBackground,
  };

  messages.AdPauseReason toMessage() => switch (this) {
    AdPauseReason.phoneVolumeLowered => messages.AdPauseReason.PHONE_VOLUME_LOW,
    AdPauseReason.pauseMethodCalled =>
      messages.AdPauseReason.PAUSE_METHOD_CALLED,
    AdPauseReason.appInBackground => messages.AdPauseReason.APP_IN_BACKGROUND,
  };
}

enum Placement {
  rewarded;

  factory Placement.fromMessage(final messages.Placement placement) =>
      switch (placement) {
        messages.Placement.REWARDED => Placement.rewarded,
      };

  messages.Placement toMessage() => switch (this) {
    Placement.rewarded => messages.Placement.REWARDED,
  };
}
