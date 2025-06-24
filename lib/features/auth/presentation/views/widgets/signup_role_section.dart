import 'package:flutter/material.dart';
import '../../../../../core/services/providers/user_info_provider.dart';
import '../../../data/models/signup_data_model.dart';
import 'auth_app_bar.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';

import 'next_button.dart';
import 'signup_profile_picture_section.dart';
import 'custom_dropdown_button.dart';
import 'custom_text.dart';

class SignupRoleSection extends StatefulWidget {
  const SignupRoleSection({super.key});
  static const name = 'roleSec';

  @override
  State<SignupRoleSection> createState() => _SignupRoleSectionState();
}

class _SignupRoleSectionState extends State<SignupRoleSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> role = [
    'teacher',
    'doctor',
    'commercial account',
    'normal user account',
  ];
  String? selectedRole;
  int? roleId;
  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signupData = ModalRoute.of(context)!.settings.arguments as SignupDataModel;
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              AuthAppBar(
                text1: lang.almostThere,
                text2: lang.fewDetails,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText(text: lang.specifyRole),
                    SizedBox(height: 34),

                    Material(
                      child: customDropDownButton(
                        border: 15,
                        width: 300,
                        height: 55,
                        list: role,
                        text: selectedRole ?? lang.selectRole,
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                        },

                        iconPadding: 70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              if (selectedRole == null || selectedRole!.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.redAccent,
                    content: Text(lang.pleaseSelectRole),
                  ),
                );
              } else {
                signupData = signupData.copyWith(specialization: selectedRole!);

                Navigator.pushNamed(
                  context,
                  SignupProfilePictureSection.name,
                  arguments: signupData,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
