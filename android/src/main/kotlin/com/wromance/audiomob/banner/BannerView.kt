import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import android.widget.FrameLayout
import com.google.android.material.imageview.ShapeableImageView
import com.wromance.audiomob.R

class BannerView(context: Context, attrs: AttributeSet?) : FrameLayout(context, attrs) {
    private val imageView: ShapeableImageView

    init {
        LayoutInflater.from(context).inflate(R.layout.banner_view, this, true)
        imageView = findViewById(R.id.banner_image)
        BannerManager.registerBanner(imageView) // Register banner globally
    }

    fun configureBanner(type: BannerType) {
        BannerManager.updateBanner(type) // Update the banner via manager
    }
}
