import android.view.View
import android.widget.TextView
import androidx.constraintlayout.widget.ConstraintLayout
import com.wromance.audiomob.R

object AdNoticeManager {
    private var adNoticeView: ConstraintLayout? = null

    fun registerAdNotice(view: ConstraintLayout) {
        adNoticeView = view
    }

    fun getAdNotice(): ConstraintLayout? = adNoticeView

    fun updateVisibility(isVisible: Boolean) {
        adNoticeView?.let { view ->
            view.findViewById<TextView>(R.id.audiomob_ad_playing_notice)?.visibility =
                if (isVisible) View.VISIBLE else View.INVISIBLE
        }
    }
}
