import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class UserNameTextField extends StatelessWidget {
  const UserNameTextField({
    super.key,
    required this.text,
    this.controller,
    required this.width,
    this.textInputType,
    this.onSaved,
  });
  final String text;
  final TextEditingController? controller;
  final double width;
  final TextInputType? textInputType;
  final Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return SizedBox(
      width: width,
      child: TextFormField(
        onSaved: onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return lang.thisFieldRequired;
          }
          return null;
        },
        keyboardType: textInputType,
        controller: controller,
        decoration: InputDecoration(
          filled: true,
          fillColor: Constants2.lightSecondaryColor(context),

          hintText: text,
          hintStyle: AppTextStyle.cairoBold18.copyWith(
            color: Constants2.darkSecondaryColor(context),
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Constants2.primaryColor(context),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(color: Colors.red, width: 2),
          ),
        ),
      ),
    );
  }
}
