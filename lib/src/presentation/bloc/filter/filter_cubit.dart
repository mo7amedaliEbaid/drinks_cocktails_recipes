import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/src/domain/entities/recipe_by_category.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';

part 'filter_state.dart';

class FilterCubit extends Cubit<FilterState> {
  FilterCubit({required this.repository}) : super(const FilterState());

  final RecipesRepository repository;

  // Let's keep a list of recipes to be able to filter them
  List<RecipeByCategory> recipesList = [];

  // Filter recipes by category
  Future<void> filterRecipesByCategory(String categoryId) async {
    emit(state.copyWith(
      loading: true,
      hasError: false,
      errorMessage: '',
    ));

    try {
      final recipes = await repository.getRecipesForCategory(categoryId);
      recipesList = recipes;
      emit(state.copyWith(loading: false, recipes: recipes));
    } catch (e) {
      log('[ERROR] - filterRecipesByCategory: $e');
      emit(state.copyWith(
        loading: false,
        hasError: true,
        errorMessage: e.toString(),
      ));
    }
  }

  // Clear filter
  void clearFilter() => emit(state.copyWith(recipes: []));
}
