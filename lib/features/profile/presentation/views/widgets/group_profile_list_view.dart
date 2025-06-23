import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/presentation/views/widgets/group_member_info.dart';
import 'package:graph/generated/l10n.dart';

class GroupProfileListView extends StatelessWidget {
  const GroupProfileListView({
    super.key,
    required this.height,
    required this.width,
    required this.lang,
  });

  final double height;
  final double width;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 105 / 890,
      width: width,
      child: ListView.builder(
        itemCount: 6,
        scrollDirection: Axis.horizontal,
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsets.only(
                right: lang.lang == 'en' ? 10 : 0,
                left: lang.lang == 'ar' ? 10 : 0,
              ),
              child: GestureDetector(
                onLongPress: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => GroupMemberInfo(lang: lang),
                  );
                },
                child: SizedBox(
                  height: height * 130 / 890,
                  width: 65,
                  child: Column(
                    children: [
                      CircleAvatar(
                        backgroundColor: Constants.primaryColor,
                        radius: 65 / 2,
                        backgroundImage: AssetImage(
                          Assets.imagesProfileImage,
                        ),
                      ),
                      SizedBox(height: 5),
                      SizedBox(
                        height: height * 130 / 890 - 95,
                        width: 65,
                        child: Text(
                          'Hasan Shaaban',
                          textAlign: TextAlign.center,
                          style: AppTextStyle.cairoRegular14
                              .copyWith(
                                height: 0.9,
                                overflow: TextOverflow.fade,
                                color: Constants.primaryColor,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

