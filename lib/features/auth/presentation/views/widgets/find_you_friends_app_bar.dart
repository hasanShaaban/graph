
import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class FindYouFriendsAppBar extends StatelessWidget {
  const FindYouFriendsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 103 / 915,
      width: double.infinity,
      padding: EdgeInsets.only(left: 20, right: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        gradient: LinearGradient(
          end: Alignment.topRight,
          begin: Alignment.bottomLeft,
          colors: [Constants.primaryColor, Constants.thirdColor],
        ),
      ),
      child: Text(
        "Let's find you some friends ",
        style: AppTextStyle.cairoBold34.copyWith(
          color: Constants.lightPrimaryColor,
        ),
      ),
    );
  }
}
