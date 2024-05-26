import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:recipes/features/search/domain/use_cases/search_use_case.dart';
import 'package:recipes/features/search/presentation/provider/searched_drinks_notifier.dart';
import '../../../../core/state/base_state.dart';

final searchProvider = StateNotifierProvider<SearchedDrinksNotifier, BaseState>(
  (ref) {
    return SearchedDrinksNotifier(
      ref: ref,
      useCase: ref.watch(searchUseCaseProvider),
    );
  },
);
