import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class CustomPasswordField extends StatefulWidget {
  const CustomPasswordField({super.key, this.onSaved});

  final Function(String?)? onSaved;

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  bool isFoused = false;
  bool obscure = false;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
        obscureText: obscure,
        obscuringCharacter: '•',
        onTap: () {
          setState(() {
            isFoused = true;
          });
        },
        onSaved: widget.onSaved,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field is required';
          }
          return null;
        },
        style: AppTextStyle.cairoRegular20.copyWith(
          color: Constants.darkPrimaryColor,
        ),
        keyboardType: TextInputType.visiblePassword,
        decoration: InputDecoration(
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildFocusedBorder(),
          filled: true,
          fillColor: Constants.lightSecondryColor,
          suffixIcon: GestureDetector(
            onTap: () {
              setState(() {
                obscure = !obscure;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SvgPicture.asset(
                obscure ? Assets.iconsEyeCrossed : Assets.iconsEye,
                width: 24,
              ),
            ),
          ),
          prefixIcon: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              Assets.iconsPassword,
              width: 26,
              color:
                  isFoused
                      ? Constants.darkPrimaryColor
                      : Constants.darkSecondryColor,
            ),
          ),
          hintText: 'Password',
          hintStyle: AppTextStyle.cairoRegular20,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 1, color: Colors.transparent),
    );
  }

  OutlineInputBorder buildFocusedBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: const BorderSide(width: 2, color: Constants.darkPrimaryColor),
    );
  }
}
