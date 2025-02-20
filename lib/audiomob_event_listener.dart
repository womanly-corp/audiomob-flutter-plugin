class AudiomobEventListener {
  void onAdAvailabilityRetrieved(AdAvailability? result) {}
  void onAdRequestStarted() {}
  void onAdPlaybackCompleted(AdPlaybackResult? adPlaybackResult) {}
  void onAdPlaybackPaused(PauseAdEnum? pauseReason) {}
  void onAdPlaybackResumed() {}
  void onAdPlaybackStarted(AudioAd? audioAd) {}
  void onAdRequestCompleted(
      AdRequestResult? adRequestResult, AudioAd? audioAd) {}
}

class AdAvailability {
  final bool? adsAvailable;
  final double? estimatedCpm;
  final String? geo;
  final double? estimatedRevenue;

  AdAvailability({
    this.adsAvailable,
    this.estimatedCpm,
    this.geo,
    this.estimatedRevenue,
  });

  factory AdAvailability.fromMap(Map<String, dynamic> map) {
    return AdAvailability(
      adsAvailable: map['adsAvailable'],
      estimatedCpm: map['estimatedCpm'],
      geo: map['geo'],
      estimatedRevenue: map['estimatedRevenue'],
    );
  }
}

class AudioAd {
  final double? estimatedRevenue;
  final double? estimatedCpm;
  final double? duration;
  final String? id;
  final BannerSize? companionBanner;

  AudioAd({
    required this.estimatedRevenue,
    required this.estimatedCpm,
    required this.duration,
    required this.id,
    this.companionBanner,
  });

  factory AudioAd.fromMap(Map<String, dynamic> map) {
    return AudioAd(
      estimatedRevenue: map['estimatedRevenue'],
      estimatedCpm: map['estimatedCpm'],
      duration: map['duration'],
      id: map['id'],
      companionBanner: BannerSize.fromName(map['companionBanner']),
    );
  }
}

enum BannerSize {
  NO_BANNER,
  MEDIUM_RECTANGLE,
  MOBILE_LEADERBOARD;

  static BannerSize? fromName(String? name) => values.asNameMap()[name];
}

enum AdRequestResult {
  UNKNOWN,
  FINISHED,
  NO_AD_AVAILABLE,
  FREQUENCY_CAP_REACHED,
  FAILED,
  SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE;

  static AdRequestResult? fromName(String? name) => values.asNameMap()[name];
}

enum AdPlaybackResult {
  FINISHED,
  STOPPED,
  SKIPPED,
  FAILED,
  CANCELED;

  static AdPlaybackResult? fromName(String? name) => values.asNameMap()[name];
}

enum PauseAdEnum {
  PhoneVolumeLowered,
  PauseMethodCalled,
  AppInBackground;

  static PauseAdEnum? fromName(String? name) => values.asNameMap()[name];
}
