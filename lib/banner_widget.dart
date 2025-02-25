import 'package:audiomob/banner_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BannerWidget extends StatelessWidget {
  final BannerType bannerType;

  const BannerWidget({super.key, required this.bannerType});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: const AndroidView(
        viewType: "audiomob_banner_view",
        creationParams: {},
        creationParamsCodec: StandardMessageCodec(),
      ),
    );
  }
}
