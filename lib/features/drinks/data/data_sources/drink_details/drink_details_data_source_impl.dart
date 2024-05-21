import 'package:dio/dio.dart';
import 'package:recipes/features/drinks/data/data_sources/drink_details/drink_details_data_source.dart';

import '../../../../../core/network/endpoints.dart';
import '../../../../../core/network/rest_client.dart';

class DrinkDetailsDataSourceImpl implements DrinkDetailsDataSource {
  DrinkDetailsDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> drinkDetails(String drinkId) async {
    final response = await client.get(
      ApiType.public,
      '${EndPoints.drinkDetails}i=$drinkId',
    );
    return response;
  }
}
