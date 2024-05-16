import 'package:flutter/material.dart';
import 'package:recipes/core/core.dart';
import 'package:recipes/configs/configs.dart';
import 'package:recipes/features/drinks/data/dto/drink_model.dart';

Widget drinkItem({required Drink drink}) {
  return SizedBox(

    width: 100,
    child: Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              drink.strDrinkThumb,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              drink.strDrink,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    ),
  );
}
