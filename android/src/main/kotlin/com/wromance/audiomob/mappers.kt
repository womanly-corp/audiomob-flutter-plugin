package com.wromance.audiomob

import com.audiomob.sdk.data.responses.AdAvailability
import com.audiomob.sdk.data.responses.AudioAd

fun AdAvailability.toMap(): Map<String, Any?> = mapOf(
    "adsAvailable" to adsAvailable,
    "estimatedCpm" to estimatedCpm,
    "estimatedRevenue" to estimatedRevenue,
    "geo" to geo,
)

fun AudioAd.toMap(): Map<String, Any?> = mapOf(
    "companionBanner" to companionBanner?.bannerSize?.name,
    "duration" to duration,
    "estimatedCpm" to estimatedCpm,
    "estimatedRevenue" to estimatedRevenue,
    "id" to id,
)


