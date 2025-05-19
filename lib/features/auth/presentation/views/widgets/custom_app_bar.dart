import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/auth/presentation/views/sign_up_view.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.text1, required this.text2});
  final String text1;
  final String text2;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.popAndPushNamed(context, SignUpView.name);
          });
        },
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

      backgroundColor: Colors.transparent,
      elevation: 0,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            end: Alignment.topRight,
            begin: Alignment.bottomLeft,
            colors: [Color(0xFFF007571), Color(0xFFFC0EFE0)],
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
