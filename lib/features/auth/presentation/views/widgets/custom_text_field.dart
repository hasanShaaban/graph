import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.textInputType,
    this.onSaved,
    TextEditingController? controller,
    this.validator,
    this.onChanged,
  });
  final String hintText;
  final String prefixIcon;
  final TextInputType textInputType;
  final Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final ValueChanged<String>? onChanged;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isFoused = false;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return TextFormField(
      onTap: () {
        setState(() {
          isFoused = true;
        });
      },
      onSaved: widget.onSaved,
      onChanged: widget.onChanged,
      validator:
          widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return lang.thisFieldRequired;
            }
            return null;
          },

      style: AppTextStyle.cairoRegular18.copyWith(
        color: Constants2.darkPrimaryColor(context),
      ),
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        filled: true,
        fillColor: Constants2.lightSecondaryColor(context),

        prefixIcon: Padding(
          padding: const EdgeInsets.all(20),
          child: SvgPicture.asset(
            widget.prefixIcon,
            width: 26,
            color:
                isFoused
                    ? Constants2.darkPrimaryColor(context)
                    : Constants2.darkSecondaryColor(context),
          ),
        ),
        hintText: widget.hintText,
        hintStyle: AppTextStyle.cairoRegular20,
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
      borderSide: BorderSide(
        width: 2,
        color: Constants2.darkPrimaryColor(context),
      ),
    );
  }
}
