import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_dropdown_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/next_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_path_section.dart';



class SignupRoleSection extends StatefulWidget {
  const SignupRoleSection({super.key});
  static const name = 'roleSec';

  @override
  State<SignupRoleSection> createState() => _SignupRoleSectionState();
}

class _SignupRoleSectionState extends State<SignupRoleSection> {
  String? selectedValue;

  final List<String> roles = ['Flutter', 'Backend', 'Laravel'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: 'Almost there.',
          text2: 'just a few details!',
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupPathSection.name);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              customText(text: "Let's specify your role"),
              SizedBox(height: 34),

              customDropDownButton(
                list: role,
                text:
                    selectedValue == null ? 'Select your role' : selectedValue!,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              Navigator.pushNamed(context, SignupRoleSection.name);
            },
          ),
        ),
      ),
    );
  }
}
