import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.FrameLayout
import com.audiomob.sdk.enums.BannerSize
import com.google.android.material.imageview.ShapeableImageView
import com.wromance.audiomob.R

class BannerView(context: Context, attrs: AttributeSet?) : FrameLayout(context, attrs) {

    init {
        LayoutInflater.from(context).inflate(R.layout.banner_view, this, true)
        BannerManager.registerBanner(this) // Register banner globally
    }

    fun configureBanner(type: BannerSize) {
        removeAllViews()
        val layoutRes = when (type) {
            BannerSize.MEDIUM_RECTANGLE -> R.layout.banner_view
            BannerSize.MOBILE_LEADERBOARD -> R.layout.leaderboard
            BannerSize.NO_BANNER -> R.layout.ad_playing_notice
        }
        LayoutInflater.from(context).inflate(layoutRes, this, true)
    }
}
