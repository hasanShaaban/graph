import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

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
    final lang = S.of(context);
    return TextFormField(
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
          return lang.thisFieldRequired;
        }
        return null;
      },
      style: AppTextStyle.cairoRegular20.copyWith(
        color: Constants2.darkPrimaryColor(context),
      ),
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildFocusedBorder(),
        filled: true,
        fillColor: Constants2.lightSecondaryColor(context),
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
                    ? Constants2.darkPrimaryColor(context)
                    : Constants2.darkSecondaryColor(context),
          ),
        ),
        hintText: lang.password,
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
