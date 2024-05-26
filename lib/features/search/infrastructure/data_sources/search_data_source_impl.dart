import 'package:dio/dio.dart';
import 'package:recipes/features/search/infrastructure/data_sources/search_data_source.dart';

import '../../../../core/network/endpoints.dart';
import '../../../../core/network/rest_client.dart';

class SearchDataSourceImpl implements SearchDataSource {
  SearchDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> drinks(String searchValue) async {
    final response = await client.get(
      ApiType.public,
      '${EndPoints.searchDrinks}s=$searchValue',
    );
    return response;
  }
}
