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
    required this.width,
    required this.height,
    required this.border,
    required this.iconPadding,

  });
  final List<String>? list;

  final String text;
  final ValueChanged onChanged;
  final double width;
  final double height;
  final double border;
  final double iconPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
 
      decoration: BoxDecoration(
        color: Constants2.primaryColor(context),
        borderRadius: BorderRadius.circular(border),
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

              style: AppTextStyle.cairoRegular18.copyWith(
                color: Constants2.lightPrimaryColor(context),
              ),
            ),
          ),
          icon: Padding(
            padding: EdgeInsets.only(right: iconPadding),
            child: SvgPicture.asset(Assets.iconsDrobeDownArrow),
          ),
          iconSize: 20,
          //           menuWidth: 200,
        ),
      ),
    );
  }
}
