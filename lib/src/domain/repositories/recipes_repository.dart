import 'package:recipes/src/domain/entities/category.dart';
import 'package:recipes/src/domain/entities/recipe.dart';

abstract class RecipesRepository {
  Future<List<Category>> getCategories();
  Future<List<Recipe>> getRecipesForCategory(String categoryId);
  Future<Recipe> getRecipe(String id);
  Future<Recipe> getRandomRecipe();
}
