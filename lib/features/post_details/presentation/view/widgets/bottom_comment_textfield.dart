import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';

class BottomCommentTextField extends StatelessWidget {
  const BottomCommentTextField({
    super.key,
    required this.width,
    required this.lang,
  });

  final double width;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      child: SizedBox(
        width: width - 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: width * 45 / 2 / 412,
              backgroundImage: AssetImage(
                Assets.imagesProfileImage,
              ),
            ),
            SizedBox(
              width: width * 260 / 412,
              // height: height * 45 / 915,
              child: TextField(
                maxLines: 5,
                minLines: 1,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  filled: true,
                  fillColor: Constants2.lightSecondaryColor(
                    context,
                  ),
                  hintText: lang.addComment,
                  hintStyle: AppTextStyle.cairoSemiBold16
                      .copyWith(
                        color: Constants2.darkSecondaryColor(
                          context,
                        ),
                      ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Constants2.primaryColor(context),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Constants2.darkSecondaryColor(
                        context,
                      ),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 2,
                      color: Constants2.primaryColor(context),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: width * 45 / 412,
              height: width * 45 / 412,
              child: MaterialButton(
                onPressed: () {},
                padding: EdgeInsets.all(10),
                color: Constants2.primaryColor(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: SvgPicture.asset(Assets.iconsPaperPlane),
              ),
            ),
          ],
        ),
      ),
    );
  }
}