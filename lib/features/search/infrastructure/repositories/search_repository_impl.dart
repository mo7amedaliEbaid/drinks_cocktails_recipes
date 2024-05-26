import 'package:dartz/dartz.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/search/domain/repositories/search_repository.dart';
import 'package:recipes/features/search/infrastructure/data_sources/search_data_source.dart';

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({
    required this.dataSource,
  });

  final SearchDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<DrinkDetails>>> drinks(
      String searchValue) async {
    return await dataSource.drinks(searchValue).guard((data) {
      List<DrinkDetails> drinks = (data["drinks"] as List<dynamic>)
          .map((json) => DrinkDetails.fromJson(json as Map<String, dynamic>))
          .toList();
      return drinks;
    });
  }
}
