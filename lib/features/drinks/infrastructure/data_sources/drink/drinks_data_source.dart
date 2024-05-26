import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/network.dart';
import 'drinks_data_source_imp.dart';

final drinksDataSourceProvider = Provider<DrinksDataSource>(
      (ref) => DrinksDataSourceImpl(
    client: ref.watch(dioProvider),
  ),
);

abstract class DrinksDataSource {
  Future<Response> drinks(String categoryId);
}