import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../infrastructure/data_sources/local_data_source.dart';
import 'favourites_notifier.dart';

// Initialize the Hive box provider
final favoritesBoxProvider = Provider<Box<DrinkDetails>>((ref) {
  return Hive.box<DrinkDetails>('favorites');
});

// Initialize the local data source provider
final favoriteDrinksLocalDataSourceProvider =
    Provider<FavoriteDrinksLocalDataSource>((ref) {
  final box = ref.watch(favoritesBoxProvider);
  return FavoriteDrinksLocalDataSource(box);
});

// Initialize the notifier provider
final favoriteDrinksNotifierProvider =
    StateNotifierProvider<FavoriteDrinksNotifier, List<DrinkDetails>>((ref) {
  final localDataSource = ref.watch(favoriteDrinksLocalDataSourceProvider);
  return FavoriteDrinksNotifier(localDataSource);
});
