import 'package:hive/hive.dart';
import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';

abstract class FavoriteDrinksDataSource {
  void addFavorite(DrinkDetails drink);
  void removeFavorite(String idDrink);
  List<DrinkDetails> getFavorites();
  bool isFavorite(String idDrink);
}



class FavoriteDrinksLocalDataSource implements FavoriteDrinksDataSource {
  final Box<DrinkDetails> _favoritesBox;

  FavoriteDrinksLocalDataSource(this._favoritesBox);

  @override
  void addFavorite(DrinkDetails drink) {
    _favoritesBox.put(drink.idDrink, drink);
  }

  @override
  void removeFavorite(String idDrink) {
    _favoritesBox.delete(idDrink);
  }

  @override
  List<DrinkDetails> getFavorites() {
    return _favoritesBox.values.toList();
  }

  @override
  bool isFavorite(String idDrink) {
    return _favoritesBox.containsKey(idDrink);
  }
}
