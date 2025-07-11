import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';

class FinalTouchesBioSec extends StatelessWidget {
  const FinalTouchesBioSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: Constants.lightSecondryColor,
            filled: true,
          ),
        ),
        Positioned(top: -13, left: 50, child: Text('Bio')),
      ],
    );
  }
}
