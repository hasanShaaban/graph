import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/public_post.dart';
import 'package:graph/generated/l10n.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key, required this.lang, this.color});

  final S lang;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: () {
          if(PublicPost.enableNavigation == false){
            PublicPost.enableNavigation = true;
          }
           Navigator.pop(context);
        },
        child: SizedBox(
          height: 24,
          width: 24,
          child: Center(
            child: SvgPicture.asset(
              lang.lang == 'en'
                  ? Assets.iconsArrowLeft
                  : Assets.iconsArrowRight,
              color: color ?? Constants2.lightPrimaryColor(context),
              width: 14,
            ),
          ),
        ),
      ),
    );
  }
}
