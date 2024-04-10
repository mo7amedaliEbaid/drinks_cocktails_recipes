import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:recipes/core/router/routes.dart';
import 'package:recipes/features/home/presentation/screens/home.dart';
import 'package:recipes/features/drinks/presentation/screens/drinks_by_category.dart';
import 'package:recipes/features/on_boarding/presentation/screens/on_boarding_screen.dart';

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
          pageBuilder: (context, state) {
            return CustomTransitionPage<void>(
              key: state.pageKey,
              child: const HomeScreen(),
              barrierDismissible: true,
              barrierColor: Colors.transparent,
              opaque: false,
              transitionDuration: const Duration(milliseconds: 600),
              reverseTransitionDuration: const Duration(milliseconds: 200),
              transitionsBuilder: (BuildContext context,
                  Animation<double> animation,
                  Animation<double> secondaryAnimation,
                  Widget child) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(1.0, 0.0), // Slide from right
                    end: Offset.zero,
                  ).animate(
                    CurvedAnimation(
                      parent: animation,
                      curve: Curves.easeInOut,
                    ),
                  ),
                  child: child,
                );
              },
            );
          },
        ),
        GoRoute(
          path: Routes.drinks.name,
          name: Routes.drinks.name,
          pageBuilder: (context, state) {
            return MaterialPage(
              key: state.pageKey,
              child: DrinksByCategoryScreen(),
            );
          },
        ),
      ],
    ),
  ],
);
