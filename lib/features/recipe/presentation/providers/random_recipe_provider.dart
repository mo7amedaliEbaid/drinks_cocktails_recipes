import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/recipe/data/dto/recipe_model.dart';
import 'package:recipes/features/recipe/domain/use_cases/random_recipe_usecase.dart';

final randomRecipeProvider = FutureProvider<List<Recipe>>(
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
