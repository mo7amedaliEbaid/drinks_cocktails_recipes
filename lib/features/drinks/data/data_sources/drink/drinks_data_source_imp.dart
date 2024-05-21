import 'package:dio/dio.dart';

import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/rest_client.dart';
import 'drinks_data_source.dart';

class DrinksDataSourceImpl implements DrinksDataSource {
  DrinksDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> drinks(String categoryId) async {
    final response = await client.get(
      ApiType.public,
      '${EndPoints.filterDrinks}c=$categoryId',
    );
    return response;
  }
}