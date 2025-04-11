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
- 🎮 Perfect for games and apps

Currently, only Android is supported. Skippable ads and ui banners are not supported yet.

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

3. Setup Android plugin in your Flutter project to provide private AAR file:

   a. Create new folder `audiomob-plugin` in your Android project (use path `android`).

   b. Add `audiomob-plugin/build.gradle.kts` to the new `audiomob-plugin` folder with the following content:

   ```gradle.kts
   configurations.maybeCreate("default")
   artifacts.add("default", file("AudiomobSDK_v3.0.0.aar"))

   group = "com.audiomobplugin"
   ```

   c. Add `AudiomobSDK_v3.0.0.aar` to the `audiomob-plugin` folder

   d. Add `include ':audiomob-plugin'` to your android root `settings.gradle`:

   ```gradle
   include ':audiomob-plugin'
   include ':app'
   ```

4. Add required permissions to `AndroidManifest.xml`:

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

### Core Methods

| Method              | Description                                                                       | Throws                              |
| ------------------- | --------------------------------------------------------------------------------- | ----------------------------------- |
| `Audiomob.instance` | Singleton instance of Audiomob                                                    | -                                   |
| `init`              | Initializes the Audiomob SDK with API key, bundle ID and background mode settings | `UnimplementedError` if not Android |
| `setListener`       | Sets event listener for Audiomob events                                           | -                                   |
| `dispose`           | Cleans up resources                                                               | -                                   |

### Ad Management Methods

| Method           | Description              | Throws                            |
| ---------------- | ------------------------ | --------------------------------- |
| `requestAndPlay` | Requests and plays an ad | `AudiomobNotInitializedException` |
| `pause`          | Pauses current ad        | `AudiomobNotInitializedException` |
| `resume`         | Resumes paused ad        | `AudiomobNotInitializedException` |
| `stop`           | Stops current ad         | `AudiomobNotInitializedException` |

### State Properties

| Property            | Description                        |
| ------------------- | ---------------------------------- |
| `isInitialized`     | Whether SDK is initialized         |
| `hasAdBegunPlaying` | Whether ad playback is in progress |
| `isAdPaused`        | Whether ad is paused               |
| `timeRemaining`     | Seconds remaining in current ad    |

### Configuration Methods

| Method                                         | Description                                        |
| ---------------------------------------------- | -------------------------------------------------- |
| `setForceTestAds`                              | Forces test ads even if live ads enabled           |
| `setSendGeoLocation`                           | Controls sending user location                     |
| `setSendAdvertisingId`                         | Controls sending Android Advertising ID            |
| `setSendAndroidIdAsAFallback`                  | Controls using Android ID as fallback              |
| `setDoNotSendAnyDeviceIdsForNonConsentedUsers` | Controls device ID sending for non-consented users |
| `setSendConsentStrings`                        | Controls sending consent strings                   |
| `setOnlySendContextualSignals`                 | Controls sending only contextual signals           |

### Ad Availability

| Method              | Description                                  | Throws                            |
| ------------------- | -------------------------------------------- | --------------------------------- |
| `getAdAvailability` | Checks ad availability for a given placement | `AudiomobNotInitializedException` |

For more detailed documentation how API works, please refer to [Snapshot of API Documentation (2025-04-10)](api_docs.md) or [AudioMob SDK Documentation](https://audiomob.com).

## License

This package is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Support

- 🎧 [AudioMob website](https://audiomob.com/)
- 🐛 [Issue Tracker](https://github.com/womanly-corp/audiomob-flutter-plugin/issues)
- 📚 [Snapshot of API Documentation (2025-04-10)](api_docs.md)
- 📝 [Changelog](CHANGELOG.md)

## Acknowledgments

- [AudioMob](https://audiomob.com/) for their excellent audio advertising SDK

---

<p align="center">
  <p align="center">
    Built and maintained by <a href="https://womanly.com">Womanly Corp</a>.
  </p>
</p>
