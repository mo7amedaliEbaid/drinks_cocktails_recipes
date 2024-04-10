import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/recipe/data/dto/recipe_model.dart';
import 'package:recipes/features/recipe/domain/repositories/random_recipe_repository.dart';

import '../../../../core/network/error_model.dart';

final randomRecipeUseCaseProvider = Provider<RandomRecipeUseCase>(
  (ref) => RandomRecipeUseCase(
    ref.watch(randomRecipeRepositoryProvider),
  ),
);

class RandomRecipeUseCase {
  RandomRecipeUseCase(this._randomRecipeRepository);

  final RandomRecipeRepository _randomRecipeRepository;

  Future<Either<ErrorModel, List<Recipe>>> recipe() async {
    return await _randomRecipeRepository.recipe();
  }
}
