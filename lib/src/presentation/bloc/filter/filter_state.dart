part of 'filter_cubit.dart';

class FilterState extends Equatable {
  const FilterState({
    this.loading = false,
    this.recipes = const [],
    this.hasError = false,
    this.errorMessage,
  });

  final bool loading;
  final List<RecipeByCategory> recipes;
  final bool hasError;
  final String? errorMessage;

  FilterState copyWith({
    bool? loading,
    List<RecipeByCategory>? recipes,
    bool? hasError,
    String? errorMessage,
  }) =>
      FilterState(
        loading: loading ?? this.loading,
        recipes: recipes ?? this.recipes,
        hasError: hasError ?? this.hasError,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  @override
  List<Object?> get props => [loading, recipes, hasError, errorMessage];
}
