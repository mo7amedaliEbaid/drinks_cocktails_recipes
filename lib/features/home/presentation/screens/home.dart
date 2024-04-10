import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/configs/app_dimensions.dart';
import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/categories/presentation/providers/categories_provider.dart';
import 'package:recipes/features/categories/presentation/providers/select_category_provider.dart';
import 'package:recipes/features/categories/presentation/widgets/category_item.dart';
import 'package:recipes/features/drinks/presentation/screens/drinks_by_category.dart';
import 'package:recipes/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:recipes/features/home/presentation/widgets/custom_textfield.dart';

import '../../../../core/router/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    App.init(context);
    final categoriesState = ref.watch(categoriesProvider);
    final TextEditingController controller = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(),
      body: Column(
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
                    borderSide: const BorderSide(color: Colors.grey, width: .2),
                  ),
                  child: customTextField(
                    controller: controller,
                    hintText: "Search",
                  ),
                ),
                Space.yf(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Categories",
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
                ),
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

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                const DrinksByCategoryScreen()));
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
            loading: () => const CircularProgressIndicator(),
            error: (error, stackTrace) {
              log(
                "CategoriesListView.categoriesState.when",
                error: error.toString(),
                stackTrace: stackTrace,
              );
              return const Center(child: Text('Error'));
            },
          ),
        ],
      ),
    );
  }
}
