import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/setting/presentation/views/settings_view.dart';
import 'package:graph/generated/l10n.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key, required this.lang});

  final S lang;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Constants.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, SettingsView.name);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.iconsAdd, width: 16),
            SizedBox(width: 5),
            Text(
              lang.addPost,
              style: AppTextStyle.cairoRegular14.copyWith(
                color: Constants.lightPrimaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
