import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink/drink_model.dart';
import 'package:recipes/features/drinks/domain/repositories/drinks_repository.dart';

import '../../../../core/network/error_model.dart';

final drinkUseCaseProvider = Provider<DrinkUseCase>(
  (ref) => DrinkUseCase(
    ref.watch(drinksRepositoryProvider),
  ),
);

class DrinkUseCase {
  DrinkUseCase(this._drinksRepository);

  final DrinksRepository _drinksRepository;

  Future<Either<ErrorModel, List<Drink>>> drinks(String categoryId) async {
    return await _drinksRepository.drinks(categoryId);
  }
}
