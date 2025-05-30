import 'package:flutter/material.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../sign_up_view.dart';
import 'auth_button.dart';
import 'auth_redirect_text.dart';
import 'custom_password_field.dart';
import 'custom_text_field.dart';
import 'remeber_me_section.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              'login to your account ',
              style: AppTextStyle.cairoBold60.copyWith(height: 1.2),
            ),
            SizedBox(height: 60),
            CustomTextField(
              hintText: 'Email',
              prefixIcon: Assets.iconsEnvelope,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            CustomPasswordField(),
            SizedBox(height: 25),
            RemeberMeSection(),
            SizedBox(height: 20),
            AuthButton(title: 'Login', onPressed: (){},),
            SizedBox(height: 25),
            AuthRedirectText(
              staitcText: 'Don\'t have an account?',
              redirectorText: ' create one!',
              onTap: () {
                 Navigator.pushReplacementNamed(context, SignUpView.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
