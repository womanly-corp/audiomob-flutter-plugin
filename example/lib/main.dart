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
  final _audiomobPlugin = Audiomob()..setListener(SampleListener());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
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
          ),
        ),
      ),
    );
  }
}

class SampleListener extends AudiomobEventListener {
  @override
  void onAdAvailabilityRetrieved(AdAvailability result) {
    print('onAdAvailabilityRetrieved: result = $result');
  }

  @override
  void onAdRequestStarted() {
    print('onAdRequestStarted');
  }

  @override
  void onAdPlaybackCompleted(AdPlaybackResult adPlaybackResult) {
    print('onAdPlaybackCompleted: adPlaybackResult = $adPlaybackResult');
  }

  @override
  void onAdPlaybackPaused(PauseAdEnum pauseReason) {
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
