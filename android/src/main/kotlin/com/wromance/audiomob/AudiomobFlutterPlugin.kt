package com.wromance.audiomob

import BannerViewFactory
import android.app.Activity
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.lifecycle.DefaultLifecycleObserver
import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleOwner
import com.audiomob.sdk.AudiomobPlugin
import com.audiomob.sdk.enums.BannerSize
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.embedding.engine.plugins.lifecycle.HiddenLifecycleReference
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

class AudiomobFlutterPlugin : FlutterPlugin, MethodCallHandler, ActivityAware,
    DefaultLifecycleObserver {
    private lateinit var audiomobPlugin: AudiomobPlugin
    private lateinit var channel: MethodChannel
    private lateinit var eventChannel: EventChannel
    private val audiomobListener = AudiomobPluginListener()
    private var activity: Activity? = null
    private var lifecycle: Lifecycle? = null
    private var unmutePromptView: View? = null


    companion object {
        // TODO check if BuildConfig available there
        val isAdsEnabled: Boolean
            get() = true
//            get() = BuildConfig.FLAVOR == "ads"
    }

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "audiomob")
        channel.setMethodCallHandler(this)


        eventChannel = EventChannel(flutterPluginBinding.binaryMessenger, "audiomob/events")
        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                audiomobListener.eventSink = events
            }

            override fun onCancel(arguments: Any?) {
                audiomobListener.eventSink = null
            }
        })

        if (!isAdsEnabled) return
        flutterPluginBinding.platformViewRegistry.registerViewFactory(
            "audiomob_banner_view",
            BannerViewFactory(flutterPluginBinding.binaryMessenger)
        )

        audiomobPlugin = AudiomobPlugin(flutterPluginBinding.applicationContext)
        // TODO HARDCODE
        // TODO check bundle id
        audiomobPlugin.initialise("YG3pZ95T7Wk9ZBj0EB9M", "com.wromance.mobile.ads", true)
        audiomobPlugin.setCallbacks(audiomobListener)
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        audiomobPlugin.release()
    }

    private fun inflateUnmutePrompt() {
        unmutePromptView?.let {
            (it.parent as? ViewGroup)?.removeView(it)
        }
        activity?.let { activity ->

            val rootView = activity.window.decorView.findViewById<ViewGroup>(android.R.id.content) //.children.firstOrNull()
            val inflater = LayoutInflater.from(activity)
            unmutePromptView = inflater.inflate(R.layout.unmute_prompt, rootView, false)

            rootView.addView(unmutePromptView) // Add to Activity’s view hierarchy
            unmutePromptView!!.bringToFront()
        }
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "requestAndPlay") {
            val bannerType = bannerSizeFromValue(call.argument<String>("bannerType"))
            val skipable = call.argument<Boolean>("skipable") ?: false

//            inflateUnmutePrompt()
//            val unmutePrompt = UnmutePromptConfiguration(
//                unmutePromptView!!.findViewById(R.id.audiomob_unmute_prompt),
//                unmutePromptView!!.findViewById(R.id.audiomob_unmute_prompt_text),
//                unmutePromptView!!.findViewById(R.id.audiomob_unmute_prompt_raise_volume_button),
//                unmutePromptView!!.findViewById(R.id.audiomob_unmute_prompt_stop_ad_button)
//            )
//
//            val adView = BannerManager.getRoot()!!
//            adView.configureBanner(bannerType)
//
//            printViewHierarchy(adView);
//
//            val countdownConfiguration = CountdownConfiguration(
//                adView.findViewById(R.id.audiomob_timer_text),
//                adView.findViewById(R.id.audiomob_timer_fill)
//            )
//
//            val adConfiguration = if (bannerType == BannerSize.NO_BANNER) {
//                if (skipable)
//                    SkippableAudioOnlyAdConfiguration(
//                        countdownConfiguration,
//                        BannerManager.getSkipButton()!!,
//                        BannerManager.getAdNoticeText()!!
//                    )
//                else RewardedAudioOnlyAdConfiguration(
//                    unmutePrompt,
//                    countdownConfiguration,
//                    BannerManager.getAdNoticeText()!!,
//                )
//            } else {
//                val bannerConfiguration = BannerConfiguration(
//                    bannerType,
//                    BannerManager.getBanner()!!
//                )
//                if (skipable)
//                    SkippableBannerAdConfiguration(
//                        bannerConfiguration,
//                        countdownConfiguration,
//                        BannerManager.getSkipButton()!!
//                    )
//                else
//                    RewardedBannerAdConfiguration(
//                        bannerConfiguration,
//                        unmutePrompt,
//                        countdownConfiguration
//                    )
//            }
//            audiomobPlugin.requestAndPlayAd(adConfiguration)
            audiomobPlugin.requestAndPlayAd()
            result.success(null)
        } else if (call.method == "pause") {
            if (audiomobListener.audioAd != null)
                audiomobPlugin.pauseAd()
            result.success(null)
        } else if (call.method == "resume") {
            if (audiomobListener.audioAd != null)
                audiomobPlugin.resumePausedAd()
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    private fun bannerSizeFromValue(size: String?): BannerSize {
        return BannerSize.values().firstOrNull { it.name == size } ?: BannerSize.MEDIUM_RECTANGLE
    }

    //// ActivityAware implementation
    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        if (!isAdsEnabled) return
        activity = binding.activity
        lifecycle = (binding.lifecycle as HiddenLifecycleReference).lifecycle
        lifecycle?.addObserver(this)
        inflateUnmutePrompt()
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        if (!isAdsEnabled) return
        activity = binding.activity
        lifecycle = (binding.lifecycle as HiddenLifecycleReference).lifecycle
        lifecycle?.addObserver(this)
        inflateUnmutePrompt()
    }

    override fun onDetachedFromActivity() {
        lifecycle?.removeObserver(this)
        lifecycle = null
        unmutePromptView = null
        activity = null
    }

    override fun onDetachedFromActivityForConfigChanges() {
        lifecycle?.removeObserver(this)
        lifecycle = null
        unmutePromptView = null
        activity = null
    }

    //// Application lifecycle observer

    override fun onStop(owner: LifecycleOwner) {
        super.onStop(owner)
        audiomobPlugin.pauseLifeCycle()
    }

    override fun onStart(owner: LifecycleOwner) {
        super.onStart(owner)
        audiomobPlugin.resumeLifeCycle()
    }



}


fun printViewHierarchy(view: View, indent: String = "") {
    val visibilityStatus = when (view.visibility) {
        View.VISIBLE -> "VISIBLE"
        View.INVISIBLE -> "INVISIBLE"
        View.GONE -> "GONE"
        else -> "UNKNOWN"
    }

    val width = view.width
    val height = view.height

    println("${indent}${view::class.java.simpleName}: visibility=$visibilityStatus, size=${width}x${height}")

    if (view is ViewGroup) {
        for (i in 0 until view.childCount) {
            printViewHierarchy(view.getChildAt(i), "$indent  ")
        }
    }
}