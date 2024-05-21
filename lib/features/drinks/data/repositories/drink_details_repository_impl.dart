import 'package:dartz/dartz.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/drinks/data/data_sources/drink_details/drink_details_data_source.dart';
import 'package:recipes/features/drinks/data/dto/drink_details/drink_details_model.dart';

import '../../../../core/network/error_model.dart';
import '../../domain/repositories/drink_details_repository.dart';

class DrinkDetailsRepositoryImpl implements DrinkDetailsRepository {
  DrinkDetailsRepositoryImpl({
    required this.dataSource,
  });

  final DrinkDetailsDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<DrinkDetails>>> drinkDetails(
      String drinkId) async {
    return await dataSource.drinkDetails(drinkId).guard((data) {
      List<DrinkDetails> drinkDetails = (data["drinks"] as List<dynamic>)
          .map((json) => DrinkDetails.fromJson(json as Map<String, dynamic>))
          .toList();
      return drinkDetails;
    });
  }
}
