import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/router/routes.dart';
import 'package:recipes/features/categories/presentation/home.dart';
import 'package:recipes/features/drinks/presentation/screens/drinks_by_category.dart';

final goRouterProvider = Provider((ref) => _router);

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.home.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const HomeScreen(),
        );
      },
      routes: [
        /*GoRoute(
          path: Routes.productList.name,
          name: Routes.productDetails.name,
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: ProductDetailsPage(
                productId: int.parse(state.queryParameters['id']!),
              ),
            );
          },
        ),*/
        GoRoute(
          path: Routes.drinks.name,
          name: Routes.drinks.name,
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: DrinksByCategoryScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
