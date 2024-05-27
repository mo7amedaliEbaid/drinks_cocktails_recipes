import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/router/routes.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/home/presentation/screens/home.dart';
import 'package:recipes/features/drinks/presentation/screens/drinks_by_category.dart';
import 'package:recipes/features/on_boarding/presentation/screens/on_boarding_screen.dart';
import 'package:recipes/features/register/presentation/screens/register.dart';

import '../../features/drinks/presentation/screens/drinkDetails.dart';
import '../../features/favourites/presentation/screens/favourites.dart';
import 'custom_transition_page.dart';

final goRouterProvider = Provider((ref) => _router);
final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: Routes.onBoarding.name,
      pageBuilder: (context, state) {
        return MaterialPage(
          key: state.pageKey,
          child: const OnBoardingScreen(),
        );
      },
      routes: [
        GoRoute(
          path: Routes.home.name,
          name: Routes.home.name,
          pageBuilder: (context, state) => buildCustomTransitionPage(
            state,
            const HomeScreen(),
          ),
          routes: [
            GoRoute(
              path: Routes.drinks.name,
              name: Routes.drinks.name,
              pageBuilder: (context, state) {
                final String categoryName = state.extra as String;
                return buildCustomTransitionPage(
                  state,
                  DrinksByCategoryScreen(
                    categoryName: categoryName,
                  ),
                );
              },
            ),
            GoRoute(
              path: Routes.drinkDetails.name,
              name: Routes.drinkDetails.name,
              pageBuilder: (context, state) {
                return buildCustomTransitionPage(
                  state,
                  const DrinkDetailsScreen(),
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: Routes.favorites.name,
          name: Routes.favorites.name,
          pageBuilder: (context, state) {
            return buildCustomTransitionPage(
              state,
              const FavoritesScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
