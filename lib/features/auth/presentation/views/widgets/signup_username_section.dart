

import 'package:flutter/material.dart';
import '../../../data/models/signup_data_model.dart';
import 'package:provider/provider.dart';
import 'auth_app_bar.dart';
import 'custom_text.dart';
import 'user_name_text_field.dart';
import '../../../../../core/services/providers/user_info_provider.dart';
import '../../../../../generated/l10n.dart';
import 'next_button.dart';
import 'signup_birthday_gender.dart';

class SignupUsernameSection extends StatefulWidget {
  const SignupUsernameSection({super.key});
  static const name = 'UserNameSec';

  @override
  State<SignupUsernameSection> createState() => _SignupUsernameSectionState();
}

class _SignupUsernameSectionState extends State<SignupUsernameSection> {


  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;


  String firstName = '';
  String lastName = '';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final oldData =
        ModalRoute.of(context)!.settings.arguments as SignupDataModel;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserNameTextField(
                      width: MediaQuery.sizeOf(context).width / 2 - 25,
                      text: lang.firstName,
                      onSaved: (value) => firstName = value!,
                      
                    ),
                    const SizedBox(width: 6),
                    UserNameTextField(
                      width: MediaQuery.sizeOf(context).width / 2 - 25,
                      text: lang.lastName,
                      onSaved: (value) => lastName = value!,
    
                    ),
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),
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
                final updated = oldData.copyWith(
                  firstName: firstName,
                  lastName: lastName,
                );
             
                Navigator.pushNamed(
                  context,
                  SignupBirthdayGender.name,
                  arguments: updated,
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
