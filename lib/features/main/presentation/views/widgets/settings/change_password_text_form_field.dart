import 'package:flutter/widgets.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_text_form_fields.dart';
import 'package:graph/generated/l10n.dart';

class ChangePasswordTextFormField extends StatefulWidget {
     final FormFieldSetter<String> onEmailSaved;
  final FormFieldSetter<String> onPasswordSaved;
  final FormFieldSetter<String> onConfirmPasswordSaved;
  const ChangePasswordTextFormField({super.key, required this.onEmailSaved, required this.onPasswordSaved, required this.onConfirmPasswordSaved});

  @override
  State<ChangePasswordTextFormField> createState() => _ChangePasswordTextFormFieldState();
}

class _ChangePasswordTextFormFieldState extends State<ChangePasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
   final lang = S.of(context);
    return Column(
      children: [
        CustomTextField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return lang.thisFieldRequired;
            } 
            return null;
          },

          hintText:  lang.oldPassowrd,
          prefixIcon:
       Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
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
          hintText:
           lang.confirmPassword,
          prefixIcon: Assets.iconsPassword,
          textInputType: TextInputType.visiblePassword,
          onSaved: widget.onConfirmPasswordSaved,
        ),
      ],
    );
  }
}