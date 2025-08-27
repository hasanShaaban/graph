import 'package:flutter/material.dart';

import '../../../../../core/utils/constants.dart';

class FourDigitsContainer extends StatelessWidget {
  const FourDigitsContainer({
    super.key,
    required this.controller,
    required this.focusNode,
    this.nextFocus,
    required this.onChanged,
  });
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocus;
  final VoidCallback onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 55 / 412,
      height: 88,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Constants2.lightSecondaryColor(context),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        maxLength: 1,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
          counterText: '',
        ),
        style: TextStyle(fontSize: 30),
        onChanged: (value) {
          if (value.length == 1 && nextFocus != null) {
            FocusScope.of(context).requestFocus(nextFocus);
          }
          onChanged();
        },
      ),
    );
  }
}
