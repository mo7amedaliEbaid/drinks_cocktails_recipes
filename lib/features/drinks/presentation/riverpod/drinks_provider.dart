import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/drinks/domain/use_cases/drinks_use_case.dart';
import 'package:recipes/features/drinks/presentation/riverpod/drinks_notifier.dart';

import '../../../../core/state/base_state.dart';

final drinksProvider = StateNotifierProvider<DrinksNotifier, BaseState>(
  (ref) {
    return DrinksNotifier(
      ref: ref,
      useCase: ref.watch(drinkUseCaseProvider),
    );
  },
);
