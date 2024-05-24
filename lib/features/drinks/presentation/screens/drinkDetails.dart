import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:recipes/features/drinks/data/dto/drink/drink_model.dart';
import 'package:recipes/features/drinks/data/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink/drinks_provider.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink_details/drink_details_provider.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink_details/selected_drink_provider.dart';
import 'package:recipes/features/drinks/presentation/widgets/drink_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipes/features/drinks/presentation/widgets/gradient_top_paint.dart';
import '../../../../configs/configs.dart';
import '../../../../core/core.dart';

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
                      child: Stack(
                        children: [
                          SvgPicture.asset(AppAssets.top_paint),
                          Padding(
                            padding: Space.all(1, 2),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          Positioned(
                            top: AppDimensions.normalize(45),
                            left: 5,
                            right: 5,
                            child: Text(
                              state.data!.first.strInstructions.toString(),
                            ),
                          )
                        ],
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
