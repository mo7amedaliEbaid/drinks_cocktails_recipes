import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/core/widgets/custom_elevated_button.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            right: 0,
            child: Image.asset(
              AppAssets.leafPng,
              height: AppDimensions.normalize(55),
            ),
          ),
          Positioned(
            bottom: AppDimensions.normalize(100),
            right: AppDimensions.normalize(10),
            child: Image.asset(
              AppAssets.fruitPng,
              height: AppDimensions.normalize(35),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              AppAssets.splashPng,
              width: MediaQuery.sizeOf(context).width,
            ),
          ),
          Positioned(
            bottom: AppDimensions.normalize(5),
            child: Image.asset(
              AppAssets.cupPng,
              height: AppDimensions.normalize(215),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: AppDimensions.normalize(15)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Space.yf(2.5),
                Text(
                  "It’s time for a",
                  style: AppText.h1b!.copyWith(
                    fontFamily: FontFamilies.poppins,
                  ),
                ),
                Image.asset(
                  AppAssets.drinkPng,
                  height: AppDimensions.normalize(20),
                ),
                Space.yf(.5),
                Text(
                  "The one-stop to find amazing drink mixes for any occassion.",
                  style: AppText.b1!.copyWith(color: Colors.grey, height: 1.5),
                ),
                Space.yf(1.5),
                customElevatedButton(
                  onPressed: () => context.goNamed(Routes.home.name),
                  text: "Get Started",
                  color: AppColors.deepBlue,
                  borderRadius: AppDimensions.normalize(14),
                  width: AppDimensions.normalize(72),
                  height: AppDimensions.normalize(24),
                  textStyle: AppText.h3!.copyWith(
                      color: Colors.white, fontFamily: FontFamilies.poppins),
                  isWithArrow: true,
                  borderColor: AppColors.deepBlue, padding: Space.all(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
