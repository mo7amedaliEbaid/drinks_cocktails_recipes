import 'package:flutter/material.dart';

import 'custom_painter.dart';

class GradientTopPaint extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.sizeOf(context).height, // Adjust height as needed
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white, // Start color
                Color(0xFFFEF9E4), // End color
              ],
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // Shadow position
              ),
            ],
          ),
        ),
        CustomPaint(
          size: Size(double.infinity,
              MediaQuery.sizeOf(context).height), // Adjust size as needed
          painter: TopPaint(),
        ),
      ],
    );
  }
}
