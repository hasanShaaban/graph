import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class RoleTextField extends StatelessWidget {
  const RoleTextField({
    super.key,
    required this.width,
    required this.lang,
    required this.onSubmitted,
    required this.controller,
  });

  final double width;
  final S lang;
  final Function(String) onSubmitted;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: SizedBox(
        width: width * 250 / 412,
        height: 40,
        child: TextField(
          controller: controller,
          onSubmitted: onSubmitted,
          style: AppTextStyle.cairoRegular16.copyWith(
            color: Constants2.lightPrimaryColor(context),
          ),
          textAlign: TextAlign.center,
          scrollPadding: EdgeInsets.symmetric(horizontal: 10),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),

            filled: true,
            fillColor: Constants2.primaryColor(context),
            hintText: lang.enterYourRole,
            hintStyle: AppTextStyle.cairoRegular16.copyWith(
              color: Constants2.lightPrimaryColor(context),
            ),
            enabledBorder: buildBorder(),
            focusedBorder: buildBorder(),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(13),
      borderSide: BorderSide.none,
    );
  }
}
