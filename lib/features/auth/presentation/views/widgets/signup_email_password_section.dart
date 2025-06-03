import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../generated/l10n.dart';
import 'auth_button.dart';
import 'signup_text_form_fields.dart';
import 'signup_username_section.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'auth_redirect_text.dart';
import 'remeber_me_section.dart';
import '../login_view.dart';

class SignupEmailPasswordSection extends StatelessWidget {
  const SignupEmailPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, LoginView.name);
              },
              icon: SvgPicture.asset(Assets.iconsArrowLeft),
            ),
            const SizedBox(height: 40),
            Text(
              lang.createNewAccount,
              style: AppTextStyle.cairoBold55.copyWith(height: 1.2),
            ),
            const SizedBox(height: 60),
            SignupTextFormFields(),
            const SizedBox(height: 29),
            const RemeberMeSection(),
            const SizedBox(height: 24),
            AuthButton(
              title: lang.signUp,
              onPressed: () {
                Navigator.pushNamed(context, SignupUsernameSection.name);
              },
            ),
            const SizedBox(height: 25),
            AuthRedirectText(
              staitcText: lang.alreadyHaveAccount,
              redirectorText: lang.login,
              onTap: () {
                Navigator.popAndPushNamed(context, LoginView.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
