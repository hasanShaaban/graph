import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import '../../../data/models/signup_data_model.dart';

import '../../../../../generated/l10n.dart';
import 'auth_button.dart';
import 'signup_text_form_fields.dart';
import 'signup_username_section.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'auth_redirect_text.dart';
import 'remeber_me_section.dart';
import '../login_view.dart';

// ignore: must_be_immutable
class SignupEmailPasswordSection extends StatefulWidget {
  const SignupEmailPasswordSection({super.key});

  @override
  State<SignupEmailPasswordSection> createState() =>
      _SignupEmailPasswordSectionState();
}

class _SignupEmailPasswordSectionState
    extends State<SignupEmailPasswordSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;


  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! SignupDataModel) {

      signupData = SignupDataModel(
        email: '',
        password: '',
        confirmPassword: '',
      );
     
    } else {
      signupData = args;
    }
  }

  String email = '';
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
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
              SignupTextFormFields(
                onEmailSaved: (value) => email = value!.trim(),
                onPasswordSaved: (String? newValue) {
                  print('pass saved: $newValue');
                  password = newValue!.trim();
                },
                onConfirmPasswordSaved: (String? newValue) {
                  print('confirmPass saved: $newValue');
                  confirmPassword = newValue!.trim();
                },

                ),
              const SizedBox(height: 29),
              const RemeberMeSection(),
              const SizedBox(height: 24),

              AuthButton(
                title: lang.signUp,

                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();
                    print(
                      'Email: $email, Password: $password, Confirm: $confirmPassword',
                    );
                    final signupData = SignupDataModel(
                      email: email,
                      password: password,
                      confirmPassword: confirmPassword,
                    );
                    Navigator.pushNamed(
                      context,
                      SignupUsernameSection.name,
                      arguments: signupData,
                    );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
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
      ),
    );
  }
}
