import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant/view/screens/home_screen/home_screen.dart';
import 'package:restaurant/view/screens/welcome_screen/welcome_screen.dart';
import 'package:restaurant/view_model/utils/app_assets/app_assets.dart';
import 'package:restaurant/view_model/utils/app_colors/app_colors.dart';

import '../../../view_model/utils/navigation/navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigation.pushAndRemove(context, const HomeScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.orange,
      body: Center(
        child: Center(
          child: SvgPicture.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
