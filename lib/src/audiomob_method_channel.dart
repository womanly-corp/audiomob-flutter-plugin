import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'audiomob_event_listener.dart';

class MethodChannelAudiomob extends PlatformInterface {
  MethodChannelAudiomob() : super(token: _token);

  static final _token = Object();

  static var _instance = MethodChannelAudiomob();

  static MethodChannelAudiomob get instance => _instance;

  static set instance(final MethodChannelAudiomob instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  @visibleForTesting
  final methodChannel = const MethodChannel('audiomob');

  final eventChannel = const EventChannel('audiomob/events');

  Future<void> init({
    required final String apiKey,
    required final String bundleId,
    required final bool isBackgroundModeEnabled,
  }) async {
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

  Future<void> getAdAvailability(final Placement placement) async {
    await methodChannel.invokeMethod<String>(
      'getAdAvailability',
      {'placement': placement.name},
    );
  }
}
