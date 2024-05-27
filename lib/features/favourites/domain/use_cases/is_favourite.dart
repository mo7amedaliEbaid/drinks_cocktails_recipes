import '../repositories/favourites_repository.dart';

class IsFavoriteUseCase {
  final FavoriteDrinksRepository _repository;

  IsFavoriteUseCase(this._repository);

  bool call(String idDrink) {
    return _repository.isFavorite(idDrink);
  }
}