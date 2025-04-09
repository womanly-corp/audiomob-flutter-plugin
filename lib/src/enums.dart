import 'android/messages.g.dart' as messages;

/// Results of an audio ad request
enum AdRequestResult {
  /// The audio ad request completed as an audio ad is ready to play
  finished,

  /// There was no ad found for this user
  noAdAvailable,

  /// The user has reached the maximum number of ads for this session
  frequencyCapReached,

  /// The audio ad request failed due to an error
  failed,

  /// The skippble ad was not requested as the device volume is not audible
  skippableRequestVolumeNotAudible;

  /// Creates an [AdRequestResult] from a message
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

  /// Converts this [AdRequestResult] to a message
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

/// Results of an audio ad playback
enum AdPlaybackResult {
  /// The audio ad playback has finished (the user can now be given a reward)
  finished,

  /// The audio ad was stopped by the 'stopAd' function
  stopped,

  /// The audio ad playback was skipped by the user
  skipped,

  /// The audio ad playback failed due to an error
  failed,

  /// The ad was canceled by the user before it started
  canceled;

  /// Creates an [AdPlaybackResult] from a message
  factory AdPlaybackResult.fromMessage(
    final messages.AdPlaybackResult result,
  ) => switch (result) {
    messages.AdPlaybackResult.FINISHED => AdPlaybackResult.finished,
    messages.AdPlaybackResult.STOPPED => AdPlaybackResult.stopped,
    messages.AdPlaybackResult.SKIPPED => AdPlaybackResult.skipped,
    messages.AdPlaybackResult.FAILED => AdPlaybackResult.failed,
    messages.AdPlaybackResult.CANCELED => AdPlaybackResult.canceled,
  };

  /// Converts this [AdPlaybackResult] to a message
  messages.AdPlaybackResult toMessage() => switch (this) {
    AdPlaybackResult.finished => messages.AdPlaybackResult.FINISHED,
    AdPlaybackResult.stopped => messages.AdPlaybackResult.STOPPED,
    AdPlaybackResult.skipped => messages.AdPlaybackResult.SKIPPED,
    AdPlaybackResult.failed => messages.AdPlaybackResult.FAILED,
    AdPlaybackResult.canceled => messages.AdPlaybackResult.CANCELED,
  };
}

/// Reasons why an audio ad playback was paused
enum AdPauseReason {
  /// Device volume is below the required threshold
  phoneVolumeLowered,

  /// User has paused the ad playback
  pauseMethodCalled,

  /// App is in the background
  appInBackground;

  /// Creates an [AdPauseReason] from a message
  factory AdPauseReason.fromMessage(
    final messages.AdPauseReason message,
  ) => switch (message) {
    messages.AdPauseReason.PHONE_VOLUME_LOW => AdPauseReason.phoneVolumeLowered,
    messages.AdPauseReason.PAUSE_METHOD_CALLED =>
      AdPauseReason.pauseMethodCalled,
    messages.AdPauseReason.APP_IN_BACKGROUND => AdPauseReason.appInBackground,
  };

  /// Converts this [AdPauseReason] to a message
  messages.AdPauseReason toMessage() => switch (this) {
    AdPauseReason.phoneVolumeLowered => messages.AdPauseReason.PHONE_VOLUME_LOW,
    AdPauseReason.pauseMethodCalled =>
      messages.AdPauseReason.PAUSE_METHOD_CALLED,
    AdPauseReason.appInBackground => messages.AdPauseReason.APP_IN_BACKGROUND,
  };
}

/// Ad placement types
enum Placement {
  /// Rewarded ad placement
  rewarded;

  /// Creates a [Placement] from a message
  factory Placement.fromMessage(final messages.Placement placement) =>
      switch (placement) {
        messages.Placement.REWARDED => Placement.rewarded,
      };

  /// Converts this [Placement] to a message
  messages.Placement toMessage() => switch (this) {
    Placement.rewarded => messages.Placement.REWARDED,
  };
}
