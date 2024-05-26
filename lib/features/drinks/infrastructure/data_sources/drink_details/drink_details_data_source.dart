import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/network/network.dart';
import 'drink_details_data_source_impl.dart';

abstract class DrinkDetailsDataSource {
  Future<Response> drinkDetails(String drinkId);
}

final drinkDetailsDataSourceProvider = Provider<DrinkDetailsDataSource>(
  (ref) => DrinkDetailsDataSourceImpl(
    client: ref.watch(dioProvider),
  ),
);
