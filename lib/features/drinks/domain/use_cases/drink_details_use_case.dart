import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/domain/repositories/drink_details_repository.dart';

import '../../../../core/network/error_model.dart';
import '../../infrastructure/dto/drink_details/drink_details_model.dart';

class DrinkDetailsUseCase {
  DrinkDetailsUseCase(this._drinkRepository);

  final DrinkDetailsRepository _drinkRepository;

  Future<Either<ErrorModel, List<DrinkDetails>>> drinkDetails(
      String drinkId) async {
    return await _drinkRepository.drinkDetails(drinkId);
  }
}

final drinkDetailsUseCaseProvider = Provider<DrinkDetailsUseCase>(
  (ref) => DrinkDetailsUseCase(
    ref.watch(drinkDetailsRepositoryProvider),
  ),
);
