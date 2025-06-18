import 'package:flutter/material.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import 'birthday_gender_body.dart';
import 'next_button.dart';
import 'signup_path_section.dart';
import 'custom_app_bar.dart';
import 'signup_username_section.dart';

class SignupBirthdayGender extends StatelessWidget {
  const SignupBirthdayGender({super.key});
  static const name = 'birthday&genderSec';

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserInfoProvider>(context, listen: false);
    String firstName = userInfo.firstName ?? '';
    final birthDateController = TextEditingController();
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupUsernameSection.name);
          },
          text1: '${lang.welcome} $firstName',

          text2: lang.tellAboutYourself,
        ),
        body: BirthdayGenderBody(birthDateController: birthDateController),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              final userProvider = Provider.of<UserInfoProvider>(
                context,
                listen: false,
              );
              userProvider.setDateOfBirth(
                newDateOfBirth: birthDateController.text,
              );
              Navigator.pushNamed(context, SignupPathSection.name);
            },
          ),
        ),
      ),
    );
  }
}
