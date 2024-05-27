import '../repositories/favourites_repository.dart';

class RemoveFavoriteUseCase {
  final FavoriteDrinksRepository _repository;

  RemoveFavoriteUseCase(this._repository);

  void call(String idDrink) {
    _repository.removeFavorite(idDrink);
  }
}