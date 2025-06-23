
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/presentation/views/widgets/alert_dialog_action_button.dart';
import 'package:graph/features/profile/presentation/views/widgets/tech_tools_list_view.dart';
import 'package:graph/generated/l10n.dart';

class GroupMemberInfo extends StatelessWidget {
  const GroupMemberInfo({super.key, required this.lang});

  final S lang;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Constants.lightPrimaryColor,
      contentPadding: EdgeInsets.all(8),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                Assets.iconsInfo,
                width: 20,
                color: Constants.darkPrimaryColor,
              ),
              SizedBox(width: 5),
              Text(
                lang.info,
                style: AppTextStyle.cairoSemiBold16.copyWith(
                  color: Constants.darkPrimaryColor,
                ),
              ),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.close),
              ),
            ],
          ),
          Divider(color: Constants.deviderColor),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Assets.imagesProfileImage),
              ),
              SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hasan shaaban',
                    style: AppTextStyle.cairoRegular16.copyWith(
                      color: Constants.darkPrimaryColor,
                      height: 1.3,
                    ),
                  ),
                  Text(
                    '4th year \n${lang.softwareEng}',
                    style: AppTextStyle.cairoRegular14.copyWith(
                      color: Constants.primaryColor,
                      height: 1.1,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10),
          TechToolsListView(
            lang: lang,
            width: MediaQuery.of(context).size.width,
            iconSize: 40,
            listPadding: 10,
            borderRadius: 10,
          ),
          SizedBox(height: 10),
          Row(
            children: [
              AlertDialogActionButton(
                lang: lang,
                icon: Assets.iconsProfile,
                text: lang.viewProfile,
                color: Constants.lightSecondryColor,
                iconColor: Constants.primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: lang.lang == 'en' ? Radius.circular(10) : Radius.zero,
                  bottomLeft: lang.lang == 'en' ? Radius.circular(10) : Radius.zero,
                  topRight: lang.lang == 'ar' ? Radius.circular(10) : Radius.zero,
                  bottomRight: lang.lang == 'ar' ? Radius.circular(10) : Radius.zero,
                ),
              ),
              AlertDialogActionButton(
                borderRadius: BorderRadius.zero,
                lang: lang,
                icon: Assets.iconsMessages,
                text: lang.message,
                color: Constants.lightSecondryColor,
                iconColor: Constants.primaryColor,
              ),
              AlertDialogActionButton(
                borderRadius: BorderRadius.only(
                  topLeft: lang.lang == 'en' ? Radius.zero : Radius.circular(10),
                  bottomLeft: lang.lang == 'en' ? Radius.zero : Radius.circular(10),
                  topRight: lang.lang == 'ar' ? Radius.zero : Radius.circular(10),
                  bottomRight: lang.lang == 'ar' ? Radius.zero : Radius.circular(10),),
                lang: lang,
                icon: Assets.iconsAdd,
                text: lang.follow,
                color: Constants.primaryColor,
                iconColor: Constants.lightSecondryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }
}


