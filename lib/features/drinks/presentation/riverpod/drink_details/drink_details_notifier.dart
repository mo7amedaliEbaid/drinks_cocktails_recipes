import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/data/dto/drink_details/drink_details_model.dart';
import 'package:recipes/features/drinks/domain/use_cases/drink_details_use_case.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink_details/selected_drink_provider.dart';

import '../../../../../core/state/base_state.dart';

class DrinkDetailsNotifier extends StateNotifier<BaseState> {
  DrinkDetailsNotifier({
    required this.ref,
    required this.useCase,
  }) : super(InitialState()) {
    fetchDrinkDetails(ref.watch(selectedDrinkProvider).toString());
  }

  final Ref ref;
  final DrinkDetailsUseCase useCase;

  List<DrinkDetails> drinkDetails = [];

  Future<void> fetchDrinkDetails(String drinkId) async {
    log('drinkDetails called with drinkId: $drinkId');
    state = const LoadingState();
    try {
      final result = await useCase.drinkDetails(drinkId);
      result.fold(
        (l) {
          log(
            'DrinkDetailsNotifier.drinkDetails',
            error: l,
          );
          return state = ErrorState(data: l.toString());
        },
        (r) {
          drinkDetails = r;
          return state = SuccessState(data: r);
        },
      );
    } catch (e, stacktrace) {
      log(
        'DrinkDetailsNotifier.drinkDetails',
        error: e,
        stackTrace: stacktrace,
      );
      state = ErrorState(data: e.toString());
    }
  }
}
