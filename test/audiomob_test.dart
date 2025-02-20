import 'package:flutter_test/flutter_test.dart';
import 'package:audiomob/audiomob.dart';
import 'package:audiomob/audiomob_platform_interface.dart';
import 'package:audiomob/audiomob_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAudiomobPlatform
    with MockPlatformInterfaceMixin
    implements AudiomobPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final AudiomobPlatform initialPlatform = AudiomobPlatform.instance;

  test('$MethodChannelAudiomob is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAudiomob>());
  });

  test('getPlatformVersion', () async {
    Audiomob audiomobPlugin = Audiomob();
    MockAudiomobPlatform fakePlatform = MockAudiomobPlatform();
    AudiomobPlatform.instance = fakePlatform;

    expect(await audiomobPlugin.getPlatformVersion(), '42');
  });
}
