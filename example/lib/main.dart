import 'package:audiomob/audiomob.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
  String _isAdAvailable = '';
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await _audiomobPlugin.init(
        /// use environment variable .env file
        /// or --dart-define=API_KEY=your_api_key to set the api key
        apiKey: const String.fromEnvironment('API_KEY'),
        bundleId: const String.fromEnvironment('BUNDLE_ID'),
        isBackgroundModeEnabled: true,
      );
      await _audiomobPlugin.setForceTestAds(true);
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
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () async {
                            final adAvailability = await _audiomobPlugin
                                .getAdAvailability(Placement.rewarded);
                            setState(() {
                              _isAdAvailable =
                                  'adsAvailable: ${adAvailability.adsAvailable}'
                                  'estimatedCpm: ${adAvailability.estimatedCpm}'
                                  'estimatedRevenue: ${adAvailability.estimatedRevenue}'
                                  'geo: ${adAvailability.geo}';
                            });
                          },
                          child: const Text("getAdAvailability"),
                        ),
                        Flexible(child: Text(_isAdAvailable.toString())),
                      ],
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
