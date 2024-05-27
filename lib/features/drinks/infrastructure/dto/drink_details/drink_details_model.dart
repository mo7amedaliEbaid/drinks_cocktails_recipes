import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'drink_details_model.freezed.dart';
part 'drink_details_model.g.dart';

@freezed
@HiveType(typeId: 0)
class DrinkDetails with _$DrinkDetails {
  const factory DrinkDetails({
    @HiveField(0) required String idDrink,
    @HiveField(1) required String strDrink,
    @HiveField(2) String? strDrinkAlternate,
    @HiveField(3) String? strTags,
    @HiveField(4) String? strVideo,
    @HiveField(5) String? strCategory,
    @HiveField(6) String? strIBA,
    @HiveField(7) String? strAlcoholic,
    @HiveField(8) String? strGlass,
    @HiveField(9) String? strInstructions,
    @HiveField(10) String? strInstructionsES,
    @HiveField(11) String? strInstructionsDE,
    @HiveField(12) String? strInstructionsFR,
    @HiveField(13) String? strInstructionsIT,
    @HiveField(14) String? strInstructionsZH_HANS,
    @HiveField(15) String? strInstructionsZH_HANT,
    @HiveField(16) String? strDrinkThumb,
    @HiveField(17) String? strIngredient1,
    @HiveField(18) String? strIngredient2,
    @HiveField(19) String? strIngredient3,
    @HiveField(20) String? strIngredient4,
    @HiveField(21) String? strIngredient5,
    @HiveField(22) String? strIngredient6,
    @HiveField(23) String? strIngredient7,
    @HiveField(24) String? strIngredient8,
    @HiveField(25) String? strIngredient9,
    @HiveField(26) String? strIngredient10,
    @HiveField(27) String? strIngredient11,
    @HiveField(28) String? strIngredient12,
    @HiveField(29) String? strIngredient13,
    @HiveField(30) String? strIngredient14,
    @HiveField(31) String? strIngredient15,
    @HiveField(32) String? strMeasure1,
    @HiveField(33) String? strMeasure2,
    @HiveField(34) String? strMeasure3,
    @HiveField(35) String? strMeasure4,
    @HiveField(36) String? strMeasure5,
    @HiveField(37) String? strMeasure6,
    @HiveField(38) String? strMeasure7,
    @HiveField(39) String? strMeasure8,
    @HiveField(40) String? strMeasure9,
    @HiveField(41) String? strMeasure10,
    @HiveField(42) String? strMeasure11,
    @HiveField(43) String? strMeasure12,
    @HiveField(44) String? strMeasure13,
    @HiveField(45) String? strMeasure14,
    @HiveField(46) String? strMeasure15,
    @HiveField(47) String? strImageSource,
    @HiveField(48) String? strImageAttribution,
    @HiveField(49) String? strCreativeCommonsConfirmed,
    @HiveField(50) String? dateModified,
  }) = _DrinkDetails;

  factory DrinkDetails.fromJson(Map<String, dynamic> json) => _$DrinkDetailsFromJson(json);
}
