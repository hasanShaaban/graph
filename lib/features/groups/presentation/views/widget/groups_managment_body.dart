import 'package:flutter/material.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../groups_management_view.dart';
import 'group_management_drop_down.dart';
import 'save_addmember_button.dart';
import 'vacancy_button.dart';

class GroupsManagementBody extends StatelessWidget {
  const GroupsManagementBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GroupManagementDropDown(),
            SizedBox(height: 17),
            GroupsManagementContainer(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  SaveAddmemberButton(
                    text: 'add member',
                    icon: Assets.iconsUserAdd,
                  ),
                  SizedBox(width: 8),
                  SaveAddmemberButton(text: 'save', icon: Assets.iconsBookmark),
                ],
              ),
            ),

            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Text(
                'if your group is not completed,\n you can advertise a vacancy',
                style: AppTextStyle.cairoRegular14,
              ),
            ),
            VacancyButton(),
          ],
        ),
      ),
    );
  }
}