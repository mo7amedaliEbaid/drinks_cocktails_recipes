import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import '../repositories/favourites_repository.dart';

class GetFavoritesUseCase {
  final FavoriteDrinksRepository _repository;

  GetFavoritesUseCase(this._repository);

  List<DrinkDetails> call() {
    return _repository.getFavorites();
  }
}