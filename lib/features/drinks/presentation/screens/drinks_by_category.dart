import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink/drink_model.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink/drinks_provider.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink_details/selected_drink_provider.dart';
import 'package:recipes/features/drinks/presentation/screens/drinkDetails.dart';
import 'package:recipes/features/drinks/presentation/widgets/drink_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../configs/configs.dart';
import '../../../../core/core.dart';

class DrinksByCategoryScreen extends ConsumerWidget {
  const DrinksByCategoryScreen({required this.categoryName, super.key});

  final String categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drinksProvider);

    return Scaffold(
      //  backgroundColor: Colors.white,
      appBar: AppBar(
        //  backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 2,
        title: Text(
          categoryName,
          style: AppText.h3b!.copyWith(
            fontFamily: FontFamilies.raleway,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: state is LoadingState
            ? const ShimmerGridView()
            : state is SuccessState<List<Drink>> && state.data != null
                ? state.data!.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () async {},
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: AppDimensions.normalize(3),
                          crossAxisSpacing: AppDimensions.normalize(3),
                          children: List.generate(
                            state.data!.length,
                            (index) {
                              return GestureDetector(
                                  onTap: () {
                                    ref
                                            .read(selectedDrinkProvider.notifier)
                                            .state =
                                        state.data![index].idDrink.toString();

                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const DrinkDetailsScreen(),
                                      ),
                                    );
                                  },
                                  child: drinkItem(drink: state.data![index]));
                            },
                          ),
                        ))
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
