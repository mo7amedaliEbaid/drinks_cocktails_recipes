import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipe_model.freezed.dart';
part 'recipe_model.g.dart';

@freezed
class Recipe with _$Recipe{
  const factory Recipe({
    required String idDrink,
    required String strDrink,
    @JsonKey(name: 'strDrinkAlternate') String? alternateName,
    String? strTags,
    String? strVideo,
    String? strCategory,
    @JsonKey(name: 'strIBA') String? iba,
    @JsonKey(name: 'strAlcoholic') String? isAlcoholic,
    @JsonKey(name: 'strGlass') String? glassType,
    @JsonKey(name: 'strInstructions') String? instructions,
    @JsonKey(name: 'strInstructionsES') String? instructionsES,
    @JsonKey(name: 'strInstructionsDE') String? instructionsDE,
    @JsonKey(name: 'strInstructionsFR') String? instructionsFR,
    @JsonKey(name: 'strInstructionsIT') String? instructionsIT,
    @JsonKey(name: 'strInstructionsZH-HANS') String? instructionsZH_HANS,
    @JsonKey(name: 'strInstructionsZH-HANT') String? instructionsZH_HANT,
    @JsonKey(name: 'strDrinkThumb') required String strDrinkThumb,
    @JsonKey(name: 'strIngredient1') String? ingredient1,
    @JsonKey(name: 'strIngredient2') String? ingredient2,
    @JsonKey(name: 'strIngredient3') String? ingredient3,
    @JsonKey(name: 'strIngredient4') String? ingredient4,
    @JsonKey(name: 'strIngredient5') String? ingredient5,
    @JsonKey(name: 'strIngredient6') String? ingredient6,
    @JsonKey(name: 'strIngredient7') String? ingredient7,
    @JsonKey(name: 'strIngredient8') String? ingredient8,
    @JsonKey(name: 'strIngredient9') String? ingredient9,
    @JsonKey(name: 'strIngredient10') String? ingredient10,
    @JsonKey(name: 'strIngredient11') String? ingredient11,
    @JsonKey(name: 'strIngredient12') String? ingredient12,
    @JsonKey(name: 'strIngredient13') String? ingredient13,
    @JsonKey(name: 'strIngredient14') String? ingredient14,
    @JsonKey(name: 'strIngredient15') String? ingredient15,
    @JsonKey(name: 'strMeasure1') String? measure1,
    @JsonKey(name: 'strMeasure2') String? measure2,
    @JsonKey(name: 'strMeasure3') String? measure3,
    @JsonKey(name: 'strMeasure4') String? measure4,
    @JsonKey(name: 'strMeasure5') String? measure5,
    @JsonKey(name: 'strMeasure6') String? measure6,
    @JsonKey(name: 'strMeasure7') String? measure7,
    @JsonKey(name: 'strMeasure8') String? measure8,
    @JsonKey(name: 'strMeasure9') String? measure9,
    @JsonKey(name: 'strMeasure10') String? measure10,
    @JsonKey(name: 'strMeasure11') String? measure11,
    @JsonKey(name: 'strMeasure12') String? measure12,
    @JsonKey(name: 'strMeasure13') String? measure13,
    @JsonKey(name: 'strMeasure14') String? measure14,
    @JsonKey(name: 'strMeasure15') String? measure15,
    @JsonKey(name: 'strImageSource') String? imageSource,
    @JsonKey(name: 'strImageAttribution') String? imageAttribution,
    @JsonKey(name: 'strCreativeCommonsConfirmed') String? isCreativeCommonsConfirmed,
    @JsonKey(name: 'dateModified') String? dateModified,
  }) = _Recipe;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);
}
