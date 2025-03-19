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

