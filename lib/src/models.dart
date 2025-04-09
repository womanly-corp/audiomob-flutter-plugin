import 'package:flutter/material.dart';

import 'android/messages.g.dart' as messages;

export 'android/messages.g.dart' show AudioAd;

@immutable
class AdAvailability {
  const AdAvailability({
    this.adsAvailable = false,
    this.estimatedCpm = 0,
    this.geo = '',
    this.estimatedRevenue = 0,
  });

  factory AdAvailability.fromMessage(final messages.AdAvailability model) =>
      AdAvailability(
        adsAvailable: model.adsAvailable ?? false,
        estimatedCpm: model.estimatedCpm ?? 0,
        geo: model.geo ?? '',
        estimatedRevenue: model.estimatedRevenue ?? 0,
      );
  final bool adsAvailable;
  final double estimatedCpm;
  final String geo;
  final double estimatedRevenue;
}
