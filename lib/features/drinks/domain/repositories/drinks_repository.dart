import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/error_model.dart';
import '../../infrastructure/data_sources/drink/drinks_data_source.dart';
import '../../infrastructure/dto/drink/drink_model.dart';
import '../../infrastructure/repositories/drinks_repository_impl.dart';

final drinksRepositoryProvider = Provider<DrinksRepository>(
      (ref) => DrinksRepositoryImpl(
    dataSource: ref.watch(drinksDataSourceProvider),
  ),
);

abstract class DrinksRepository {
  Future<Either<ErrorModel, List<Drink>>> drinks(String categoryId);
}