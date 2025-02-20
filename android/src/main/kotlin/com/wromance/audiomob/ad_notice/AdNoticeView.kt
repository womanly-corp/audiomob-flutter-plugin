import android.content.Context
import android.util.AttributeSet
import android.view.LayoutInflater
import androidx.constraintlayout.widget.ConstraintLayout
import com.wromance.audiomob.R

class AdNoticeView(context: Context, attrs: AttributeSet?) : ConstraintLayout(context, attrs) {
    init {
        LayoutInflater.from(context).inflate(R.layout.ad_playing_notice, this, true)
        AdNoticeManager.registerAdNotice(this) // Register the view globally
    }
}
