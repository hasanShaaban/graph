import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import 'custom_text_field.dart';

class SignupTextFormFields extends StatefulWidget {
  // final TextEditingController emailController;
  // final TextEditingController passwordController;
  // final TextEditingController confirmPasswordController;

  final FormFieldSetter<String> onEmailSaved;
  final FormFieldSetter<String> onPasswordSaved;
  final FormFieldSetter<String> onConfirmPasswordSaved;

  SignupTextFormFields({
    super.key,
    required this.onEmailSaved,
    required this.onPasswordSaved,
    required this.onConfirmPasswordSaved,
  });

  @override
  State<SignupTextFormFields> createState() => _SignupTextFormFieldsState();
}

String? password;

class _SignupTextFormFieldsState extends State<SignupTextFormFields> {
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Column(
      children: [
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return lang.thisFieldRequired;
            } else if (!value.contains('@')) {
              return 'The email field must be a valid email address, with @ .';
            }
            return null;
          },

          hintText: lang.email,
          prefixIcon: Assets.iconsEnvelope,
          textInputType: TextInputType.emailAddress,
          onSaved: widget.onEmailSaved,
        ),
        const SizedBox(height: 25),
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return lang.thisFieldRequired;
            } else if (value.length < 6) {
              return 'The password must be at least 6 characters.';
            }
            return null;
          },
          hintText: lang.password,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
          onSaved: widget.onPasswordSaved,
          onChanged: (val) {
            setState(() {
              password = val;
            });
          },
        ),
        const SizedBox(height: 25),
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return lang.thisFieldRequired;
            } else if (value != password) {
              return 'this field must be equal to password';
            }
            return null;
          },
          hintText: lang.confirmPassword,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
          onSaved: widget.onConfirmPasswordSaved,
        ),
      ],
    );
  }
}
