# Audiomob Flutter Plugin

## Description

Audiomob is a Flutter plugin that enables audio ad monetization via [Audiomob](https://audiomob.com/). This plugin allows Flutter applications to integrate Audiomob's audio advertising SDK.

## Installation

1. Add `audiomob` to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     audiomob:
       git:
         url: https://github.com/womanly-corp/audiomob-flutter-plugin
   ```
2. Run `flutter pub get` to install the dependencies.

3. Add new folder `audiomob-plugin` to your android project:
4. Add new file - `audiomob-plugin/build.gradle.kts`:

```gradle.kts
configurations.maybeCreate("default")
artifacts.add("default", file("AudiomobSDK_v3.0.0.aar"))


//Change group to whatever you want. Here I'm using the package from the aar that I'm importing from
group = "com.audiomobplugin"
```

5. Add the following to your `settings.gradle`, before `include ':app'`:

```gradle
include ':audiomob-plugin'
include ':app'
```

6. Add your `AudiomobSDK_v3.0.0.aar` file to the `audiomob-plugin` folder.

## Usage

### Import the Package

```dart
import 'package:audiomob/audiomob.dart';
```

### Initialize the Plugin

```dart
Audiomob.init(apiKey: "your_api_key", bundleId: "your_bundle_id", isBackgroundModeEnabled: true);
```

### Request and Play an Ad

```dart
Audiomob.requestAndPlay();
```

### Pause and Resume Ads

```dart
Audiomob.pause();
Audiomob.resume();
```

## Android Integration

This plugin is currently only implemented for Android. Ensure you have the necessary permissions in your `AndroidManifest.xml`:

```xml
<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE"/>
```
