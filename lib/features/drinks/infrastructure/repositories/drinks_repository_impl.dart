import 'package:dartz/dartz.dart';
import 'package:recipes/core/network/request_handler.dart';
import '../../../../core/network/error_model.dart';
import '../../domain/repositories/drinks_repository.dart';
import '../data_sources/drink/drinks_data_source.dart';
import '../dto/drink/drink_model.dart';

class DrinksRepositoryImpl implements DrinksRepository {
  DrinksRepositoryImpl({
    required this.dataSource,
  });

  final DrinksDataSource dataSource;

  @override
  Future<Either<ErrorModel, List<Drink>>> drinks(String categoryId) async {
    return await dataSource.drinks(categoryId).guard((data) {
      List<Drink> drinks = (data["drinks"] as List<dynamic>)
          .map((json) => Drink.fromJson(json as Map<String, dynamic>))
          .toList();
      return drinks;
    });
  }
}