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
  noBanner,
  mediumRectangle,
  mobileLeaderboard;

  static BannerSize fromName(String? name) {
    switch (name) {
      case 'NO_BANNER':
        return BannerSize.noBanner;
      case 'MEDIUM_RECTANGLE':
        return BannerSize.mediumRectangle;
      case 'MOBILE_LEADERBOARD':
        return BannerSize.mobileLeaderboard;
      default:
        return BannerSize.noBanner;
    }
  }
}

enum AdRequestResult {
  unknown,
  finished,
  noAdAvailable,
  frequencyCapReached,
  failed,
  skippableRequestVolumeNotAudible;

  static AdRequestResult fromName(String? name) {
    switch (name) {
      case 'UNKNOWN':
        return AdRequestResult.unknown;
      case 'FINISHED':
        return AdRequestResult.finished;
      case 'NO_AD_AVAILABLE':
        return AdRequestResult.noAdAvailable;
      case 'FREQUENCY_CAP_REACHED':
        return AdRequestResult.frequencyCapReached;
      case 'FAILED':
        return AdRequestResult.failed;
      case 'SKIPPABLE_REQUEST_VOLUME_NOT_AUDIBLE':
        return AdRequestResult.skippableRequestVolumeNotAudible;
      default:
        return AdRequestResult.unknown;
    }
  }
}

enum AdPlaybackResult {
  finished,
  stopped,
  skipped,
  failed,
  canceled;

  static AdPlaybackResult fromName(String? name) {
    switch (name) {
      case 'FINISHED':
        return AdPlaybackResult.finished;
      case 'STOPPED':
        return AdPlaybackResult.stopped;
      case 'SKIPPED':
        return AdPlaybackResult.skipped;
      case 'FAILED':
        return AdPlaybackResult.failed;
      case 'CANCELED':
        return AdPlaybackResult.canceled;
      default:
        return AdPlaybackResult.failed;
    }
  }
}

enum PauseAdEnum {
  phoneVolumeLowered,
  pauseMethodCalled,
  appInBackground,
  unknown;

  static PauseAdEnum fromName(String? name) {
    switch (name) {
      case 'PhoneVolumeLowered':
        return PauseAdEnum.phoneVolumeLowered;
      case 'PauseMethodCalled':
        return PauseAdEnum.pauseMethodCalled;
      case 'AppInBackground':
        return PauseAdEnum.appInBackground;
      default:
        return PauseAdEnum.unknown;
    }
  }
}
