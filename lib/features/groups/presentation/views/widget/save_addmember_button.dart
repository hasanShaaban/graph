import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class SaveAddmemberButton extends StatelessWidget {
  const SaveAddmemberButton({
    super.key,
    required this.text,
    required this.icon,
  });
  final String text;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 180 / 412,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Constants.primaryColor,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(icon),
              SizedBox(width: 5),
              Text(
                text,
                style: AppTextStyle.cairoSemiBold18.copyWith(
                  color: Constants.lightPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
