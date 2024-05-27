import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../domain/use_cases/add_to_favourites.dart';
import '../../domain/use_cases/get_favourites.dart';
import '../../domain/use_cases/is_favourite.dart';
import '../../domain/use_cases/remove_from_favourites.dart';


class FavoriteDrinksNotifier extends StateNotifier<List<DrinkDetails>> {
  final AddFavoriteUseCase _addFavoriteUseCase;
  final RemoveFavoriteUseCase _removeFavoriteUseCase;
  final GetFavoritesUseCase _getFavoritesUseCase;
  final IsFavoriteUseCase _isFavoriteUseCase;

  FavoriteDrinksNotifier(
      this._addFavoriteUseCase,
      this._removeFavoriteUseCase,
      this._getFavoritesUseCase,
      this._isFavoriteUseCase,
      ) : super(_getFavoritesUseCase());

  void addFavorite(DrinkDetails drink) {
    _addFavoriteUseCase(drink);
    state = _getFavoritesUseCase();
  }

  void removeFavorite(String idDrink) {
    _removeFavoriteUseCase(idDrink);
    state = _getFavoritesUseCase();
  }

  bool isFavorite(String idDrink) {
    return _isFavoriteUseCase(idDrink);
  }
}

