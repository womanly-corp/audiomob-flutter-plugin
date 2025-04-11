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

All methods can throw `PlatformException` if error occurs on native side.

### Core Methods

| Method              | Description                                                                       | Throws                              |
| ------------------- | --------------------------------------------------------------------------------- | ----------------------------------- |
| `Audiomob.instance` | Singleton instance of Audiomob                                                    | -                                   |
| `init`              | Initializes the Audiomob SDK with API key, bundle ID and background mode settings | `UnimplementedError` if not Android |
| `setListener`       | Sets event listener for Audiomob events                                           | -                                   |
| `dispose`           | Cleans up resources                                                               | -                                   |

### Ad Management Methods

| Method           | Description                                          | Throws                            |
| ---------------- | ---------------------------------------------------- | --------------------------------- |
| `requestAndPlay` | Requests and plays an ad through the Audiomob plugin | `AudiomobNotInitializedException` |
| `pause`          | Pauses the currently playing ad                      | `AudiomobNotInitializedException` |
| `resume`         | Resumes playback of a paused ad                      | `AudiomobNotInitializedException` |
| `stop`           | Stop the currently playing ad                        | `AudiomobNotInitializedException` |

### State Properties

| Property            | Description                                                        |
| ------------------- | ------------------------------------------------------------------ |
| `isInitialized`     | Whether the Audiomob instance is initialized                       |
| `hasAdBegunPlaying` | Returns true if the ad playback is in progress                     |
| `isAdPaused`        | Return true if the ad is paused                                    |
| `timeRemaining`     | Returns the seconds remaining for the ad that is currently playing |

### Configuration Methods

| Method                                         | Description                                                                                                    |
| ---------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `setForceTestAds`                              | If set as true, the server will return test ads even if live ads are enabled on the dashboard                  |
| `setSendGeoLocation`                           | Sets whether or not to send the user's location with the ad request                                            |
| `setSendAdvertisingId`                         | Sets whether or not to send the user's Android Advertising Id with the ad request if it's available            |
| `setSendAndroidIdAsAFallback`                  | Sets whether or not to send the Android ID as a fallback ID if the Android Advertising Id is not available     |
| `setDoNotSendAnyDeviceIdsForNonConsentedUsers` | Sets whether or not to not send any device ID in the ad request if the Android Advertising Id is not available |
| `setSendConsentStrings`                        | Sets whether or not to send consent strings set by a Consent Management Platform or in SharedPreferences       |
| `setOnlySendContextualSignals`                 | Sets whether or not to only send contextual signals in the ad request                                          |

### Ad Availability

| Method              | Description                                                                                               | Throws                            |
| ------------------- | --------------------------------------------------------------------------------------------------------- | --------------------------------- |
| `getAdAvailability` | Gets the ad availability for a given placement. For background mode ads, always pass [Placement.rewarded] | `AudiomobNotInitializedException` |

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
