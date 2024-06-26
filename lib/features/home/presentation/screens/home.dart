import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:recipes/configs/configs.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/categories/presentation/providers/categories_provider.dart';
import 'package:recipes/features/categories/presentation/providers/select_category_provider.dart';
import 'package:recipes/features/categories/presentation/widgets/category_item.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/home/presentation/widgets/common_row.dart';
import 'package:recipes/features/home/presentation/widgets/custom_app_bar.dart';
import 'package:recipes/features/home/presentation/widgets/custom_drawer.dart';
import 'package:recipes/features/home/presentation/widgets/custom_textfield.dart';
import 'package:recipes/features/search/presentation/provider/search_value_provider.dart';
import '../../../drinks/presentation/riverpod/drink_details/selected_drink_provider.dart';
import '../../../random_drink/presentation/providers/random_recipe_provider.dart';
import '../../../random_drink/presentation/widgets/recipe_item.dart';
import '../../../search/presentation/provider/serached_drinks_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends ConsumerState<HomeScreen> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final categoriesState = ref.watch(categoriesProvider);
    final randomRecipeState = ref.watch(randomRecipeProvider);

    final searchState = ref.watch(searchProvider);
    log(AppDimensions.normalize(39.38).toString());
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: customAppBar(
        scaffoldKey: scaffoldKey,
      ),
      drawer: const CustomDrawer(),
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
                        onSubmitted: (value) {
                          ref.read(searchValueProvider.notifier).state =
                              value.toString();

                          showDialog(
                              context: context,
                              builder: (context) {
                                return WillPopScope(
                                  onWillPop: () async {
                                    /* ref
                                        .read(searchValueProvider.notifier)
                                        .state = '';*/
                                    return true;
                                  },
                                  child: Dialog(
                                    child: SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              .3,
                                      width:
                                          MediaQuery.sizeOf(context).width * .6,
                                      child: searchState is SuccessState<
                                                  List<DrinkDetails>> &&
                                              searchState.data != null
                                          ? searchState.data!.isNotEmpty
                                              ? Center(
                                                  child: Text(searchState
                                                      .data!.first.strDrink),
                                                )
                                              : const Center(
                                                  child: Text("Empty"))
                                          : const Center(child: Text("Error")),
                                    ),
                                  ),
                                );
                              });
                          //  ref.read(searchValueProvider.notifier).state = '';
                        }),
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
                          context.goNamed(
                            Routes.drinks.name,
                            extra: categories[index].strCategory.toString(),
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
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Timer.periodic(const Duration(seconds: 3), (timer) {
                    // Check if the controller has positions before accessing the page property
                    if (controller.hasClients) {
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
                    }
                  });
                });
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
                            context.goNamed(
                              Routes.drinkDetails.name,
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
