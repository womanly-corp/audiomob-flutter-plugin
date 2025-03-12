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
