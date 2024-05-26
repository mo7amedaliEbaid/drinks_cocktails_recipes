import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/infrastructure/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/search/domain/use_cases/search_use_case.dart';
import 'package:recipes/features/search/presentation/provider/search_value_provider.dart';

import '../../../../core/state/base_state.dart';

class SearchedDrinksNotifier extends StateNotifier<BaseState> {
  SearchedDrinksNotifier({
    required this.ref,
    required this.useCase,
  }) : super(InitialState()) {
    drinkList(ref.watch(searchValueProvider).toString());
  }

  final Ref ref;
  final SearchUseCase useCase;

  List<DrinkDetails> drinks = [];

  Future<void> drinkList(String searchValue) async {
    log('drinkList called with searchValue: $searchValue');
    state = const LoadingState();
    try {
      final result = await useCase.drinks(searchValue);
      result.fold(
        (l) {
          log(
            'SearchNotifier.searched',
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
        'SearchNotifier.searched',
        error: e,
        stackTrace: stacktrace,
      );
      state = ErrorState(data: e.toString());
    }
  }
}
