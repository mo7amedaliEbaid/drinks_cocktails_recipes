import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/configs/app.dart';
import 'package:recipes/configs/configs.dart';

import 'package:recipes/core/core.dart';

import '../../data/dto/recipe_model.dart';
import '../providers/random_recipe_provider.dart';

class RecipeItem extends ConsumerWidget {
  const RecipeItem(this.recipe, {super.key});

  final Recipe recipe;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final randomRecipeState = ref.watch(randomRecipeProvider);
    final List<String> words = getStringWords(recipe.strDrink);
    return Padding(
      padding: EdgeInsets.only(
        right: AppDimensions.normalize(10),
      ),
      child: Column(
        children: [
          Container(
            height: AppDimensions.normalize(115),
            width: AppDimensions.normalize(115),
            decoration: BoxDecoration(
              color: AppColors.lightRed,
              borderRadius: BorderRadius.circular(
                AppDimensions.normalize(7),
              ),
            ),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: AppDimensions.normalize(10),
                  left: AppDimensions.normalize(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        words.first,
                        style: AppText.customStyle,
                      ),
                      words.length > 1
                          ? Text(words[1],
                              style: AppText.customStyle!.copyWith(
                                color: Colors.white.withOpacity(.5),
                                height: 1.2,
                              ))
                          : const SizedBox.shrink(),
                    ],
                  ),
                ),
                Positioned(
                  right: -AppDimensions.normalize(5),
                  top: AppDimensions.normalize(8),
                  child: cachedNetworkOval(
                    radius: AppDimensions.normalize(55),
                    imagePath: recipe.strDrinkThumb,
                  ),
                ),
                Positioned(
                  top: AppDimensions.normalize(65),
                  left: AppDimensions.normalize(6),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Image.asset(
                            AppAssets.cocktail_cup,
                            height: AppDimensions.normalize(15),
                          ),
                          Space.xf(),
                          Text(
                            recipe.strCategory ?? "Category",
                            style: AppText.h2b?.copyWith(
                              color: Colors.white,
                              letterSpacing: .3,
                            ),
                          )
                        ],
                      ),
                      Space.yf(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.favorite_border,
                            color: Colors.white,
                            size: AppDimensions.normalize(12),
                          ),
                          Space.xf(),
                          Text(
                            "567",
                            style: AppText.h3?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                          Space.xf(4),
                          Container(
                            height: AppDimensions.normalize(12),
                            width: AppDimensions.normalize(32),
                            padding: Space.hf(.3),
                            decoration: BoxDecoration(
                              color: AppColors.deepRed,
                              borderRadius: BorderRadius.circular(
                                AppDimensions.normalize(7),
                              ),
                            ),
                            child: Center(
                              child: Image.asset(
                                AppAssets.stars,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            height: AppDimensions.normalize(10),
            width: AppDimensions.normalize(85),
            decoration: BoxDecoration(
                color: AppColors.mediumLightRed,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimensions.normalize(8)),
                  bottomRight: Radius.circular(AppDimensions.normalize(8)),
                )),
          ),
          Container(
            height: AppDimensions.normalize(10),
            width: AppDimensions.normalize(70),
            decoration: BoxDecoration(
                color: AppColors.redShadow,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(AppDimensions.normalize(9)),
                  bottomRight: Radius.circular(AppDimensions.normalize(9)),
                )),
          )
        ],
      ),
    );
  }
}
