import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/search/infrastructure/data_sources/search_data_source.dart';

import '../../../../core/network/error_model.dart';
import '../../infrastructure/repositories/search_repository_impl.dart';

final searchRepositoryProvider = Provider<SearchRepository>(
      (ref) => SearchRepositoryImpl(
    dataSource: ref.watch(searchDataSourceProvider),
  ),
);

abstract class SearchRepository {
  Future<Either<ErrorModel, List<DrinkDetails>>> drinks(String searchValue);
}