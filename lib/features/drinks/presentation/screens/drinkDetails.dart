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
       backgroundColor: Colors.black,

      body: SingleChildScrollView(
        child: state is LoadingState
            ? const ShimmerGridView()
            : state is SuccessState<List<DrinkDetails>> && state.data != null
                ? state.data!.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () async {},
                        child: /*Stack(
                          children: [*/
                         //   SvgPicture.asset(AppAssets.top_paint),

                            Stack(
                              children: [

Container(height: 700,width: 700,color: Colors.amber,),
                                GradientTopPaint(),
                              ],
                            ),
                       //     Text(state.data!.first.strDrink),
                         /* ],
                        )*/)
                    : const Text(
                        "Empty",
                      )
                : const Center(
                    child: Text(
                      'Error',
                    ),
                  ),
      ),
    );
  }
}
