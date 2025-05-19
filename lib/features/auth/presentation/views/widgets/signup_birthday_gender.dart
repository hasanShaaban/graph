import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/gender_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/next_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_path_section.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_username_section.dart';
import 'package:graph/features/auth/presentation/views/widgets/user_name_text_field.dart';

class SignupBirthdayGender extends StatelessWidget {
  const SignupBirthdayGender({
    super.key,
    required this.firstName,
    required this.lastName,
  });
  static const name = 'birthday&genderSec';

  final String firstName;
  final String lastName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
           onPressed: () {
            Navigator.popAndPushNamed(context, SignupUsernameSection.name);
          },
          text1: 'Welcom $firstName',
          text2: 'Tell Us About Yourself',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                customText(text: "When's your birthday?"),
                userNameTextField(
                  text: 'yyyy-mm-dd',
                  width: double.infinity,
                  textInputType: TextInputType.datetime,
                ),
                SizedBox(height: 22),
                customText(text: 'Pick your gender:'),
                GenderButton(),
              ],
            ),
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
