import 'package:flutter/material.dart';
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

class SignupCollageStageSection extends StatefulWidget {
  const SignupCollageStageSection({super.key});
  static const name = 'collageStage';
  @override
  State<SignupCollageStageSection> createState() =>
      _SignupCollageStageSectionState();
}

class _SignupCollageStageSectionState extends State<SignupCollageStageSection> {
  String? selectVal;
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
            child: Column(
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
                            : "${selectVal!} year",
                    onChanged: (value) {
                      setState(() {
                        selectVal = value;
                      });
                    }, width: 300, height: 55, border: 15, iconPadding: 70,
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
            ),
          ),
        ),
      ),
    );
  }
}
