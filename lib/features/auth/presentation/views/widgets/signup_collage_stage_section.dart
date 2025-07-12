import 'package:flutter/material.dart';
import '../../../data/models/signup_data_model.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';

import 'next_button.dart';

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
  final List<String>? studyYear = [
    'first',
    'second',
    'third',
    'fourth',
    'fifth',
  ];

  String? selectVal;
  int? selectedYearId;
  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signupData = ModalRoute.of(context)!.settings.arguments as SignupDataModel;
  }

  @override
  Widget build(BuildContext context) {
    final updatedSignupData = signupData.copyWith(
      studyYear: selectedYearId?.toString(),
    );
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthAppBar(
                text1: lang.almostThere,
                text2: lang.fewDetails,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText(text: lang.collageStage),
                    Align(
                      alignment: Alignment.center,
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
                          setState(() {
                            selectVal = value;
                            selectedYearId = studyYear!.indexOf(value) + 1;
                          });
                        },
                        width: 300,
                        height: 55,
                        border: 15,
                        iconPadding: 70,
                      ),
                    ),

                    (selectVal == studyYear![3] || selectVal == studyYear![4])
                        ? SpacializationSection(
                          signupData: signupData.copyWith(
                            studyYear: selectedYearId?.toString(),
                          ),
                        )
                        : Padding(
                          padding: const EdgeInsets.only(top: 280),
                          child: NextButton(
                            onPressed: () {
                              if (selectVal == null || selectVal!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(lang.selectYear)),
                                );
                              } else {
                                Navigator.pushReplacementNamed(
                                  context,
                                  SignupProfilePictureSection.name,
                                  arguments: signupData.copyWith(
                                    studyYear: selectedYearId?.toString(),
                                  ),
                                );
                              }
                            },
                          ),
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
