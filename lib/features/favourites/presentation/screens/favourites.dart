import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/router/routes.dart';
import '../../../drinks/presentation/riverpod/drink_details/selected_drink_provider.dart';
import '../riverpod/favourites_provider.dart';
import '../widgets/favourite_drink_item.dart';

class FavoritesScreen extends ConsumerWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteDrinksNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        elevation: 2,
        title: const Text(
          'Favorites',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: favorites.isEmpty
            ? const Center(
                child: Text(
                  'No favorites yet',
                  style: TextStyle(fontSize: 18),
                ),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  //  ref.refresh(favoriteDrinksNotifierProvider);
                },
                child: StaggeredGrid.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  children: List.generate(
                    favorites.length,
                    (index) {
                      return GestureDetector(
                        onTap: () {
                          ref.read(selectedDrinkProvider.notifier).state =
                              favorites[index].idDrink;

                          context.goNamed(
                            Routes.drinkDetails.name,
                          );
                        },
                        child: FavouriteDrinkItem(
                          drink: favorites[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
      ),
    );
  }
}
