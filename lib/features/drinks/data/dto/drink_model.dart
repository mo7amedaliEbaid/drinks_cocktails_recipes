import 'package:freezed_annotation/freezed_annotation.dart';

part 'drink_model.freezed.dart';
part 'drink_model.g.dart';

@freezed
class Drink with _$Drink {
  const factory Drink({
    required String strDrink,
    required String strDrinkThumb,
    required String idDrink,
  }) = _Drink;

  factory Drink.fromJson(Map<String, dynamic> json) => _$DrinkFromJson(json);
}