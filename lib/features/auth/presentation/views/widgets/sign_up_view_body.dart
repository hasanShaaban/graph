import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_email_password_section.dart';

class SignUpViewBody extends StatelessWidget {
  const SignUpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(child: SignupEmailPasswordSection());
  }
}
