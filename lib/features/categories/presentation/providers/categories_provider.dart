import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/categories/data/dto/category_model.dart';

import '../../domain/use_cases/category_use_case.dart';

final categoriesProvider = FutureProvider<List<Category>>(
      (ref) async {
    final categories = await ref.watch(categoryUseCaseProvider).categories();

    return categories.fold(
          (l) {
        log(
          'categoriesProvider',
          error: l,
        );
        return [];
      },
          (r) => r,
    );
  },
);