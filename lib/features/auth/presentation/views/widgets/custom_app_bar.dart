import 'package:flutter/material.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text1, required this.text2, required this.onPressed});
  final String text1;
  final String text2;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // leading: IconButton(
      //   onPressed: onPressed,
      //   // onPressed: () {
      //   //   WidgetsBinding.instance.addPostFrameCallback((_) {
      //   //     Navigator.canPop(context);
      //   //   });
      //   // },
      //   icon: Align(
      //     alignment: Alignment.topLeft,

      //     child: Padding(
      //       padding: const EdgeInsets.all(8),
      //       child: SvgPicture.asset(
      //         Assets.iconsArrowLeft,

      //         color: Constants.lightSecondryColor,
      //       ),
      //     ),
      //   ),
      // ),

      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomLeft,
            colors: [Color(0xfff007571), Color(0xfffc0efe0)],
          ),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(52),
            bottomRight: Radius.circular(52),
          ),
        ),

        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text1,
                style: AppTextStyle.cairoBold34.copyWith(
                  color: Constants.lightPrimaryColor,
                  height: 1.5,
                ),
              ),

              Text(
                text2,
                style: AppTextStyle.cairoRegular24.copyWith(
                  height: 1,
                  color: Constants.lightPrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(200);
}
