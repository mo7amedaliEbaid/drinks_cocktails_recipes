import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../repositories/favourites_repository.dart';

class AddFavoriteUseCase {
  final FavoriteDrinksRepository _repository;

  AddFavoriteUseCase(this._repository);

  void call(DrinkDetails drink) {
    _repository.addFavorite(drink);
  }
}