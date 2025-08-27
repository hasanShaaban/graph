import 'package:flutter/material.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../core/widgets/custom_stateless_appbar.dart';
import '../../../../../core/widgets/major_and_year_dropdown_buttons_section.dart';
import '../../../../../generated/l10n.dart';
import 'group_management_custom_button.dart';
import 'group_memeber_container.dart';
import 'group_vacancy_section.dart';
import 'remove_button.dart';

class GroupManagementViewBody extends StatelessWidget {
  const GroupManagementViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: Column(
        children: [
          CustomStatelessAppbar(lang: lang, title: lang.groupsManagement),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                MajorAndYearDropdownButtonsSection(height: height),
                SizedBox(height: 15),
                GroupMemberContainer(lang: lang, width: width, height: height),
                SizedBox(height: 15),
                Row(
                  children: [
                    GroupManagementCutomButton(
                      height: height,
                      onPressed: () {},
                      title: lang.addMember,
                      icon: Assets.iconsUserAdd,
                    ),
                    SizedBox(width: 10),
                    GroupManagementCutomButton(
                      height: height,
                      onPressed: () {},
                      title: lang.Save,
                      icon: Assets.iconsBookmark,
                    ),
                    SizedBox(width: 10),
                    RemoveButton(width: width),
                  ],
                ),
                SizedBox(height: 10),
                Divider(thickness: 1, color: Constants2.dividerColor(context)),
                SizedBox(height: 10),
                GroupVacancySection(width: width, lang: lang),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
