import 'package:flutter/material.dart';
import 'package:graph/generated/l10n.dart';
import 'birthday_gender_body.dart';
import 'next_button.dart';
import 'signup_path_section.dart';
import 'custom_app_bar.dart';
import 'signup_username_section.dart';

class SignupBirthdayGender extends StatefulWidget {
  const SignupBirthdayGender({
    super.key,
    required this.firstName,
    required this.lastName,
  });
  static const name = 'birthday&genderSec';

  final String firstName;
  final String lastName;

  @override
  State<SignupBirthdayGender> createState() => _SignupBirthdayGenderState();
}

class _SignupBirthdayGenderState extends State<SignupBirthdayGender> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupUsernameSection.name);
          },
          text1: '${lang.welcome}${widget.firstName}',

          text2: lang.tellAboutYourself,
        ),
        body: BirthdayGenderBody(),
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
