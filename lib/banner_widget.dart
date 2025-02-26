import 'package:audiomob/banner_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key});

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
