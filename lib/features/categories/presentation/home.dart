import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/features/categories/presentation/providers/categories_provider.dart';
import 'package:recipes/features/categories/presentation/providers/select_category_provider.dart';
import 'package:recipes/features/drinks/presentation/screens/drinks_by_category.dart';

import '../../../core/router/routes.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoriesState = ref.watch(categoriesProvider);
    return Scaffold(
      body: categoriesState.when(
        data: (categories) {
          return GestureDetector(
              onTap: () {
                ref.read(selectedCategoryProvider.notifier).state =
                    categories.first.strCategory.toString();
                //   context.goNamed(Routes.drinks.name)
                //   ;
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DrinksByCategoryScreen()));
              },
              child:
                  Center(child: Text(categories.first.strCategory.toString())));
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) {
          log(
            "ProductListPage.categoriesState.when",
            error: error.toString(),
            stackTrace: stackTrace,
          );
          return const Center(child: Text('Error'));
        },
      ),
    );
  }
}
