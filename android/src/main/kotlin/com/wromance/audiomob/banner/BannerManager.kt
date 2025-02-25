import android.annotation.SuppressLint
import android.content.res.Resources
import android.view.View
import androidx.constraintlayout.widget.ConstraintLayout
import com.audiomob.sdk.enums.BannerSize
import com.google.android.material.imageview.ShapeableImageView
import com.wromance.audiomob.R

@SuppressLint("StaticFieldLeak")
object BannerManager {
    private var bannerView: BannerView? = null

    fun registerBanner(view: BannerView) {
        bannerView = view
    }

    fun getBanner(): ShapeableImageView? = bannerView?.findViewById(R.id.banner_image)
    fun getRoot(): BannerView? = bannerView
    fun getAdNoticeText(): View? = bannerView?.findViewById(R.id.audiomob_ad_playing_notice)
    fun getSkipButton(): View? = bannerView?.findViewById(R.id.audiomob_skip_button)


//    fun updateBanner(type: BannerSize) {
//        getBanner()?.let { view ->
//            when (type) {
//                BannerSize.MEDIUM_RECTANGLE -> {
//                    view.layoutParams.width = 210.dpToPx()
//                    view.layoutParams.height = 175.dpToPx()
//                }
//
//                BannerSize.MOBILE_LEADERBOARD -> {
//                    view.layoutParams.width = 320.dpToPx()
//                    view.layoutParams.height = 50.dpToPx()
//                }
//
//                else -> {
//                    view.visibility = View.GONE
//                }
//            }
//            view.requestLayout()
//        }
//    }

    private fun Int.dpToPx(): Int {
        return (this * Resources.getSystem().displayMetrics.density).toInt()
    }
}
