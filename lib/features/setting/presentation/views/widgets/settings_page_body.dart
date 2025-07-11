
import 'package:flutter/widgets.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/setting/presentation/views/widgets/divide_line.dart';
import 'package:graph/features/setting/presentation/views/widgets/settings_row.dart';

class SettingsPageBody extends StatelessWidget {
  const SettingsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SettingsRow(text: 'Settings', icon: Assets.iconsArrowLeft),
          DividLine(text: 'management & privacy'),
          SettingsRow(
            text: 'Change name and password',
            icon: Assets.iconsDeleteUser,
          ),
          SettingsRow(text: 'Edit profile', icon: Assets.iconsUserGraduate),
          SettingsRow(text: 'Change email', icon: Assets.iconsUserGraduate),
          SettingsRow(text: 'Posts management', icon: Assets.iconsUserGraduate),
          DividLine(text: 'setting'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingsRow(text: 'Dark mode', icon: Assets.iconsUserGraduate),
              Container(
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: Constants.darkSecondryColor,
                    width: 3,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SettingsRow(
                text: 'Change language',
                icon: Assets.iconsUserGraduate,
              ),
              Text('Eng', style: AppTextStyle.cairoRegular16),
            ],
          ),
          SettingsRow(text: 'Log out', icon: Assets.iconsUserGraduate),
        ],
      ),
    );
  }
}
