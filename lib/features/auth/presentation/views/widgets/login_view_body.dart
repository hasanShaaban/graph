import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

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
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            SizedBox(height: 100),
            Text(
              lang.loginTitle,
              style: AppTextStyle.cairoBold55.copyWith(height: 1.2),
            ),
            SizedBox(height: 60),
            CustomTextField(
              hintText: lang.email,
              prefixIcon: Assets.iconsEnvelope,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            CustomPasswordField(),
            SizedBox(height: 25),
            RemeberMeSection(),
            SizedBox(height: 20),
            AuthButton(title: lang.login, onPressed: () {}),
            SizedBox(height: 25),
            AuthRedirectText(
              staitcText: lang.dontHaveAccount,
              redirectorText: lang.createOne,
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
