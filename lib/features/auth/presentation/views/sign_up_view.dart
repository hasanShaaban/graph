import 'package:flutter/material.dart';

import 'widgets/sign_up_view_body.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const name = 'SignupView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SignUpViewBody()));
  }
}
