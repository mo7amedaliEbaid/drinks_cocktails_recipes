import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../../../core/network/error_model.dart';
import '../repositories/random_recipe_repository.dart';

final randomRecipeUseCaseProvider = Provider<RandomRecipeUseCase>(
  (ref) => RandomRecipeUseCase(
    ref.watch(randomRecipeRepositoryProvider),
  ),
);

class RandomRecipeUseCase {
  RandomRecipeUseCase(this._randomRecipeRepository);

  final RandomRecipeRepository _randomRecipeRepository;

  Future<Either<ErrorModel, List<DrinkDetails>>> recipe() async {
    return await _randomRecipeRepository.recipe();
  }
}
