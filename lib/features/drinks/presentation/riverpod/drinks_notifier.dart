import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink_model.dart';
import 'package:recipes/features/drinks/domain/use_cases/drinks_use_case.dart';

import '../../../../core/state/base_state.dart';
import '../../../categories/presentation/providers/select_category_provider.dart';

class DrinksNotifier extends StateNotifier<BaseState> {
  DrinksNotifier({
    required this.ref,
    required this.useCase,
  }) : super(InitialState()) {
    drinkList(ref.watch(selectedCategoryProvider).toString());
  }

  final Ref ref;
  final DrinkUseCase useCase;

  List<Drink> drinks = [];

  Future<void> drinkList(String categoryId) async {
    log('drinkList called with categoryId: $categoryId');
    state = const LoadingState();
    try {
      final result = await useCase.drinks(categoryId);
      result.fold(
        (l) {
          log(
            'DrinksNotifier.productList',
            error: l,
          );
          return state = ErrorState(data: l.toString());
        },
        (r) {
          drinks = r;
          return state = SuccessState(data: r);
        },
      );
    } catch (e, stacktrace) {
      log(
        'DrinksNotifier.productList',
        error: e,
        stackTrace: stacktrace,
      );
      state = ErrorState(data: e.toString());
    }
  }
}
