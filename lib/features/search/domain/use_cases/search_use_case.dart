import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/search/domain/repositories/search_repository.dart';

import '../../../../core/network/error_model.dart';

final searchUseCaseProvider = Provider<SearchUseCase>(
  (ref) => SearchUseCase(
    ref.watch(searchRepositoryProvider),
  ),
);

class SearchUseCase {
  SearchUseCase(this._searchRepository);

  final SearchRepository _searchRepository;

  Future<Either<ErrorModel, List<DrinkDetails>>> drinks(
      String searchValue) async {
    return await _searchRepository.drinks(searchValue);
  }
}
