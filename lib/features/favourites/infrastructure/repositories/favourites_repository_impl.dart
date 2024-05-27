import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../../domain/repositories/favourites_repository.dart';
import '../data_sources/local_data_source.dart';

class FavoriteDrinksRepositoryImpl implements FavoriteDrinksRepository {
  final FavoriteDrinksDataSource _localDataSource;

  FavoriteDrinksRepositoryImpl(this._localDataSource);

  @override
  void addFavorite(DrinkDetails drink) {
    _localDataSource.addFavorite(drink);
  }

  @override
  void removeFavorite(String idDrink) {
    _localDataSource.removeFavorite(idDrink);
  }

  @override
  List<DrinkDetails> getFavorites() {
    return _localDataSource.getFavorites();
  }

  @override
  bool isFavorite(String idDrink) {
    return _localDataSource.isFavorite(idDrink);
  }
}
