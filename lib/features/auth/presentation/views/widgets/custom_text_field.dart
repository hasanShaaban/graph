import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.textInputType,
    this.onSaved,
  });
  final String hintText;
  final String prefixIcon;
  final TextInputType textInputType;
  final Function(String?)? onSaved;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFoused = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextFormField(
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
        style: AppTextStyle.cairoRegular18.copyWith(
          color: Constants.darkPrimaryColor,
        ),
        keyboardType: widget.textInputType,
        decoration: InputDecoration(
          border: buildBorder(),
          enabledBorder: buildBorder(),
          focusedBorder: buildFocusedBorder(),
          filled: true,
          fillColor: Constants.lightSecondryColor,

          prefixIcon: Padding(
            padding: const EdgeInsets.all(20),
            child: SvgPicture.asset(
              widget.prefixIcon,
              width: 26,
              color:
                  isFoused
                      ? Constants.darkPrimaryColor
                      : Constants.darkSecondryColor,
            ),
          ),
          hintText: widget.hintText,
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
