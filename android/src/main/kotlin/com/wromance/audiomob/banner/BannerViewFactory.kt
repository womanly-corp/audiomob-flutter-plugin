import android.content.Context
import android.view.View
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class BannerViewFactory(private val messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, id: Int, args: Any?): PlatformView {
        val params = args as? Map<String, Any>
        val type = BannerType.fromValue(params?.get("bannerType") as? String ?: "rectangleBanner")

        return object : PlatformView {
            override fun getView(): View = BannerManager.getBanner() ?: BannerView(context, null)
            override fun dispose() {}
        }.also {
            BannerManager.updateBanner(type)
        }
    }
}
