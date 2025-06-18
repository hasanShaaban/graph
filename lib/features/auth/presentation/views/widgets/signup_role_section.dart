import 'package:flutter/material.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import 'custom_app_bar.dart';
import 'next_button.dart';
import 'signup_path_section.dart';
import 'signup_profile_picture_section.dart';
import 'custom_dropdown_button.dart';
import 'custom_text.dart';

class SignupRoleSection extends StatelessWidget {
  SignupRoleSection({super.key});
  static const name = 'roleSec';

  final List<String> role = [
    'teacher',
    'doctor',
    'commercial account',
    'normal user account',
  ];

  @override
  Widget build(BuildContext context) {
  
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: lang.almostThere,
          text2: lang.fewDetails, 
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupPathSection.name);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomText(text: lang.specifyRole),
              SizedBox(height: 34),

              Consumer<UserInfoProvider>(
                builder: (context, userProvider, _) {
                  return Material(
                    child: customDropDownButton(
                      border: 15,
                      width: 300,
                      height: 55,
                      list: role,
                      text: userProvider.role ?? lang.selectRole,
                      onChanged: (value) {
                        if (value != null) {
                          userProvider.setRole(newRole: value);
                        }
                      },
                      iconPadding: 70,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignupProfilePictureSection.name);
            },
          ),
        ),
      ),
    );
  }
}
