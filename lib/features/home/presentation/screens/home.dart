import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/categories/presentation/providers/categories_provider.dart';
import 'package:recipes/features/categories/presentation/providers/select_category_provider.dart';
import 'package:recipes/features/categories/presentation/widgets/category_item.dart';
import 'package:recipes/features/drinks/presentation/screens/drinks_by_category.dart';
import 'package:recipes/features/home/presentation/widgets/common_row.dart';
import 'package:recipes/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:recipes/features/home/presentation/widgets/custom_textfield.dart';
import 'package:recipes/features/recipe/presentation/providers/random_recipe_provider.dart';
import 'package:recipes/features/recipe/presentation/widgets/recipe_item.dart';

import '../../../drinks/presentation/riverpod/drink_details/selected_drink_provider.dart';
import '../../../drinks/presentation/screens/drinkDetails.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    App.init(context);
    final categoriesState = ref.watch(categoriesProvider);
    final randomRecipeState = ref.watch(randomRecipeProvider);
    final TextEditingController controller = TextEditingController();
    log(AppDimensions.normalize(39.38).toString());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: Space.hf(1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "I want to learn...",
                    style: AppText.h2b!.copyWith(
                      fontFamily: FontFamilies.poppins,
                      height: .3,
                    ),
                  ),
                  Space.yf(1.2),
                  Material(
                    elevation: 2,
                    shadowColor: Colors.black,
                    shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        AppDimensions.normalize(4),
                      ),
                      borderSide:
                          const BorderSide(color: Colors.grey, width: .2),
                    ),
                    child: customTextField(
                      controller: controller,
                      hintText: "Search",
                    ),
                  ),
                  Space.yf(),
                  commonRow(title: "Categories"),
                ],
              ),
            ),
            Space.yf(.4),
            categoriesState.when(
              data: (categories) {
                return SizedBox(
                  height: AppDimensions.normalize(50),
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    padding: EdgeInsets.only(left: AppDimensions.normalize(8)),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectedCategoryProvider.notifier).state =
                              categories[index].strCategory.toString();

                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => DrinksByCategoryScreen(
                                categoryName:
                                    categories[index].strCategory.toString(),
                              ),
                            ),
                          );
                        },
                        child: categoryItem(
                            category: categories[index],
                            image: NetworkImages.categories[index],
                            context: context),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Space.xf(1.2);
                    },
                  ),
                );
              },
              loading: () => const ShimmerHorizontalList(),
              error: (error, stackTrace) {
                log(
                  "CategoriesListView.categoriesState.when",
                  error: error.toString(),
                  stackTrace: stackTrace,
                );
                return const Center(child: Text('Error'));
              },
            ),
            Padding(
              padding: Space.all(1.5, 1),
              child: commonRow(title: "Recent Mixes"),
            ),
            randomRecipeState.when(
              data: (recipe) {
                final PageController controller = PageController(
                  viewportFraction: 0.75,
                  initialPage: 1,
                );
                /* Timer.periodic(const Duration(seconds: 3), (timer) {
                  if (controller.page == 2) {
                    controller.animateToPage(
                      0,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  } else {
                    controller.nextPage(
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeInOut,
                    );
                  }
                });*/
                return SizedBox(
                    height: AppDimensions.normalize(140),
                    child: PageView.builder(
                      itemCount: 3,
                      clipBehavior: Clip.none,
                      controller: controller,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(selectedDrinkProvider.notifier).state =
                                recipe.first.idDrink.toString();

                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    const DrinkDetailsScreen(),
                              ),
                            );
                          },
                          child: RecipeItem(
                            recipe.first,
                          ),
                        );
                      },
                    ));
              },
              loading: () => const CircularProgressIndicator(),
              error: (error, stackTrace) {
                log(
                  "RecipesPageView.recipeState.when",
                  error: error.toString(),
                  stackTrace: stackTrace,
                );
                return const Center(child: Text('Error'));
              },
            ),
          ],
        ),
      ),
    );
  }
}
