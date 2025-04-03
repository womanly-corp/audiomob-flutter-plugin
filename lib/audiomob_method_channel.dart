import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MethodChannelAudiomob extends PlatformInterface {
  MethodChannelAudiomob() : super(token: _token);

  static final Object _token = Object();

  static MethodChannelAudiomob _instance = MethodChannelAudiomob();

  static MethodChannelAudiomob get instance => _instance;

  static set instance(MethodChannelAudiomob instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('audiomob');

  final eventChannel = const EventChannel("audiomob/events");

  Future<void> init(
    String apiKey,
    String bundleId,
    bool isBackgroundModeEnabled,
  ) async {
    await methodChannel.invokeMethod<String>('init', {
      'apiKey': apiKey,
      'bundleId': bundleId,
      'isBackgroundModeEnabled': isBackgroundModeEnabled,
    });
  }

  Future<void> requestAndPlay() async {
    await methodChannel.invokeMethod<String>('requestAndPlay');
  }

  Future<void> pause() async {
    await methodChannel.invokeMethod<String>('pause');
  }

  Future<void> resume() async {
    await methodChannel.invokeMethod<String>('resume');
  }

  Future<void> getAdAvailability() async {
    await methodChannel.invokeMethod<String>('getAdAvailability');
  }
}
