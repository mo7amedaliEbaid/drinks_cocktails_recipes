import 'package:dio/dio.dart';
import 'package:recipes/core/network/endpoints.dart';

import '../../../../core/network/rest_client.dart';
import 'category_data_source.dart';

class CategoryDataSourceImpl implements CategoryDataSource {
  CategoryDataSourceImpl({
    required this.client,
  });

  final RestClient client;

  @override
  Future<Response> categories() async {
    final response = await client.get(
      ApiType.public,
      EndPoints.categoriesList,
    );
    return response;
  }
}
