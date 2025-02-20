import android.content.res.Resources
import com.google.android.material.imageview.ShapeableImageView

object BannerManager {
    private var bannerView: ShapeableImageView? = null

    fun registerBanner(view: ShapeableImageView) {
        bannerView = view
    }

    fun getBanner(): ShapeableImageView? = bannerView

    fun updateBanner(type: BannerType) {
        bannerView?.let { view ->
            when (type) {
                BannerType.RECTANGLE -> {
                    view.layoutParams.width = 210.dpToPx()
                    view.layoutParams.height = 175.dpToPx()
                }
                BannerType.LEADERBOARD -> {
                    view.layoutParams.width = 320.dpToPx()
                    view.layoutParams.height = 50.dpToPx()
                }
            }
            view.requestLayout()
        }
    }

    private fun Int.dpToPx(): Int {
        return (this * Resources.getSystem().displayMetrics.density).toInt()
    }
}
