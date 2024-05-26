import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../../../core/network/error_model.dart';
import '../../infrastructure/data_sources/random_recipe_data_source.dart';
import '../../infrastructure/repositories/random_recipe_repository_impl.dart';

final randomRecipeRepositoryProvider = Provider<RandomRecipeRepository>(
  (ref) => RandomRecipeRepositoryImpl(
    dataSource: ref.watch(randomRecipeDataSourceProvider),
  ),
);

abstract class RandomRecipeRepository {
  Future<Either<ErrorModel, List<DrinkDetails>>> recipe();
}
