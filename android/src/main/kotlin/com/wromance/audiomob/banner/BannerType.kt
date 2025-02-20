enum class BannerType(val value: String) {
    RECTANGLE("rectangleBanner"),
    LEADERBOARD("leaderboardBanner"),
    NOBANNER("noBanner");

    companion object {
        fun fromValue(value: String?): BannerType {
            return values().firstOrNull { it.value == value } ?: RECTANGLE
        }
    }
}