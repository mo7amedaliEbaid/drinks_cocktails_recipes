import 'package:recipes/src/domain/entities/category.dart';
import 'package:recipes/src/domain/entities/recipe.dart';

import '../entities/recipe_by_category.dart';

abstract class RecipesRepository {
  Future<List<Category>> getCategories();
  Future<List<RecipeByCategory>> getRecipesForCategory(String categoryId);
  Future<Recipe> getRecipe(String id);
  Future<Recipe> getRandomRecipe();
}
