# AudioMob Flutter

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Flutter](https://img.shields.io/badge/Flutter-3.x-blue.svg)](https://flutter.dev)
[![Pub Version](https://img.shields.io/badge/version-0.0.3-blue)](https://github.com/womanly-corp/audiomob-flutter-plugin)

## Overview

AudioMob Flutter is a wrapper API over native [AudioMob SDK](https://audiomob.com/) for seamless audio ad monetization in Flutter applications.

⚠️ This project is still in its early stages, and some features may be missing or bugged.

## Features

- 🎵 Seamless audio ad integration
- 🔄 Background playback support (only)
- ⚡ Simple API for ad management
- 📱 Android platform support
- 🎮 Perfect for games and apps

## Installation

First, make sure you have access to the AudioMob SDK. If you don't have access, please go to [AudioMob](https://audiomob.com/) and sign up.

1. Add `audioadmob` to your `pubspec.yaml`:

   ```yaml
   dependencies:
     audioadmob:
       git:
         url: https://github.com/womanly-corp/audiomob-flutter-plugin
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Configure Android project in your Flutter project (required to provide private AAR file):

   a. Create new folder `audioadmob-plugin` in your Android project (use path `android`).

   b. Add `audioadmob-plugin/build.gradle.kts` to the new `audioadmob-plugin` folder.

   ```gradle.kts
   configurations.maybeCreate("default")
   artifacts.add("default", file("AudiomobSDK_v3.0.0.aar"))

   group = "com.audiomobplugin"
   ```

   c. Add `AudiomobSDK_v3.0.0.aar` to the `audiomob-plugin` folder

   d. Update your android root `settings.gradle`:

   ```gradle
   include ':audioadmob-plugin'
   include ':app'
   ```

   e. Add required permissions to `AndroidManifest.xml`:

   ```xml
   <uses-permission android:name="android.permission.INTERNET"/>
   <uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
   ```

## Troubleshooting

- Make sure you synced your project with Gradle files with Android Studio.
- Always verify that Ad is available using `getAdAvailability()` before calling `requestAndPlay()`.

## Usage

### Initialize the package

```dart
import 'package:audioadmob/audioadmob.dart';

// Initialize with your credentials
await Audiomob.instance.init(
  apiKey: "your_api_key",
  bundleId: "your_bundle_id",
  isBackgroundModeEnabled: true
);
```

## API Documentation

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 🐛 [Issue Tracker](https://github.com/womanly-corp/audiomob-flutter-plugin/issues)
- 📚 [Snapshot of API Documentation (2025-04-10)](api_docs.md)
- 📝 [Changelog](CHANGELOG.md)

## Acknowledgments

- [AudioMob](https://audiomob.com/) for their excellent audio advertising SDK
-

<p align="center">
  <p align="center">
    Built and maintained by <a href="https://womanly.com">Womanly Corp</a>.
  </p>
</p>
