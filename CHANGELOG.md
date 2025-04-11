## 0.0.3

### Breaking Changes

- Renamed package from 'audiomob' to 'audioadmob'
- Updated Android package name from `com.wromance.audiomob` to `com.wromance.plugins.audioadmob`

### Android Changes

- Added Audiomob SDK v3.0.0 integration
- Updated build configurations:
  - Upgraded compileSdk to 35
  - Set ndkVersion to "27.0.12077973"
  - Updated Java compatibility to VERSION_17
  - Updated com.android.application plugin to 8.9.1
  - Updated org.jetbrains.kotlin.android plugin to 2.1.20
  - Updated Gradle distribution to 8.13
- Implemented core functionality:
  - Added AudiomobFlutterPlugin with SDK integration
  - Added AudiomobHostApi for plugin interaction
  - Added AudiomobObserverApiImpl for callback handling
  - Added support for audio ad requests and playback
  - Added lifecycle management and coroutine handling

### Plugin Architecture

- Pigeon now generates the Android and iOS code from the `audiomob.dart` file and uses the `AudiomobFlutterPlugin` class to interact with the native code.
- More documentation is available for api, readme

## 0.0.1

- Initial release
