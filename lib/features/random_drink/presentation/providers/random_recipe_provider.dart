import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/use_cases/random_recipe_usecase.dart';
import '../../infrastructure/dto/recipe_model.dart';

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
