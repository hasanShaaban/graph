


import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';

class FourDigitsContainer extends StatelessWidget {
  const FourDigitsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 58,
      height: 99,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants.lightSecondryColor,
    
      ),
      child: TextField(
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          counterText: '',
        ),
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
