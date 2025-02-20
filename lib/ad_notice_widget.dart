import 'package:audiomob/banner_type.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class BannerWidget extends StatelessWidget {
  final BannerType bannerType;

  const BannerWidget({super.key, required this.bannerType});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 320,
      height: 50,
      child: AndroidView(
        viewType: "audiomob_ad_notice_view",
        creationParamsCodec: StandardMessageCodec(),
      ),
    );
  }
}
