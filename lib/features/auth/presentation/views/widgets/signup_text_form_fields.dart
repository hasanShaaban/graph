import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import 'custom_text_field.dart';

class SignupTextFormFields extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  
  const SignupTextFormFields({super.key, required this.emailController, required this.passwordController, required this.confirmPasswordController});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Column(
      children: [
        CustomTextField(
        controller: emailController,
          hintText: lang.email,
          prefixIcon: Assets.iconsEnvelope,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 25),
        CustomTextField(
          controller: passwordController,
          hintText: lang.password,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
        ),
        const SizedBox(height: 25),
        CustomTextField(
          controller: confirmPasswordController,
          hintText: lang.confirmPassword,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
