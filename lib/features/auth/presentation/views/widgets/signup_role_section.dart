import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'next_button.dart';
import 'signup_path_section.dart';
import 'signup_profile_picture_section.dart';
import 'custom_dropdown_button.dart';
import 'custom_text.dart';

class SignupRoleSection extends StatefulWidget {
  const SignupRoleSection({super.key});
  static const name = 'roleSec';

  @override
  State<SignupRoleSection> createState() => _SignupRoleSectionState();
}

class _SignupRoleSectionState extends State<SignupRoleSection> {
  String? selectedValue;

  final List<String> role = ['teacher', 'doctor', 'commercial account', 'normal user account'];
  @override
  Widget build(BuildContext context) {
    return
    SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: 'Almost there.',
          text2: 'just a few details!',
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupPathSection.name);
          },
        ),
        body:
    Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          customText(text: "Let's specify your role"),
          SizedBox(height: 34),

          Material(
            child: customDropDownButton(
              list: role,
              text: selectedValue == null ? 'Select your role' : selectedValue!,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          ),
        ],
      ),
    ),
    bottomNavigationBar: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
      child: NextButton(
        onPressed: () {
          Navigator.pushNamed(context, SignupProfilePictureSection.name);
        },
      ),
    ),
      ),
    );
  }
}
