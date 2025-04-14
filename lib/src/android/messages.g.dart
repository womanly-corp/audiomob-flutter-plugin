// Copyright 2025 Womanly Corp. All rights reserved.
// Use of this source code is governed by a license that can be
// found in the LICENSE file.
// Autogenerated from Pigeon (v25.3.0), do not edit directly.
// See also: https://pub.dev/packages/pigeon
// ignore_for_file: public_member_api_docs, non_constant_identifier_names, avoid_as, unused_import, unnecessary_parenthesis, prefer_null_aware_operators, omit_local_variable_types, unused_shown_name, unnecessary_import, no_leading_underscores_for_local_identifiers

import 'dart:async';
import 'dart:typed_data' show Float64List, Int32List, Int64List, Uint8List;

import 'package:flutter/foundation.dart' show ReadBuffer, WriteBuffer;
import 'package:flutter/services.dart';

PlatformException _createConnectionError(String channelName) {
  return PlatformException(
    code: 'channel-error',
    message: 'Unable to establish connection on channel: "$channelName".',
  );
}

List<Object?> wrapResponse({Object? result, PlatformException? error, bool empty = false}) {
  if (empty) {
    return <Object?>[];
  }
  if (error == null) {
    return <Object?>[result];
  }
  return <Object?>[error.code, error.message, error.details];
}
bool _deepEquals(Object? a, Object? b) {
  if (a is List && b is List) {
    return a.length == b.length &&
        a.indexed
        .every(((int, dynamic) item) => _deepEquals(item.$2, b[item.$1]));
  }
  if (a is Map && b is Map) {
    return a.length == b.length && a.entries.every((MapEntry<Object?, Object?> entry) =>
        (b as Map<Object?, Object?>).containsKey(entry.key) &&
        _deepEquals(entry.value, b[entry.key]));
  }
  return a == b;
}


/// Results of an audio ad request
enum AdRequestResult {
  /// The audio ad request completed as an audio ad is ready to play
  finished,
  /// There was no ad found for this user
  noAdAvailable,
  /// The user has reached the maximum number of ads for this session
  frequencyCapReached,
  /// The audio ad request failed due to an error
  failed,
  /// The skippble ad was not requested as the device volume is not audible
  skippableRequestVolumeNotAudible,
  /// Unknown result
  unknown,
}

enum AdPauseReason {
  /// The user has lowered the phone volume
  phoneVolumeLowered,
  /// The user has called the pause method
  pauseMethodCalled,
  /// The app is in the background
  appInBackground,
}

/// Results of an audio ad playback
enum AdPlaybackResult {
  /// The audio ad playback has finished (the user can now be given a reward)
  finished,
  /// The audio ad was stopped by the 'stopAd' function
  stopped,
  /// The audio ad playback failed due to an error
  failed,
  /// The ad was canceled by the user before it started
  canceled,
  /// The audio ad playback was skipped by the user
  skipped,
}

enum Placement {
  rewarded,
  skippable,
}

enum BannerSize {
  noBanner,
  mediumRectangle,
  mobileLeaderboard,
}

/// Information about ad availability
class AdAvailability {
  AdAvailability({
    this.adsAvailable = false,
    this.estimatedRevenue = 0,
    this.estimatedCpm = 0,
    this.geo = '',
  });

  /// An estimation of whether or not you will receive ads in this region
  bool adsAvailable;

  /// Estimated revenue for an ad (if an impression is detected)
  double estimatedRevenue;

  /// Estimated Cost Per Thousand Impressions for an ad (if an impression is detected)
  double estimatedCpm;

  /// The ISO 3166 alpha-2 country code of the region the user is in
  String geo;

  List<Object?> _toList() {
    return <Object?>[
      adsAvailable,
      estimatedRevenue,
      estimatedCpm,
      geo,
    ];
  }

  Object encode() {
    return _toList();  }

  static AdAvailability decode(Object result) {
    result as List<Object?>;
    return AdAvailability(
      adsAvailable: result[0]! as bool,
      estimatedRevenue: result[1]! as double,
      estimatedCpm: result[2]! as double,
      geo: result[3]! as String,
    );
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (other is! AdAvailability || other.runtimeType != runtimeType) {
      return false;
    }
    if (identical(this, other)) {
      return true;
    }
    return _deepEquals(encode(), other.encode());
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => Object.hashAll(_toList())
;
}

/// Information about an audio ad
class AudioAd {
  AudioAd({
    this.id = '',
    this.estimatedCpm = 0,
    this.estimatedRevenue = 0,
    this.durationInSeconds = 0,
  });

  /// The unique id of this audio ad
  String id;

  /// Estimated Cost Per Thousand Impressions for this ad (if an impression is detected)
  double estimatedCpm;

  /// Estimated revenue for an ad (if an impression is detected)
  double estimatedRevenue;

  /// The duration of the ad
  int durationInSeconds;

  List<Object?> _toList() {
    return <Object?>[
      id,
      estimatedCpm,
      estimatedRevenue,
      durationInSeconds,
    ];
  }

  Object encode() {
    return _toList();  }

  static AudioAd decode(Object result) {
    result as List<Object?>;
    return AudioAd(
      id: result[0]! as String,
      estimatedCpm: result[1]! as double,
      estimatedRevenue: result[2]! as double,
      durationInSeconds: result[3]! as int,
    );
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  bool operator ==(Object other) {
    if (other is! AudioAd || other.runtimeType != runtimeType) {
      return false;
    }
    if (identical(this, other)) {
      return true;
    }
    return _deepEquals(encode(), other.encode());
  }

  @override
  // ignore: avoid_equals_and_hash_code_on_mutable_classes
  int get hashCode => Object.hashAll(_toList())
;
}


class _PigeonCodec extends StandardMessageCodec {
  const _PigeonCodec();
  @override
  void writeValue(WriteBuffer buffer, Object? value) {
    if (value is int) {
      buffer.putUint8(4);
      buffer.putInt64(value);
    }    else if (value is AdRequestResult) {
      buffer.putUint8(129);
      writeValue(buffer, value.index);
    }    else if (value is AdPauseReason) {
      buffer.putUint8(130);
      writeValue(buffer, value.index);
    }    else if (value is AdPlaybackResult) {
      buffer.putUint8(131);
      writeValue(buffer, value.index);
    }    else if (value is Placement) {
      buffer.putUint8(132);
      writeValue(buffer, value.index);
    }    else if (value is BannerSize) {
      buffer.putUint8(133);
      writeValue(buffer, value.index);
    }    else if (value is AdAvailability) {
      buffer.putUint8(134);
      writeValue(buffer, value.encode());
    }    else if (value is AudioAd) {
      buffer.putUint8(135);
      writeValue(buffer, value.encode());
    } else {
      super.writeValue(buffer, value);
    }
  }

  @override
  Object? readValueOfType(int type, ReadBuffer buffer) {
    switch (type) {
      case 129: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : AdRequestResult.values[value];
      case 130: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : AdPauseReason.values[value];
      case 131: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : AdPlaybackResult.values[value];
      case 132: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : Placement.values[value];
      case 133: 
        final int? value = readValue(buffer) as int?;
        return value == null ? null : BannerSize.values[value];
      case 134: 
        return AdAvailability.decode(readValue(buffer)!);
      case 135: 
        return AudioAd.decode(readValue(buffer)!);
      default:
        return super.readValueOfType(type, buffer);
    }
  }
}

/// Flutter API Interface for Audiomob callbacks
abstract class AudiomobObserverApi {
  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  /// The audio ad request has started
  void onAdRequestStarted();

  /// The audio ad request completed as an audio ad is ready to play
  void onAdRequestCompleted(AdRequestResult adRequestResult, AudioAd? result);

  /// The audio ad playback has started
  void onAdPlaybackStarted(AudioAd result);

  /// The audio ad playback has finished (the user can now be given a reward)
  void onAdPlaybackCompleted(AdPlaybackResult adPlaybackResult);

  /// The audio ad playback is paused
  void onAdPlaybackPaused(AdPauseReason adPauseReason);

  /// Audio ad playback is resumed
  void onAdPlaybackResumed();

  /// The ad availability request completed and has Ad Availability object
  void onAdAvailabilityRetrieved(AdAvailability result);

  static void setUp(AudiomobObserverApi? api, {BinaryMessenger? binaryMessenger, String messageChannelSuffix = '',}) {
    messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdRequestStarted$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          try {
            api.onAdRequestStarted();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdRequestCompleted$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdRequestCompleted was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AdRequestResult? arg_adRequestResult = (args[0] as AdRequestResult?);
          assert(arg_adRequestResult != null,
              'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdRequestCompleted was null, expected non-null AdRequestResult.');
          final AudioAd? arg_result = (args[1] as AudioAd?);
          try {
            api.onAdRequestCompleted(arg_adRequestResult!, arg_result);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackStarted$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackStarted was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AudioAd? arg_result = (args[0] as AudioAd?);
          assert(arg_result != null,
              'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackStarted was null, expected non-null AudioAd.');
          try {
            api.onAdPlaybackStarted(arg_result!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackCompleted$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackCompleted was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AdPlaybackResult? arg_adPlaybackResult = (args[0] as AdPlaybackResult?);
          assert(arg_adPlaybackResult != null,
              'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackCompleted was null, expected non-null AdPlaybackResult.');
          try {
            api.onAdPlaybackCompleted(arg_adPlaybackResult!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackPaused$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackPaused was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AdPauseReason? arg_adPauseReason = (args[0] as AdPauseReason?);
          assert(arg_adPauseReason != null,
              'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackPaused was null, expected non-null AdPauseReason.');
          try {
            api.onAdPlaybackPaused(arg_adPauseReason!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdPlaybackResumed$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          try {
            api.onAdPlaybackResumed();
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
    {
      final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
          'dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdAvailabilityRetrieved$messageChannelSuffix', pigeonChannelCodec,
          binaryMessenger: binaryMessenger);
      if (api == null) {
        pigeonVar_channel.setMessageHandler(null);
      } else {
        pigeonVar_channel.setMessageHandler((Object? message) async {
          assert(message != null,
          'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdAvailabilityRetrieved was null.');
          final List<Object?> args = (message as List<Object?>?)!;
          final AdAvailability? arg_result = (args[0] as AdAvailability?);
          assert(arg_result != null,
              'Argument for dev.flutter.pigeon.audioadmob.AudiomobObserverApi.onAdAvailabilityRetrieved was null, expected non-null AdAvailability.');
          try {
            api.onAdAvailabilityRetrieved(arg_result!);
            return wrapResponse(empty: true);
          } on PlatformException catch (e) {
            return wrapResponse(error: e);
          }          catch (e) {
            return wrapResponse(error: PlatformException(code: 'error', message: e.toString()));
          }
        });
      }
    }
  }
}

/// Host API Interface for Audiomob
class AudiomobHostApi {
  /// Constructor for [AudiomobHostApi].  The [binaryMessenger] named argument is
  /// available for dependency injection.  If it is left null, the default
  /// BinaryMessenger will be used which routes to the host platform.
  AudiomobHostApi({BinaryMessenger? binaryMessenger, String messageChannelSuffix = ''})
      : pigeonVar_binaryMessenger = binaryMessenger,
        pigeonVar_messageChannelSuffix = messageChannelSuffix.isNotEmpty ? '.$messageChannelSuffix' : '';
  final BinaryMessenger? pigeonVar_binaryMessenger;

  static const MessageCodec<Object?> pigeonChannelCodec = _PigeonCodec();

  final String pigeonVar_messageChannelSuffix;

  /// Initializes the Audiomob Android SDK
  Future<void> initialize(String apiKey, String bundleId, bool backgroundModeEnabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.initialize$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[apiKey, bundleId, backgroundModeEnabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Requests a background audio ad and begins the ad playback as soon as it's ready
  Future<void> requestAndPlayAd() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.requestAndPlayAd$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Pauses the SDK's lifecycle, call this method when the app goes into the background (non-background ads only)
  Future<void> pauseLifeCycle() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.pauseLifeCycle$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Resumes the SDK's lifecycle, call this method when the app comes into the foreground (non-background ads only)
  Future<void> resumeLifeCycle() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.resumeLifeCycle$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Releases resources used by Audiomob, ensure to call this function when the context is destroyed
  Future<void> release() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.release$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Starts the asynchronous call to get the AdAvailability information
  Future<void> getAdAvailability(Placement placement) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.getAdAvailability$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[placement]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Pauses the playing audio ad
  Future<void> pauseAd() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.pauseAd$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Resumes the paused audio ad
  Future<void> resumePausedAd() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.resumePausedAd$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Stops the audio ad playback
  Future<void> stopAd() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.stopAd$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Returns true if the ad playback is in progress
  Future<bool> hasAdBegunPlaying() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.hasAdBegunPlaying$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Return true if the ad is paused
  Future<bool> isAdPaused() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.isAdPaused$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as bool?)!;
    }
  }

  /// Returns the seconds remaining for the ad that is currently playing
  Future<double> getTimeRemaining() async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.getTimeRemaining$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(null);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else if (pigeonVar_replyList[0] == null) {
      throw PlatformException(
        code: 'null-error',
        message: 'Host platform returned null value for non-null return value.',
      );
    } else {
      return (pigeonVar_replyList[0] as double?)!;
    }
  }

  /// If set as true, the server will return test ads even if live ads are enabled on the dashboard
  Future<void> setForceTestAds(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setForceTestAds$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// If set as true, and user has given the permission, SDK will fetch latitude and longitude and send in ad request
  Future<void> setSendGeoLocation(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setSendGeoLocation$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sets whether or not to send the user's Android Advertising Id with the ad request if it's available
  Future<void> setSendAdvertisingId(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setSendAdvertisingId$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sets whether or not to send the Android ID as a fallback ID if the Android Advertising Id is not available
  Future<void> setSendAndroidIdAsAFallback(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setSendAndroidIdAsAFallback$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sets whether or not to not send any device ID in the ad request if the Android Advertising Id is not available
  Future<void> setDoNotSendAnyDeviceIdsForNonConsentedUsers(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setDoNotSendAnyDeviceIdsForNonConsentedUsers$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sets whether or not to send consent strings set by a Consent Management Platform or in SharedPreferences
  Future<void> setSendConsentStrings(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setSendConsentStrings$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }

  /// Sets whether or not to only send contextual signals in the ad request
  Future<void> setOnlySendContextualSignals(bool enabled) async {
    final String pigeonVar_channelName = 'dev.flutter.pigeon.audioadmob.AudiomobHostApi.setOnlySendContextualSignals$pigeonVar_messageChannelSuffix';
    final BasicMessageChannel<Object?> pigeonVar_channel = BasicMessageChannel<Object?>(
      pigeonVar_channelName,
      pigeonChannelCodec,
      binaryMessenger: pigeonVar_binaryMessenger,
    );
    final Future<Object?> pigeonVar_sendFuture = pigeonVar_channel.send(<Object?>[enabled]);
    final List<Object?>? pigeonVar_replyList =
        await pigeonVar_sendFuture as List<Object?>?;
    if (pigeonVar_replyList == null) {
      throw _createConnectionError(pigeonVar_channelName);
    } else if (pigeonVar_replyList.length > 1) {
      throw PlatformException(
        code: pigeonVar_replyList[0]! as String,
        message: pigeonVar_replyList[1] as String?,
        details: pigeonVar_replyList[2],
      );
    } else {
      return;
    }
  }
}
