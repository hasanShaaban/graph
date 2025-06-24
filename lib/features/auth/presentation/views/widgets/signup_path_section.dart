import 'package:flutter/material.dart';
import '../../../data/models/signup_data_model.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';
import 'next_button.dart';
import 'signup_collage_stage_section.dart';
import 'signup_role_section.dart';

import 'custom_text.dart';

import 'student_or_not_button.dart';

class SignupPathSection extends StatefulWidget {
  const SignupPathSection({
    super.key,

  });
  static const name = 'pathSection';

  @override
  State<SignupPathSection> createState() => _SignupPathSectionState();
}

class _SignupPathSectionState extends State<SignupPathSection> {
  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signupData = ModalRoute.of(context)!.settings.arguments as SignupDataModel;
  }

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
    Navigator.pushNamed(
      context,
      SignupCollageStageSection.name,
      arguments: signupData,
    );
  }

  void goToNotStudentPage() {
    Navigator.pushNamed(context, SignupRoleSection.name, arguments: signupData);
  }

  void handleNext() {
    if (selectStudent) {
      signupData = signupData.copyWith(isStudent: true);
      goToStudentPage();
    } else if (selectNonStudent) {
        signupData = signupData.copyWith(isStudent: false);
      goToNotStudentPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              AuthAppBar(
                text1: lang.howUsingApp,
                text2: '',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText(text: lang.whichPath),
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
            ],
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
