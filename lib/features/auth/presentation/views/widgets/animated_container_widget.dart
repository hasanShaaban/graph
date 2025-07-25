import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class AnimatedContainerWidget extends StatelessWidget {
  const AnimatedContainerWidget({
    super.key,
    required this.whatSelect,
    required this.text,
    required this.icon,
    required this.widthSelected,
    required this.widthNotSelected,
  });
  final String text;
  final String icon;
  final bool whatSelect;
  final double widthSelected;
  final double widthNotSelected;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      width: whatSelect ? widthSelected : widthNotSelected,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),

        color:
            whatSelect
                ? Constants2.primaryColor(context)
                : Constants2.lightSecondaryColor(context),
        boxShadow:
            whatSelect
                ? [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.9),
                    offset: Offset(8, 9),
                    blurRadius: 15,
                  ),
                ]
                : [],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            color:
                whatSelect
                    ? Constants2.lightSecondaryColor(context)
                    : Colors.black,
          ),

          SizedBox(width: 4),
          Text(
            text,
            style:
                whatSelect
                    ? AppTextStyle.cairoRegular20.copyWith(
                      color: Constants2.lightPrimaryColor(context),
                    )
                    : AppTextStyle.cairoRegular20,
          ),
        ],
      ),
    );
  }
}
