import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/group_post_widgets/group_post_header.dart';
import 'package:graph/core/widgets/posts/group_post_widgets/text_section.dart';
import 'package:graph/features/profile/presentation/views/widgets/group_member_info.dart';
import 'package:graph/generated/l10n.dart';

class GroupPost extends StatelessWidget {
  const GroupPost({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var lang = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GroupPostHeader(width: width, height: height, lang: lang),
        SizedBox(height: 10),
        TextSection(lang: lang),
        SizedBox(height: 10),
        SizedBox(
          height: height * 130 / 890 - 16,
          width: width,
          child: ListView.builder(
            itemCount: 6,
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
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
                        builder: (context) => GroupMemberInfo(lang: lang),
                      );
                    },
                    child: SizedBox(
                      height: height * 130 / 890,
                      width: 65,
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: Constants2.primaryColor(context),
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
                              style: AppTextStyle.cairoRegular14.copyWith(
                                height: 0.9,
                                overflow: TextOverflow.fade,
                                color: Constants2.primaryColor(context),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          ),
        ),
      ],
    );
  }
}
