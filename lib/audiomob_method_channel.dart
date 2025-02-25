import 'package:audiomob/banner_type.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'audiomob_platform_interface.dart';

/// An implementation of [AudiomobPlatform] that uses method channels.
class MethodChannelAudiomob extends AudiomobPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('audiomob');
  @override
  final eventChannel = const EventChannel("audiomob/events");

  @override
  Future<void> requestAndPlay(BannerType bannerType, bool skipable) async {
    await methodChannel.invokeMethod<String>('requestAndPlay', {
      'bannerType': switch (bannerType) {
        BannerType.rectangleBanner => 'MEDIUM_RECTANGLE',
        BannerType.leaderboardBanner => 'MOBILE_LEADERBOARD',
        BannerType.noBanner => 'NO_BANNER',
      },
      'skipable': skipable,
    });
  }
}
