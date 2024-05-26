import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/search/infrastructure/data_sources/search_data_source_impl.dart';

import '../../../../core/network/network.dart';

final searchDataSourceProvider = Provider<SearchDataSource>(
  (ref) => SearchDataSourceImpl(
    client: ref.watch(dioProvider),
  ),
);

abstract class SearchDataSource {
  Future<Response> drinks(String searchValue);
}
