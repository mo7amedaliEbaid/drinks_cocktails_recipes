part of '../recipes_for_category.dart';

class RecipeListItem extends StatelessWidget {
  const RecipeListItem(this.recipe, {super.key});

  final RecipeByCategory recipe;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: AppConstants.radius,
              bottomLeft: AppConstants.radius,
            ),
            child: ShimmerImage(
              width: 96,
              height: 96,
              image: recipe.strDrinkThumb.toString(),
            ),
          ),
          const SizedBox(width: 12),
          Flexible(
            child: Column(
              children: [
                Text(
                  recipe.strDrink.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
