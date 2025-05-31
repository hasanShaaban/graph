import 'package:flutter/material.dart';
import 'package:graph/generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import 'custom_text_field.dart';

class SignupTextFormFields extends StatelessWidget {
  const SignupTextFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Column(
      children: [
        CustomTextField(
          hintText: lang.email,
          prefixIcon: Assets.iconsEnvelope,
          textInputType: TextInputType.emailAddress,
        ),
        const SizedBox(height: 25),
        CustomTextField(
          hintText: lang.password,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
        ),
        const SizedBox(height: 25),
        CustomTextField(
          hintText: lang.confirmPassword,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
        ),
      ],
    );
  }
}
