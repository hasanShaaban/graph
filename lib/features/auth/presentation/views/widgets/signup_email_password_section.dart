import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/auth_redirect_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:graph/features/auth/presentation/views/widgets/remeber_me_section.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_username_section.dart';
import '../login_view.dart';

class SignupEmailPasswordSection extends StatelessWidget {
  const SignupEmailPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
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
            SizedBox(height: 40),
            Text(
              'create new account',
              style: AppTextStyle.cairoBold60.copyWith(height: 1.2),
            ),
            SizedBox(height: 60),
            CustomTextField(
              hintText: 'Email',

              prefixIcon: Assets.iconsEnvelope,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 25),
            CustomTextField(
              hintText: 'Password',
              prefixIcon: Assets.iconsPassword,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 25),
            CustomTextField(
              hintText: 'Confirm password',
              prefixIcon: Assets.iconsPassword,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 29),
            RemeberMeSection(),
            SizedBox(height: 24),
            AuthButton(
              title: 'Sign Up',
              onPressed: () {
                Navigator.pushReplacementNamed(context, SignupUsernameSection.name);
              },
            ),
            SizedBox(height: 25),
            AuthRedirectText(
              staitcText: 'Already have an account? ',
              redirectorText: 'Login!',
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
