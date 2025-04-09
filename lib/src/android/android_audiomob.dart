import 'messages.g.dart';

class AndroidAudiomob {
  final _api = AudiomobHostApi();

  Future<void> init({
    required final String apiKey,
    required final String bundleId,
    required final bool isBackgroundModeEnabled,
  }) async {
    await _api.initialise(apiKey, bundleId, isBackgroundModeEnabled);
  }

  Future<void> requestAndPlayAd() => _api.requestAndPlayAd();

  Future<void> pauseLifeCycle() => _api.pauseLifeCycle();

  Future<void> resumeLifeCycle() => _api.resumeLifeCycle();

  Future<void> dispose() => _api.release();

  Future<void> getAdAvailability(final Placement placement) =>
      _api.getAdAvailability(placement);

  Future<void> pauseAd() => _api.pauseAd();

  Future<void> resumePausedAd() => _api.resumePausedAd();

  Future<void> stopAd() => _api.stopAd();

  Future<bool> get hasAdBegunPlaying => _api.hasAdBegunPlaying();

  Future<bool> get isAdPaused => _api.isAdPaused();

  Future<double> get timeRemaining => _api.getTimeRemaining();

  Future<void> setForceTestAds(final bool enabled) =>
      _api.setForceTestAds(enabled);

  void setObserver(final AudiomobObserverApi observer) =>
      AudiomobObserverApi.setUp(observer);
}
