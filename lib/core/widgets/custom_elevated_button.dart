import 'package:recipes/configs/configs.dart';
import 'package:flutter/material.dart';

Widget customElevatedButton({
  void Function()? onPressed,
  required String text,
  required Color color,
  required Color borderColor,
  required double borderRadius,
  required double width,
  required double height,
  required TextStyle textStyle,
  required bool isWithArrow,
  required EdgeInsets padding,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius)),
      minimumSize: Size(width, height),
      maximumSize: Size(width, height),
      onSurface: color,
      padding: padding,
      side: BorderSide(
        width: .6,
        color: borderColor,
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text,
          style: textStyle,
        ),
        isWithArrow ? Space.xf(.3) : const SizedBox.shrink(),
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
