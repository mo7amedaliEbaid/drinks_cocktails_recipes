import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink_model.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drinks_provider.dart';
import 'package:recipes/features/drinks/presentation/widgets/drink_item.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import '../../../../core/state/base_state.dart';

class DrinksByCategoryScreen extends ConsumerWidget {
  const DrinksByCategoryScreen({required this.categoryName, super.key});

  final String categoryName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(drinksProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryName),
      ),
      body: SingleChildScrollView(
        child: state is LoadingState
            ? const CircularProgressIndicator()
            : state is SuccessState<List<Drink>> && state.data != null
                ? state.data!.isNotEmpty
                    ? RefreshIndicator(
                        onRefresh: () async {},
                        child: StaggeredGrid.count(
                          crossAxisCount: 2,
                          mainAxisSpacing: 8.0,
                          crossAxisSpacing: 8.0,
                          children: List.generate(
                            state.data!.length,
                            (index) {
                              return drinkItem(drink: state.data![index]);
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
