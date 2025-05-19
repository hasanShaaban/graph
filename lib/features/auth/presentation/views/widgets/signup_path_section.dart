import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/gender_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/next_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_birthday_gender.dart';
import 'package:graph/features/auth/presentation/views/widgets/student_or_not_button.dart';

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
              StudentOrNotButton(),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignupPathSection.name);
            },
          ),
        ),
      ),
    );
  }
}
