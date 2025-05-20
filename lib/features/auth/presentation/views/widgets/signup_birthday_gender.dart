import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_text.dart';
import 'gender_button.dart';
import 'next_button.dart';
import 'signup_path_section.dart';
import 'signup_username_section.dart';
import 'user_name_text_field.dart';

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
  
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: CustomAppBar(
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupUsernameSection.name);
          },
          text1: 'Welcome ${widget.firstName}',
          text2: 'Tell Us About Yourself',
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                customText(text: "When's your birthday?"),
                SizedBox(height: 16),
                userNameTextField(
                  text: 'yyyy-mm-dd',
                  width: double.infinity,
                  textInputType: TextInputType.datetime,
                ),
                SizedBox(height: 22),
                customText(text: 'Pick your gender:'),
                GenderButton(
                
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                SignupPathSection.name,
           
              );
            },
          ),
        ),
      ),
    );
  }
}
