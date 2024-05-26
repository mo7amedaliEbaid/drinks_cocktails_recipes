import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/configs/configs.dart';

import '../../infrastructure/dto/drink/drink_model.dart';

Widget drinkItem({
  required Drink drink,
}) {
  return SizedBox(
    width: AppDimensions.normalize(39.38),
    child: Card(
      color: Colors.white,
      margin: EdgeInsets.all(
        AppDimensions.normalize(6.3),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          AppDimensions.normalize(6),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(
                AppDimensions.normalize(6),
              ),
            ),
            child: CachedNetworkImage(
              imageUrl: drink.strDrinkThumb,
              fit: BoxFit.cover,
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              drink.strDrink,
              style: AppText.b2b!.copyWith(
                fontFamily: FontFamilies.poppins,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
