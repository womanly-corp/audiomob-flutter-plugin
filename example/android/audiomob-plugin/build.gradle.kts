// Original answer
// https://stackoverflow.com/questions/60878599/error-building-android-library-direct-local-aar-file-dependencies-are-not-supp

configurations.maybeCreate("default")
artifacts.add("default", file("AudiomobSDK_v3.0.0.aar"))


//Change group to whatever you want. Here I'm using the package from the aar that I'm importing from
group = "com.audiomobplugin"
