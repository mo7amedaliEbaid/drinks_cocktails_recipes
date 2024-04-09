import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink_model.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drinks_provider.dart';

import '../../../../core/state/base_state.dart';

class DrinksByCategoryScreen extends ConsumerWidget {
  const DrinksByCategoryScreen({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final state = ref.watch(drinksProvider);
    log(state.toString());
    log(state.toString());
    log(state.toString());
    return Scaffold(
      body: Center(
        child: state is LoadingState
            ? const CircularProgressIndicator()
            : state is SuccessState<List<Drink>>
            ? RefreshIndicator(
              onRefresh: () async {
               // ref.invalidate(selectedCategoryProvider);
                /*await ref
                    .read(productsProvider.notifier)
                    .productList();*/
              },
              child: Text(state.data?.first.strDrink??"Empty"),
            )
            : const Center(child: Text('Error')),
      ),
    );
  }
}
