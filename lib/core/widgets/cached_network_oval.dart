import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/core/core.dart';

Widget cachedNetworkOval({
  required double radius,
  required String imagePath,
}) {
  return ClipOval(
    child: CachedNetworkImage(
      height: radius,
      imageUrl: imagePath,
      errorWidget: (context, str, object) {
        return Image.asset(
          AppAssets.placeHolder,
        );
      },
      placeholder: (context, str) {
        return Image.asset(
          AppAssets.placeHolder,
        );
      },
    ),
  );
}
