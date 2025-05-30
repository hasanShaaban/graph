
import 'package:flutter/material.dart';
import '../../../../../core/utils/appAssets.dart';
import 'custom_text_field.dart';

class SignupTextFormFields extends StatelessWidget {
  const SignupTextFormFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomTextField(
           hintText: 'Email',
        
           prefixIcon: Assets.iconsEnvelope,
           textInputType: TextInputType.emailAddress,
         ),
         const SizedBox(height: 25),
        const CustomTextField(
           hintText: 'Password',
           prefixIcon: Assets.iconsPassword,
           textInputType: TextInputType.visiblePassword,
         ),
        const SizedBox(height: 25),
        const CustomTextField(
           hintText: 'Confirm password',
           prefixIcon: Assets.iconsPassword,
           textInputType: TextInputType.visiblePassword,
         ),
      ],
    );
  }
}
