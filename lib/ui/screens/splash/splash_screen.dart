import 'package:animation_wrappers/animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ride_evee/app/routes.dart';
import 'package:ride_evee/core/constants/my_assets.dart';

import '/core/constants/my_colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryColor,
      body: Center(
        child: FadedScaleAnimation(
          fadeDuration: const Duration(milliseconds: 3000),
          scaleCurve: Curves.easeInQuad,
          child: Image.asset(
            Assets.assetsImagesRideLogo,
            height: MediaQuery.of(context).size.height * 0.5.h,
            width: MediaQuery.of(context).size.width * 0.5.w,
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    moveToOnBoard();
    super.initState();
  }

  moveToOnBoard() async {
    await Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).pushNamed(Routes.general);
    });
  }
}
