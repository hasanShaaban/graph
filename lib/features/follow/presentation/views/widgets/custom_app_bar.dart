import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text1, required this.onPressed});
  final String text1;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: onPressed,

        icon: Align(
          alignment: Alignment.topLeft,

          child: Padding(
            padding: const EdgeInsets.all(8),
            child: SvgPicture.asset(
              Assets.iconsArrowLeft,

              color: Constants.lightSecondryColor,
            ),
          ),
        ),
      ),
      title: Text(
        text1,
        style: AppTextStyle.cairoRegular24.copyWith(
          color: Constants.lightPrimaryColor,
        ),
      ),

      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        height: 79,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomLeft,
            colors: [Color(0xfff007571), Color(0xfffc0efe0)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),

      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(100);
}
