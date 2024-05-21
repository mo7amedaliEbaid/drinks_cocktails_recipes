import 'package:freezed_annotation/freezed_annotation.dart';

part 'drink_details_model.freezed.dart';
part 'drink_details_model.g.dart';

@freezed
class DrinkDetails with _$DrinkDetails {
  const factory DrinkDetails({
    required String idDrink,
    required String strDrink,
    String? strDrinkAlternate,
    String? strTags,
    String? strVideo,
    String? strCategory,
    String? strIBA,
    String? strAlcoholic,
    String? strGlass,
    String? strInstructions,
    String? strInstructionsES,
    String? strInstructionsDE,
    String? strInstructionsFR,
    String? strInstructionsIT,
    String? strInstructionsZH_HANS,
    String? strInstructionsZH_HANT,
    String? strDrinkThumb,
    String? strIngredient1,
    String? strIngredient2,
    String? strIngredient3,
    String? strIngredient4,
    String? strIngredient5,
    String? strIngredient6,
    String? strIngredient7,
    String? strIngredient8,
    String? strIngredient9,
    String? strIngredient10,
    String? strIngredient11,
    String? strIngredient12,
    String? strIngredient13,
    String? strIngredient14,
    String? strIngredient15,
    String? strMeasure1,
    String? strMeasure2,
    String? strMeasure3,
    String? strMeasure4,
    String? strMeasure5,
    String? strMeasure6,
    String? strMeasure7,
    String? strMeasure8,
    String? strMeasure9,
    String? strMeasure10,
    String? strMeasure11,
    String? strMeasure12,
    String? strMeasure13,
    String? strMeasure14,
    String? strMeasure15,
    String? strImageSource,
    String? strImageAttribution,
    String? strCreativeCommonsConfirmed,
    String? dateModified,
  }) = _DrinkDetails;

  factory DrinkDetails.fromJson(Map<String, dynamic> json) => _$DrinkDetailsFromJson(json);
}
