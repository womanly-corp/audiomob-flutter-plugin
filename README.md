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

3. Add new folder `libs` in the `android/src/` folder, so it will be `android/src/libs/`

4. Add your `audiomob.aar` file to the `libs` folder.

5. Add the following to the `android/build.gradle` file:

```gradle
repositories {
    flatDir {
        dirs 'libs'
    }
}
```

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
