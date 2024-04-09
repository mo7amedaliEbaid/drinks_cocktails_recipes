import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';
import 'package:flutter/material.dart';

Widget customElevatedButton({
   void Function()? onPressed,
  required String text,
  required Color color,
  required double borderRadius,
  required double width,
  required double height,
  required TextStyle textStyle,
  required bool isWithArrow,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      minimumSize: Size(width, height),
      maximumSize: Size(width, height),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        Space.xf(.3),
        isWithArrow
            ? Icon(
                Icons.arrow_forward_ios,
                size: AppDimensions.normalize(6.3),
                color: Colors.white,
              )
            : const SizedBox.shrink()
      ],
    ),
  );
}
