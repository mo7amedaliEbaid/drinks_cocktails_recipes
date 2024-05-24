sealed class AppStrings {
  static List<String> ingredients = [
    'Mint Leaves',
    'Lemon Wedges',
    'Lemon Juice',
    'Ice Cubes',
    'Sugar',
    'Club Soda',
  ];
}

sealed class NetworkImages {
  static const String ordinary =
      "https://www.thecocktaildb.com/images/media/drink/rrtssw1472668972.jpg";
  static const String cocktail =
      "https://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg";
  static const String shake =
      "https://www.thecocktaildb.com/images/media/drink/rvwrvv1468877323.jpg";
  static const String other =
      "https://www.thecocktaildb.com/images/media/drink/tqxyxx1472719737.jpg";
  static const String cocoa =
      "https://www.thecocktaildb.com/images/media/drink/3nbu4a1487603196.jpg";
  static const String shot =
      "https://www.thecocktaildb.com/images/media/drink/yyrwty1468877498.jpg";
  static const String coffee =
      "https://www.thecocktaildb.com/images/media/drink/vyrurp1472667777.jpg";
  static const String liqueur =
      "https://www.thecocktaildb.com/images/media/drink/uxxtrt1472667197.jpg";
  static const String party =
      "https://www.thecocktaildb.com/images/media/drink/tpxurs1454513016.jpg";
  static const String beer =
      "https://www.thecocktaildb.com/images/media/drink/xxyywq1454511117.jpg";
  static const String soft =
      "https://www.thecocktaildb.com/images/media/drink/qxrvqw1472718959.jpg";

  static const List<String> categories = [
    ordinary,
    cocktail,
    shake,
    other,
    cocoa,
    shot,
    coffee,
    liqueur,
    party,
    beer,
    soft,
  ];
}

sealed class FontFamilies {
  static const String poppins = "Poppins";
  static const String raleway = "Raleway";
}
