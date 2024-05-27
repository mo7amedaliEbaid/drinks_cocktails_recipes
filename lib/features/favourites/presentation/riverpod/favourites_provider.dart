import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../domain/repositories/favourites_repository.dart';
import '../../domain/use_cases/add_to_favourites.dart';
import '../../domain/use_cases/get_favourites.dart';
import '../../domain/use_cases/is_favourite.dart';
import '../../domain/use_cases/remove_from_favourites.dart';
import '../../infrastructure/data_sources/local_data_source.dart';
import '../../infrastructure/repositories/favourites_repository_impl.dart';
import 'favourites_notifier.dart';

// Hive box provider
final favoritesBoxProvider = Provider<Box<DrinkDetails>>((ref) {
  return Hive.box<DrinkDetails>('favorites');
});

// Data source provider
final favoriteDrinksLocalDataSourceProvider =
    Provider<FavoriteDrinksDataSource>((ref) {
  final box = ref.watch(favoritesBoxProvider);
  return FavoriteDrinksLocalDataSource(box);
});

// Repository provider
final favoriteDrinksRepositoryProvider =
    Provider<FavoriteDrinksRepository>((ref) {
  final dataSource = ref.watch(favoriteDrinksLocalDataSourceProvider);
  return FavoriteDrinksRepositoryImpl(dataSource);
});

// Use case providers
final addFavoriteUseCaseProvider = Provider<AddFavoriteUseCase>((ref) {
  final repository = ref.watch(favoriteDrinksRepositoryProvider);
  return AddFavoriteUseCase(repository);
});

final removeFavoriteUseCaseProvider = Provider<RemoveFavoriteUseCase>((ref) {
  final repository = ref.watch(favoriteDrinksRepositoryProvider);
  return RemoveFavoriteUseCase(repository);
});

final getFavoritesUseCaseProvider = Provider<GetFavoritesUseCase>((ref) {
  final repository = ref.watch(favoriteDrinksRepositoryProvider);
  return GetFavoritesUseCase(repository);
});

final isFavoriteUseCaseProvider = Provider<IsFavoriteUseCase>((ref) {
  final repository = ref.watch(favoriteDrinksRepositoryProvider);
  return IsFavoriteUseCase(repository);
});

// Notifier provider
final favoriteDrinksNotifierProvider =
    StateNotifierProvider<FavoriteDrinksNotifier, List<DrinkDetails>>((ref) {
  final addFavoriteUseCase = ref.watch(addFavoriteUseCaseProvider);
  final removeFavoriteUseCase = ref.watch(removeFavoriteUseCaseProvider);
  final getFavoritesUseCase = ref.watch(getFavoritesUseCaseProvider);
  final isFavoriteUseCase = ref.watch(isFavoriteUseCaseProvider);

  return FavoriteDrinksNotifier(
    addFavoriteUseCase,
    removeFavoriteUseCase,
    getFavoritesUseCase,
    isFavoriteUseCase,
  );
});
