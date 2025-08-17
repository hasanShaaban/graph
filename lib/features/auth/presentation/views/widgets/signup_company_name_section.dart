import 'package:flutter/material.dart';
import '../../../data/models/signup_data_model.dart';
import 'auth_app_bar.dart';
import 'custom_text.dart';
import 'next_button.dart';
import 'signup_company_picture_sec.dart';
import 'user_name_text_field.dart';
import '../../../../../generated/l10n.dart';

class SignupCompanyNameSection extends StatefulWidget {
  const SignupCompanyNameSection({super.key});
  static const name = 'companyName';
  @override
  State<SignupCompanyNameSection> createState() =>
      _SignupCompanyNameSectionState();
}

class _SignupCompanyNameSectionState extends State<SignupCompanyNameSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String companyName = '';

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                AuthAppBar(
                  text1: lang.whoIsJoining,
                  text2: lang.getToKnowYou,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const SizedBox(height: 20),
                CustomText(text: lang.whatToCallYou),
                const SizedBox(height: 10),
                UserNameTextField(
                  width: MediaQuery.sizeOf(context).width / 2 - 25,
                  text: lang.companyName,
                  onSaved: (value) => companyName = value!,
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 40),
          child: NextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
SignupDataModel signupData = SignupDataModel(firstName: companyName);

                Navigator.pushNamed(
                  context,
                  SignupCompanyPictureSec.name,
                  arguments: signupData,
                );
              } else {
                setState(() {
                  autovalidateMode = AutovalidateMode.always;
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
