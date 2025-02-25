import 'package:audiomob/banner_type.dart';
import 'package:audiomob/banner_widget.dart';

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
  BannerType _bannerType = BannerType.rectangleBanner;
  final _audiomobPlugin = Audiomob();

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
                onPressed: () {
                  _audiomobPlugin.requestAndPlay(BannerType.noBanner, false);
                  setState(() {
                    _bannerType = BannerType.noBanner;
                  });
                },
                child: const Text("not skipable | no banner"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _audiomobPlugin.requestAndPlay(
                      BannerType.rectangleBanner, false);
                  setState(() {
                    _bannerType = BannerType.rectangleBanner;
                  });
                },
                child: const Text("not skipable | rectangle"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _audiomobPlugin.requestAndPlay(
                      BannerType.leaderboardBanner, false);
                  setState(() {
                    _bannerType = BannerType.leaderboardBanner;
                  });
                },
                child: const Text("not skipable | leaderboard"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _audiomobPlugin.requestAndPlay(BannerType.noBanner, true);
                  setState(() {
                    _bannerType = BannerType.noBanner;
                  });
                },
                child: const Text("skipable | no banner"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _audiomobPlugin.requestAndPlay(
                      BannerType.rectangleBanner, true);
                  setState(() {
                    _bannerType = BannerType.rectangleBanner;
                  });
                },
                child: const Text("skipable | rectangle"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _audiomobPlugin.requestAndPlay(
                      BannerType.leaderboardBanner, true);
                  setState(() {
                    _bannerType = BannerType.leaderboardBanner;
                  });
                },
                child: const Text("skipable | leaderboard"),
              ),
              const SizedBox(height: 20),
              BannerWidget(bannerType: _bannerType),
            ],
          ),
        ),
      ),
    );
  }
}
