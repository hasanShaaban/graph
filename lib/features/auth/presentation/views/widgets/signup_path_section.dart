import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_text.dart';

import 'next_button.dart';
import 'signup_birthday_gender.dart';
import 'signup_role_section.dart';
import 'student_or_not_button.dart';

class SignupPathSection extends StatelessWidget {
  const SignupPathSection({super.key});
  static const name = 'pathSection';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupBirthdayGender.name);
          },
          text1: 'How will you be using the app?',
          text2: '',
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              customText(text: 'which path will you use?'),
              SizedBox(height: 16),
              StudentOrNotButton(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignupRoleSection.name);
            },
          ),
        ),
      ),
    );
  }
}
