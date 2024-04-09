import 'package:recipes/core/network/rest_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider(
  (ref) {
    return RestClient(
      baseUrl: 'www.thecocktaildb.com/api/json/v1/1/',
      token: '',
    );
  },
);
