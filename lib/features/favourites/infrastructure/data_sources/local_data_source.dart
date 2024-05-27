import 'package:hive/hive.dart';
import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';

class FavoriteDrinksLocalDataSource {
  final Box<DrinkDetails> _favoritesBox;

  FavoriteDrinksLocalDataSource(this._favoritesBox);

  void addFavorite(DrinkDetails drink) {
    _favoritesBox.put(drink.idDrink, drink);
  }

  void removeFavorite(String idDrink) {
    _favoritesBox.delete(idDrink);
  }

  List<DrinkDetails> getFavorites() {
    return _favoritesBox.values.toList();
  }

  bool isFavorite(String idDrink) {
    return _favoritesBox.containsKey(idDrink);
  }
}
