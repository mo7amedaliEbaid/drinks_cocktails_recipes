import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink_details/drink_details_provider.dart';
import '../../../../configs/configs.dart';
import '../../../../core/core.dart';
import '../../infrastructure/dto/drink_details/drink_details_model.dart';

class DrinkDetailsScreen extends ConsumerWidget {
  const DrinkDetailsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drinkDetailsProvider);

    return Scaffold(
      backgroundColor: Colors.white,
      body: state is LoadingState
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : state is SuccessState<List<DrinkDetails>> && state.data != null
              ? state.data!.isNotEmpty
                  ? RefreshIndicator(
                      onRefresh: () async {},
                      child: SizedBox(
                        height: MediaQuery.sizeOf(context).height,
                        width: MediaQuery.sizeOf(context).width,
                        child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: [
                            Positioned(
                              top: 0,
                              child: SvgPicture.asset(
                                AppAssets.top_paint,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              // bottom: 100,
                              child: Padding(
                                padding: Space.all(1, 2),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  //   crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.pop(context);
                                      },
                                      child: const Icon(Icons.arrow_back_ios),
                                    ),
                                    SizedBox(
                                      width: AppDimensions.normalize(80),
                                      height: AppDimensions.normalize(15),
                                      child: Center(
                                        child: Text(
                                          state.data!.first.strDrink,
                                          style: AppText.h2b,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    SvgPicture.asset(AppAssets.heart),
                                  ],
                                ),
                              ),
                            ),
                            state.data!.first.strInstructions != null
                                ? Positioned(
                                    top: AppDimensions.normalize(40),
                                    left: AppDimensions.normalize(7),
                                    right: AppDimensions.normalize(7),
                                    child: Text(
                                      state.data!.first.strInstructions
                                          .toString(),
                                      style: AppText.b1b
                                          ?.copyWith(color: Colors.grey),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Positioned(
                              top: AppDimensions.normalize(65),
                              left: AppDimensions.normalize(7),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Time",
                                    style: AppText.h2?.copyWith(
                                      color: AppColors.deepBlue,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Space.yf(.1),
                                  Text(
                                    '25 min',
                                    style: AppText.h1b?.copyWith(
                                      color: AppColors.deepBlue,
                                    ),
                                  ),
                                  Space.yf(.7),
                                  Text(
                                    "Difficulty",
                                    style: AppText.h2?.copyWith(
                                      color: AppColors.green,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Space.yf(.1),
                                  Text(
                                    'Medium',
                                    style: AppText.h1b?.copyWith(
                                      color: AppColors.green,
                                    ),
                                  ),
                                  Space.yf(.7),
                                  Text(
                                    "Category",
                                    style: AppText.h2?.copyWith(
                                      color: AppColors.orange,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Space.yf(.1),
                                  Text(
                                    state.data!.first.strCategory.toString(),
                                    style: AppText.h1b?.copyWith(
                                      color: AppColors.orange,
                                    ),
                                  ),
                                  Space.yf(.7),
                                  Text(
                                    "Serves",
                                    style: AppText.h2?.copyWith(
                                      color: AppColors.lightRed,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                  Space.yf(.1),
                                  Text(
                                    "2",
                                    style: AppText.h1b?.copyWith(
                                      color: AppColors.lightRed,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            state.data!.first.strDrinkThumb != null
                                ? Positioned(
                                    top: AppDimensions.normalize(70),
                                    left: AppDimensions.normalize(70),
                                    child: cachedNetworkOval(
                                      radius: AppDimensions.normalize(100),
                                      imagePath: state.data!.first.strDrinkThumb
                                          .toString(),
                                    ),
                                  )
                                : const SizedBox.shrink(),
                            Positioned(
                              top: AppDimensions.normalize(205),
                              left: AppDimensions.normalize(7),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ingredients",
                                    style: AppText.h1
                                        ?.copyWith(color: AppColors.lightRed),
                                  ),
                                  Space.x!,
                                  const Icon(
                                    Icons.arrow_forward_ios,
                                    color: AppColors.lightRed,
                                  )
                                ],
                              ),
                            ),
                            Positioned(
                                top: AppDimensions.normalize(215),
                                left: AppDimensions.normalize(7),
                                right: AppDimensions.normalize(7),
                                child: SizedBox(
                                  height: AppDimensions.normalize(150),
                                  width: MediaQuery.sizeOf(context).width,
                                  child: GridView.builder(
                                      itemCount: AppStrings.ingredients.length,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 10,
                                        childAspectRatio: 3.2 / 3.5,
                                        crossAxisSpacing: 10,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Container(
                                          //  width: AppDimensions.normalize(50),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: AppColors.lemonadaColor,
                                            border: Border.all(
                                              width: 2,
                                              color: AppColors.yellow,
                                            ),
                                          ),
                                          padding: Space.all(.4, .4),
                                          child: Center(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Image.asset(
                                                  AppAssets.ingredients[index],
                                                ),
                                                //  Space.yf(.2),
                                                SizedBox(
                                                  width:
                                                      AppDimensions.normalize(
                                                          25),
                                                  child: Text(
                                                    AppStrings
                                                        .ingredients[index],
                                                    textAlign: TextAlign.center,
                                                    maxLines: 2,
                                                    style: AppText.b2?.copyWith(
                                                      color: AppColors.deepBlue,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                ))
                          ],
                        ),
                      ),
                    )
                  : const Text(
                      "Empty",
                    )
              : const Center(
                  child: Text(
                    'Error',
                  ),
                ),
    );
  }
}
