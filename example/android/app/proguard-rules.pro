-keep class com.android.org.conscrypt.SSLParametersImpl { *; }
-keep class org.apache.harmony.xnet.provider.jsse.SSLParametersImpl { *; }
-keep class org.bouncycastle.jsse.BCSSLParameters { *; }
-keep class org.bouncycastle.jsse.BCSSLSocket { *; }
-keep class org.bouncycastle.jsse.provider.BouncyCastleJsseProvider { *; }
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class com.google.firebase.** { *; }
-keep class org.spongycastle.** { *; }
-dontwarn org.spongycastle.**
-keep class org.bouncycastle.** { *; }
-keep interface org.bouncycastle.**
-keep class org.conscrypt.** { *; }
-keep class io.netty.** { *; }
-dontwarn io.flutter.embedding.**
-ignorewarnings