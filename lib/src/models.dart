import 'package:flutter/material.dart';

import 'android/messages.g.dart' as messages;

export 'android/messages.g.dart' show AudioAd;

/// Information about ad availability in a region
@immutable
class AdAvailability {
  /// Creates an [AdAvailability] instance
  const AdAvailability({
    this.adsAvailable = false,
    this.estimatedCpm = 0,
    this.geo = '',
    this.estimatedRevenue = 0,
  });

  /// Creates an [AdAvailability] from a message
  factory AdAvailability.fromMessage(final messages.AdAvailability model) =>
      AdAvailability(
        adsAvailable: model.adsAvailable ?? false,
        estimatedCpm: model.estimatedCpm ?? 0,
        geo: model.geo ?? '',
        estimatedRevenue: model.estimatedRevenue ?? 0,
      );

  /// An estimation of whether or not you will receive ads in this region
  final bool adsAvailable;

  /// Estimated Cost Per Thousand Impressions for an ad (if an impression is detected)
  final double estimatedCpm;

  /// The ISO 3166 alpha-2 country code of the region the user is in
  final String geo;

  /// Estimated revenue for an ad (if an impression is detected)
  final double estimatedRevenue;
}
