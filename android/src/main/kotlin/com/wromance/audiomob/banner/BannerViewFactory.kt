import android.content.Context
import android.view.View
import android.view.ViewGroup
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class BannerViewFactory(private val messenger: BinaryMessenger) :
    PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    override fun create(context: Context, id: Int, args: Any?): PlatformView {

        return object : PlatformView {
            override fun getView(): View {
                val banner = BannerManager.getRoot()
                if (banner?.parent != null) {
                    (banner.parent as? ViewGroup)?.removeView(banner)
                }
                return banner ?: BannerView(context, null)
            }
            override fun dispose() {}
        }
    }
}
