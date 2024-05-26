import 'package:dartz/dartz.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../domain/repositories/random_recipe_repository.dart';
import '../data_sources/random_recipe_data_source.dart';

class RandomRecipeRepositoryImpl implements RandomRecipeRepository {
  RandomRecipeRepositoryImpl({
    required this.dataSource,
  });

  final RandomRecipeDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<DrinkDetails>>> recipe() async {
    return await dataSource.recipe().guard((data) {
      List<DrinkDetails> recipe = (data["drinks"] as List<dynamic>)
          .map((json) => DrinkDetails.fromJson(json as Map<String, dynamic>))
          .toList();
      return recipe;
    });
  }
}
