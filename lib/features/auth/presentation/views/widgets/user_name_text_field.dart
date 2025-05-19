import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class userNameTextField extends StatelessWidget {
  const userNameTextField({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 155,
      height: 55,
      child: TextField(
        onTap: () {},
        
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
