import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class userNameTextField extends StatelessWidget {
  const userNameTextField({
    super.key,
    required this.text,
    this.controller,
    required this.width,
    this.textInputType,
  });
  final String text;
  final TextEditingController? controller;
  final double width;
  final TextInputType? textInputType;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 55,
      child: TextFormField(
        keyboardType: textInputType,
        controller: controller,
        //  textAlign: TextAlign.center,
        decoration: InputDecoration(
          filled: true,
          fillColor: Constants.lightSecondryColor,

          hintText: text,
          hintStyle: AppTextStyle.cairoBold18,

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Constants.darkPrimaryColor, width: 2),
          ),
        ),
      ),
    );
  }
}
