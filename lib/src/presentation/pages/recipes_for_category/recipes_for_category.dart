import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipes/src/core/constants.dart';
import 'package:recipes/src/domain/entities/recipe.dart';
import 'package:recipes/src/domain/entities/recipe_by_category.dart';
import 'package:recipes/src/domain/extensions/extensions.dart';
import 'package:recipes/src/presentation/bloc/filter/filter_cubit.dart';
import 'package:recipes/src/presentation/bloc/recipes/recipes_cubit.dart';
import 'package:recipes/src/presentation/pages/recipe_details/recipe_details.dart';
import 'package:recipes/src/presentation/widgets/custom_card.dart';
import 'package:recipes/src/presentation/widgets/error_message.dart';
import 'package:recipes/src/presentation/widgets/shimmer_image.dart';
import 'package:recipes/src/presentation/widgets/shimmer_loading.dart';

part 'widgets/loading_recipes_list.dart';
part 'widgets/recipe_list_item.dart';
part 'widgets/recipes_list.dart';

class RecipesForCategory extends StatefulWidget {
  const RecipesForCategory(this.category, {super.key});

  final String category;

  @override
  State<RecipesForCategory> createState() => _RecipesForCategoryState();
}

class _RecipesForCategoryState extends State<RecipesForCategory> {
  bool showSearch = false;

  late FilterCubit cubit;
  late RecipesCubit recipesCubit;

  @override
  void initState() {
    super.initState();
    cubit = context.read<FilterCubit>()
      ..filterRecipesByCategory(widget.category);
    recipesCubit=context.read<RecipesCubit>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: !showSearch
            ? Text(widget.category)
            : TextField(
                autofocus: true,
                onChanged: recipesCubit.searchRecipe,
                decoration: const InputDecoration(
                  hintText: 'Search',
                  border: InputBorder.none,
                ),
              ),
        actions: [
          IconButton(
            icon:
                showSearch ? const Icon(Icons.close) : const Icon(Icons.search),
            onPressed: () {
              recipesCubit.clearSearch();
              setState(() => showSearch = !showSearch);
            },
          ),
        ],
      ),
      body: BlocBuilder<FilterCubit, FilterState>(
        builder: (context, state) {
          if (state.hasError) {
            return ErrorMessage(state.errorMessage!);
          }
          if (state.loading) {
            return const LoadingRecipes();
          }
          return RecipesListForCategory(state.recipes);
        },
      ),
    );
  }
}
