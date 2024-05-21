import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drink_details/drink_details_notifier.dart';

import '../../../../../core/state/base_state.dart';
import '../../../domain/use_cases/drink_details_use_case.dart';

final drinkDetailsProvider =
    StateNotifierProvider<DrinkDetailsNotifier, BaseState>(
  (ref) {
    return DrinkDetailsNotifier(
      ref: ref,
      useCase: ref.watch(drinkDetailsUseCaseProvider),
    );
  },
);
