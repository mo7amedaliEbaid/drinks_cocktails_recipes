import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';

abstract class FavoriteDrinksRepository {
  void addFavorite(DrinkDetails drink);

  void removeFavorite(String idDrink);

  List<DrinkDetails> getFavorites();

  bool isFavorite(String idDrink);
}
