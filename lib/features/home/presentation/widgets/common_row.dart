import 'package:flutter/material.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/configs/configs.dart';
Widget commonRow({required String title}){
  return   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style: AppText.h3b!.copyWith(letterSpacing: 0),
      ),
      customElevatedButton(
        text: "See All",
        color: Colors.white,
        borderRadius: AppDimensions.normalize(5),
        width: AppDimensions.normalize(24),
        height: AppDimensions.normalize(13),
        textStyle: AppText.b2b!.copyWith(
          letterSpacing: 0,
          wordSpacing: 0,
          color: AppColors.lightRed,
        ),
        isWithArrow: false,
        borderColor: AppColors.lightRed.withOpacity(.4),
        padding: EdgeInsets.zero,
      )
    ],
  );
}