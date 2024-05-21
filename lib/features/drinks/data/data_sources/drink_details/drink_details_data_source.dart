import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/data_sources/drink_details/drink_details_data_source_impl.dart';

import '../../../../../core/network/network.dart';

abstract class DrinkDetailsDataSource {
  Future<Response> drinkDetails(String drinkId);
}

final drinkDetailsDataSourceProvider = Provider<DrinkDetailsDataSource>(
  (ref) => DrinkDetailsDataSourceImpl(
    client: ref.watch(dioProvider),
  ),
);
