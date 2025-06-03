import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import 'next_button.dart';
import 'signup_collage_stage_section.dart';
import 'signup_role_section.dart';
import 'custom_app_bar.dart';
import 'custom_text.dart';

import 'signup_birthday_gender.dart';

import 'student_or_not_button.dart';

class SignupPathSection extends StatefulWidget {
  const SignupPathSection({
    super.key,
    required Null Function(bool isStrudent) onNext,
  });
  static const name = 'pathSection';

  @override
  State<SignupPathSection> createState() => _SignupPathSectionState();
}

class _SignupPathSectionState extends State<SignupPathSection> {
  bool selectStudent = false;
  bool selectNonStudent = false;

  void onSelectStudent() {
    setState(() {
      selectStudent = true;
      selectNonStudent = false;
    });
  }

  void onSelectNotStudent() {
    setState(() {
      selectStudent = false;
      selectNonStudent = true;
    });
  }

  void goToStudentPage() {
    Navigator.pushNamed(context, SignupCollageStageSection.name);
  }

  void goToNotStudentPage() {
    Navigator.pushNamed(context, SignupRoleSection.name);
  }

  void handleNext() {
    if (selectStudent) {
      goToStudentPage();
    } else if (selectNonStudent) {
      goToNotStudentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupBirthdayGender.name);
          },
          text1: lang.howUsingApp,
          text2: '',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                customText(text: lang.whichPath),
                SizedBox(height: 16),
                StudentOrNotButton(
                  selectStudent: selectStudent,
                  selectNonStudent: selectNonStudent,
                  onSelectStudent: onSelectStudent,
                  onSelectNotStudent: onSelectNotStudent,
                ),
                SizedBox(height: 300),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            (selectStudent || selectNonStudent)
                ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: NextButton(onPressed: handleNext),
                )
                : null,
      ),
    );
  }
}
