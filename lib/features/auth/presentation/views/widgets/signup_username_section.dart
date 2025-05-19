import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/next_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/user_name_text_field.dart';

class SignupUsernameSection extends StatelessWidget {
  const SignupUsernameSection({super.key});
  static const name = 'UserNameSec';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: "Who's Joining Us?",
          text2: "Let's Get To Know You",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              customText(text: 'What should we call you?'),
              SizedBox(height: 16),
              Row(
                children: [
                  userNameTextField(text: 'First name'),
                  SizedBox(width: 3),
                  userNameTextField(text: 'Last name'),
                ],
              ),
              Spacer(),
              NextButton(title: 'Next', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
