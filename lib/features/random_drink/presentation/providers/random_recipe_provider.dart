import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../domain/use_cases/random_recipe_usecase.dart';

final randomRecipeProvider = FutureProvider<List<DrinkDetails>>(
  (ref) async {


    final recipe = await ref.watch(randomRecipeUseCaseProvider).recipe();

    return recipe.fold(
      (l) {
        log(
          'randomRecipeProvider',
          error: l,
        );
        return [];
      },
      (r) => r,
    );
  },
);
