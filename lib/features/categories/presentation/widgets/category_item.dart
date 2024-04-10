import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/categories/data/dto/category_model.dart';

Widget categoryItem(
    {required Category category,
    required String image,
    required BuildContext context}) {
  return Container(
    width: AppDimensions.normalize(43),
    decoration: BoxDecoration(
        color: AppColors.lemonadaColor,
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(7),
        )),
    child: Column(
      children: [
        Space.yf(.7),
        ClipOval(
          child: CachedNetworkImage(
            height: AppDimensions.normalize(28),
            imageUrl: image,
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
        ),
        Space.yf(.7),
        Text(
          category.strCategory,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppText.b2!.copyWith(
            wordSpacing: 0,
            letterSpacing: 0,

          ),
        )
      ],
    ),
  );
}