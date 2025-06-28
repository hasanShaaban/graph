import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/custom_back_button.dart';
import 'package:graph/generated/l10n.dart';

class CustomStatelessAppbar extends StatelessWidget {
  const CustomStatelessAppbar({super.key, required this.lang, required this.title});
  final S lang;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Constants.primaryColor, Constants.thirdColor],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Row(
        children: [
          CustomBackButton(lang: lang),
          SizedBox(width: 10),
          Text(
            title,
            style: AppTextStyle.cairoSemiBold24.copyWith(
              color: Constants.lightPrimaryColor,
            ),
          ),
        ],
      ),
    );
  }
}


