import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class AuthAppBar extends StatelessWidget {
  AuthAppBar({
    super.key,
    required this.text1,
    required this.text2,
    required this.onPressed,
    this.height,
  });
  final String text1;
  final String text2;
  double? height;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height ?? MediaQuery.of(context).size.height * (230 / 890),
      padding: EdgeInsets.only(left: 22, right: 22, top: 22),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [
            Constants2.primaryColor(context),
            Constants2.thirdColor(context),
          ],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(52),
          bottomRight: Radius.circular(52),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: GestureDetector(
              onTap: onPressed,
              child: SvgPicture.asset(
                Assets.iconsArrowLeft,
                color: Constants2.lightPrimaryColor(context),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            text1,
            style: AppTextStyle.cairoBold34.copyWith(
              color: Constants2.lightPrimaryColor(context),
              height: 1.5,
            ),
          ),

          Text(
            text2,
            style: AppTextStyle.cairoRegular24.copyWith(
              height: 1,
              color: Constants2.lightPrimaryColor(context),
            ),
          ),
        ],
      ),
    );
  }
}
