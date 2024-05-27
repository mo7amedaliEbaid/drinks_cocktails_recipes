import 'package:flutter/material.dart';

import '../../../drinks/infrastructure/dto/drink_details/drink_details_model.dart';

class FavouriteDrinkItem extends StatelessWidget {
  final DrinkDetails drink;

  const FavouriteDrinkItem({Key? key, required this.drink}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(drink.strDrinkThumb ?? '', fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              drink.strDrink,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
