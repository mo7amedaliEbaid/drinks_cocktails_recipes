import 'package:dio/dio.dart';
import 'package:recipes/features/recipe/infrastructure/data_sources/random_recipe_data_source.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/rest_client.dart';

class RandomRecipeDataSourceImpl implements RandomRecipeDataSource {
  RandomRecipeDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> recipe() async {
    final response = await client.get(
      ApiType.public,
      EndPoints.randomRecipe,
    );
    return response;
  }
}
