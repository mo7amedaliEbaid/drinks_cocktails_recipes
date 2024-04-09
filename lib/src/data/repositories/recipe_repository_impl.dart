import 'package:recipes/src/core/exceptions/custom_exception.dart';
import 'package:recipes/src/data/api_client.dart';
import 'package:recipes/src/data/datasources/recipes_datasource.dart';
import 'package:recipes/src/domain/entities/category.dart';
import 'package:recipes/src/domain/entities/recipe.dart';
import 'package:recipes/src/domain/entities/recipe_by_category.dart';
import 'package:recipes/src/domain/repositories/recipes_repository.dart';

class RecipesRepositoryImplementation implements RecipesRepository {
  RecipesRepositoryImplementation();

  final _source = RecipesDatasource(ApiClient());

  @override
  Future<List<Category>> getCategories() async {
    try {
      final response = await _source.getCategories();
      return (response.data['drinks'] as List)
          .map((e) => Category.fromJson(e))
          .toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<List<RecipeByCategory>> getRecipesForCategory(String categoryId) async {
    try {
      final response = await _source.getRecipesForCategory(categoryId);
      return (response.data['drinks'] as List)
          .map((e) => RecipeByCategory.fromJson(e))
          .toList();
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<Recipe> getRecipe(String id) async {
    try {
      final response = await _source.getRecipe(id);
      return Recipe.fromJson(response.data['drinks'][0]);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }

  @override
  Future<Recipe> getRandomRecipe() async {
    try {
      final response = await _source.getRandomRecipe();
      return Recipe.fromJson(response.data['drinks'][0]);
    } catch (e) {
      throw CustomException(e.toString());
    }
  }
}
