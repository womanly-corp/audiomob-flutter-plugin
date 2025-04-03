import 'package:audiomob/audiomob_event_listener.dart';
import 'package:flutter/material.dart';
import 'package:audiomob/audiomob.dart';

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
                onPressed: () => _audiomobPlugin.getAdAvailability(),
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
  void onAdAvailabilityRetrieved(AdAvailability result) {
    print('onAdAvailabilityRetrieved: result = $result');
  }

  void onAdRequestStarted() {
    print('onAdRequestStarted');
  }

  void onAdPlaybackCompleted(AdPlaybackResult adPlaybackResult) {
    print('onAdPlaybackCompleted: adPlaybackResult = $adPlaybackResult');
  }

  void onAdPlaybackPaused(PauseAdEnum pauseReason) {
    print('onAdPlaybackPaused: pauseReason = $pauseReason');
  }

  void onAdPlaybackResumed() {
    print('onAdPlaybackResumed');
  }

  void onAdPlaybackStarted(AudioAd audioAd) {
    print('onAdPlaybackStarted: audioAd = $audioAd');
  }

  void onAdRequestCompleted(AdRequestResult adRequestResult, AudioAd? audioAd) {
    print(
        'onAdRequestCompleted: adRequestResult = $adRequestResult, audioAd = $audioAd');
  }
}
