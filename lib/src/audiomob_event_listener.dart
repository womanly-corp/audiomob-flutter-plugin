import 'package:flutter/material.dart';

class AudiomobEventListener {
  void onAdAvailabilityRetrieved(final AdAvailability result) {}
  void onAdRequestStarted() {}
  void onAdPlaybackCompleted(final AdPlaybackResult adPlaybackResult) {}
  void onAdPlaybackPaused(final PauseAdEnum pauseReason) {}
  void onAdPlaybackResumed() {}
  void onAdPlaybackStarted(final AudioAd audioAd) {}
  void onAdRequestCompleted(
    final AdRequestResult adRequestResult,
    final AudioAd? audioAd,
  ) {}
}

@immutable
class AdAvailability {
  const AdAvailability({
    required this.adsAvailable,
    required this.estimatedCpm,
    required this.geo,
    required this.estimatedRevenue,
  });

  factory AdAvailability.fromMap(final Map<String, dynamic> map) =>
      AdAvailability(
        adsAvailable: map['adsAvailable'] ?? false,
        estimatedCpm: map['estimatedCpm'] ?? 0,
        geo: map['geo'] ?? '',
        estimatedRevenue: map['estimatedRevenue'] ?? 0,
      );
  final bool adsAvailable;
  final double estimatedCpm;
  final String geo;
  final double estimatedRevenue;
}

@immutable
class AudioAd {
  const AudioAd({
    required this.estimatedRevenue,
    required this.estimatedCpm,
    required this.duration,
    required this.id,
    required this.companionBanner,
  });

  factory AudioAd.fromMap(final Map<String, dynamic> map) => AudioAd(
        estimatedRevenue: map['estimatedRevenue'] ?? 0,
        estimatedCpm: map['estimatedCpm'] ?? 0,
        duration: map['duration'] ?? 0,
        id: map['id'] ?? '',
        companionBanner: BannerSize.fromName(map['companionBanner']),
      );
  final double estimatedRevenue;
  final double estimatedCpm;
  final double duration;
  final String id;
  final BannerSize companionBanner;
}

enum BannerSize {
  noBanner,
  mediumRectangle,
  mobileLeaderboard;

  factory BannerSize.fromName(final String? name) {
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

  factory AdRequestResult.fromName(final String? name) {
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

  factory AdPlaybackResult.fromName(final String? name) {
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

  factory PauseAdEnum.fromName(final String? name) {
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

enum Placement {
  rewarded,
  skippable;
}
