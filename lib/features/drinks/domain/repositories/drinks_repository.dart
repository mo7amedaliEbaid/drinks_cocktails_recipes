import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink_model.dart';

import '../../../../core/network/error_model.dart';
import '../../data/data_sources/drinks_data_source.dart';
import '../../data/repositories/drinks_repository_impl.dart';

final drinksRepositoryProvider = Provider<DrinksRepository>(
      (ref) => DrinksRepositoryImpl(
    dataSource: ref.watch(drinksDataSourceProvider),
  ),
);

abstract class DrinksRepository {
  Future<Either<ErrorModel, List<Drink>>> drinks(String categoryId);
}