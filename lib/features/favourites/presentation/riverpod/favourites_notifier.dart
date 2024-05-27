import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../infrastructure/data_sources/local_data_source.dart';


class FavoriteDrinksNotifier extends StateNotifier<List<DrinkDetails>> {
  final FavoriteDrinksLocalDataSource _localDataSource;

  FavoriteDrinksNotifier(this._localDataSource) : super(_localDataSource.getFavorites());

  void addFavorite(DrinkDetails drink) {
    _localDataSource.addFavorite(drink);
    state = _localDataSource.getFavorites();
  }

  void removeFavorite(String idDrink) {
    _localDataSource.removeFavorite(idDrink);
    state = _localDataSource.getFavorites();
  }

  bool isFavorite(String idDrink) {
    return _localDataSource.isFavorite(idDrink);
  }
}
