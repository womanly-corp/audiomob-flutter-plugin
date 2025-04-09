import 'package:audiomob/audiomob.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _audiomobPlugin = Audiomob.instance;
  bool _isInitialized = false;
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _audiomobPlugin.init(
        apiKey: 'YOUR_API_KEY',
        bundleId: 'com.example.app',
        isBackgroundModeEnabled: true,
      );
      _audiomobPlugin.setListener(SampleListener());
      setState(() => _isInitialized = true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: _isInitialized
              ? Column(
                  children: [
                    ElevatedButton(
                      onPressed: () =>
                          _audiomobPlugin.getAdAvailability(Placement.rewarded),
                      child: const Text("getAdAvailability"),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => _audiomobPlugin.requestAndPlay(),
                      child: const Text("request and play"),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => _audiomobPlugin.pause(),
                      child: const Text("pause"),
                    ),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      onPressed: () => _audiomobPlugin.resume(),
                      child: const Text("resume"),
                    ),
                    const SizedBox(height: 12),
                  ],
                )
              : const Text('Initializing...'),
        ),
      ),
    );
  }
}

class SampleListener extends AudiomobEventListener {
  @override
  void onAdRequestStarted() {
    print('onAdRequestStarted');
  }

  @override
  void onAdPlaybackCompleted(AdPlaybackResult adPlaybackResult) {
    print('onAdPlaybackCompleted: adPlaybackResult = $adPlaybackResult');
  }

  @override
  void onAdPlaybackPaused(AdPauseReason pauseReason) {
    print('onAdPlaybackPaused: pauseReason = $pauseReason');
  }

  @override
  void onAdPlaybackResumed() {
    print('onAdPlaybackResumed');
  }

  @override
  void onAdPlaybackStarted(AudioAd audioAd) {
    print('onAdPlaybackStarted: audioAd = $audioAd');
  }

  @override
  void onAdRequestCompleted(AdRequestResult adRequestResult, AudioAd? audioAd) {
    print(
        'onAdRequestCompleted: adRequestResult = $adRequestResult, audioAd = $audioAd');
  }
}
