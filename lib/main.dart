import 'package:flutter/material.dart';
import 'payment_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Payment Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PaymentScreen(),
    );
  }
}
