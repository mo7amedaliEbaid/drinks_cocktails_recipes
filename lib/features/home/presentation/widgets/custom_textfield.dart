import 'package:flutter/material.dart';
import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';

Widget customTextField(
    {Widget? suffix,
    int? maxLines,
    void Function(String)? onChanged,
    required String hintText,
    void Function(String)? onSubmitted,
    TextStyle? hintStyle,
    required TextEditingController controller}) {
  return TextField(
    controller: controller,
    onChanged: onChanged,
    cursorColor: Colors.grey,
    maxLines: maxLines,
    style: AppText.b1,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: hintStyle ??
          AppText.b1?.copyWith(
            color: Colors.grey,
            letterSpacing: 0,
          ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(4),
        ),
        borderSide: const BorderSide(color: Colors.transparent),
      ),

      contentPadding: Space.all(1, .5),
      fillColor: Colors.white,
      filled: true,


    ),
  );
}
