import 'package:audiomob/banner_type.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audiomob_method_channel.dart';

abstract class AudiomobPlatform extends PlatformInterface {
  /// Constructs a AudiomobPlatform.
  AudiomobPlatform() : super(token: _token);

  static final Object _token = Object();

  static AudiomobPlatform _instance = MethodChannelAudiomob();

  /// The default instance of [AudiomobPlatform] to use.
  ///
  /// Defaults to [MethodChannelAudiomob].
  static AudiomobPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AudiomobPlatform] when
  /// they register themselves.
  static set instance(AudiomobPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  EventChannel get eventChannel;

  Future<void> requestAndPlay(BannerType bannerType, bool skipable) {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
