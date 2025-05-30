import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

// ignore: camel_case_types
class customDropDownButton extends StatelessWidget {
  const customDropDownButton({
    super.key,
    required this.list,
    required this.text,
    required this.onChanged,
  });
  final List<String>? list;
  final String text;
  final ValueChanged onChanged;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 55,
      decoration: BoxDecoration(
        color: Constants.primaryColor,
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          isExpanded: true,
          items:
              list!.map((String items) {
                return DropdownMenuItem(value: items, child: Text(items));
              }).toList(),
          onChanged: onChanged,
          hint: Center(
            child: Text(
              text,

              style: AppTextStyle.cairoBold18.copyWith(
                color: Constants.lightPrimaryColor,
              ),
            ),
          ),
          icon: Padding(
            padding: const EdgeInsets.only(right: 70),
            child: SvgPicture.asset(Assets.iconsDrobeDownArrow),
          ),
          iconSize: 20,
//           menuWidth: 200,
        ),
      ),
    );
  }
}
