import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class BottomAppBarWidget extends StatelessWidget {
  const BottomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return BottomAppBar(
      shape: CircularNotchedRectangle(), // ← هذه اللي تعمل الانحناء
      notchMargin: 6.0, // المسافة بين الزر والانحناء
      shadowColor: Colors.black,
      elevation: 10,
      child: SizedBox(
        height: 63.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20),
            GestureDetector(
              child: SvgPicture.asset(
                Assets.iconsHome,
                color: Constants2.darkPrimaryColor(context),
              ),
            ),

            GestureDetector(
              child: Stack(
                children: [
                  SvgPicture.asset(Assets.iconsNotifecationBell),
                  Positioned(
                    right: 2,
                    top: 2,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              child: Container(
                width: MediaQuery.of(context).size.width * 108 / 412,
                height: 34,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Constants2.lightSecondaryColor(context),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      Assets.iconsSettings,
                      color: Constants2.primaryColor(context),
                    ),
                    SizedBox(width: 10),
                    Text(
                      lang.settings,
                      style: AppTextStyle.cairoSemiBold16.copyWith(
                        color: Constants2.primaryColor(context),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              child: SvgPicture.asset(
                Assets.iconsSearch,
                color: Constants2.darkPrimaryColor(context),
              ),
            ),
            SizedBox(width: 80),
          ],
        ),
      ),
    );
  }
}
