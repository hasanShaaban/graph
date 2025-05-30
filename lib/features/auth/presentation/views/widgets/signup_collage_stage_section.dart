import 'package:flutter/material.dart';
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
    return 
    SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: 'Almost there.',
          text2: 'just a few details',
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupPathSection.name);
          },
        ),
        body:
         SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                customText(
                  text: "Let's get requaiented with your collage stage.",
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'That will help us cutomize your feature later',
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
                            ? 'Select your study year'
                            : "${selectVal!} year",
                    onChanged: (value) {
                      setState(() {
                        selectVal = value;
                      });
                    },
                  ),
                ),

                (selectVal == studyYear![3] || selectVal == studyYear![4])?
SpacializationSection()
               
                     
                    
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
         ),)
        ),
     
    );
  }
}
