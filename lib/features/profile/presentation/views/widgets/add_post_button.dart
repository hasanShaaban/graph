import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../create_post/presentation/views/creat_post_page.dart';

import '../../../../../generated/l10n.dart';

class AddPostButton extends StatelessWidget {
  const AddPostButton({super.key, required this.lang});

  final S lang;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Constants2.primaryColor(context),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {
          Navigator.pushNamed(context, CreatPostPage.name);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(Assets.iconsAdd, width: 16),
            SizedBox(width: 5),
            Text(
              lang.addPost,
              style: AppTextStyle.cairoRegular14.copyWith(
                color: Constants2.lightPrimaryColor(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
