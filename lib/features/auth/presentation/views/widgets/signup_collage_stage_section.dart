import 'package:flutter/material.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import 'custom_app_bar.dart';
import 'next_button.dart';
import 'signup_path_section.dart';
import 'signup_profile_picture_section.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'custom_dropdown_button.dart';
import 'custom_text.dart';

import 'spacialization_section.dart';

class SignupCollageStageSection extends StatelessWidget {
  SignupCollageStageSection({super.key});
  static const name = 'collageStage';
  final List<String>? studyYear = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
  ];

  @override
  Widget build(BuildContext context) {

    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: lang.almostThere,
          text2: lang.fewDetails,
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupPathSection.name);
          },
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Consumer<UserInfoProvider>(
              builder: (context, userProvider, _) {
                final selectVal = userProvider.studyYear;
                return Column(
                  children: [
                    customText(text: lang.collageStage),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        lang.customizeFeatures,
                        style: AppTextStyle.cairoRegular14.copyWith(
                          color: Constants.darkSecondryColor,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Material(
                      child: customDropDownButton(
                        list: studyYear,
                        text:
                            selectVal == null
                                ? lang.selectYear
                                : "$selectVal year",
                        onChanged: (value) {
                          userProvider.setStudyYear(newStudyYear: value);
                        },
                        width: 300,
                        height: 55,
                        border: 15,
                        iconPadding: 70,
                      ),
                    ),

                    (selectVal == studyYear![3] || selectVal == studyYear![4])
                        ? SpacializationSection()
                        : Padding(
                          padding: const EdgeInsets.only(top: 280),
                          child: NextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                context,
                                SignupProfilePictureSection.name,
                              );
                            },
                          ),
                        ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
