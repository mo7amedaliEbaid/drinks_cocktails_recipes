import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink_details/drink_details_model.dart';

import '../../../../core/network/error_model.dart';
import '../../data/data_sources/drink_details/drink_details_data_source.dart';
import '../../data/repositories/drink_details_repository_impl.dart';

abstract class DrinkDetailsRepository {
  Future<Either<ErrorModel, List<DrinkDetails>>> drinkDetails(String drinkId);
}

final drinkDetailsRepositoryProvider = Provider<DrinkDetailsRepository>(
  (ref) => DrinkDetailsRepositoryImpl(
    dataSource: ref.watch(drinkDetailsDataSourceProvider),
  ),
);
