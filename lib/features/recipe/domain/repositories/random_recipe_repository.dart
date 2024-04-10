import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/recipe/data/data_sources/random_recipe_data_source.dart';
import 'package:recipes/features/recipe/data/dto/recipe_model.dart';

import '../../../../core/network/error_model.dart';
import '../../data/repositories/random_recipe_repository_impl.dart';

final randomRecipeRepositoryProvider = Provider<RandomRecipeRepository>(
  (ref) => RandomRecipeRepositoryImpl(
    dataSource: ref.watch(randomRecipeDataSourceProvider),
  ),
);

abstract class RandomRecipeRepository {
  Future<Either<ErrorModel, List<Recipe>>> recipe();
}
