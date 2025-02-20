import 'package:audiomob/banner_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BannerWidget extends StatelessWidget {
  final BannerType bannerType;

  const BannerWidget({super.key, required this.bannerType});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: bannerType == BannerType.rectangleBanner ? 210 : 320,
      height: bannerType == BannerType.rectangleBanner ? 175 : 50,
      child: AndroidView(
        viewType: "audiomob_banner_view",
        creationParams: {"bannerType": bannerType.name},
        creationParamsCodec: const StandardMessageCodec(),
      ),
    );
  }
}
