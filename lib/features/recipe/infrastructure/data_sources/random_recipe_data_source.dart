import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/recipe/infrastructure/data_sources/random_recipe_data_source_impl.dart';

import '../../../../core/network/network.dart';

final randomRecipeDataSourceProvider = Provider<RandomRecipeDataSource>(
  (ref) => RandomRecipeDataSourceImpl(
    client: ref.watch(dioProvider),
  ),
);

abstract class RandomRecipeDataSource {
  Future<Response> recipe();
}
