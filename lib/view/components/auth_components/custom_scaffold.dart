import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';

class CustomScaffold extends StatelessWidget {
  const CustomScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PositionedDirectional(child: Stack(
          children: [
            SvgPicture.asset(AppAssets.topLeftEclipse),
            SvgPicture.asset(AppAssets.halfCircle)
          ],
        ))
      ],
    );
  }
}
