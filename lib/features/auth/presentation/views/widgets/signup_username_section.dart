import 'package:flutter/material.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import 'user_name_body.dart';
import '../sign_up_view.dart';
import 'custom_app_bar.dart';
import 'next_button.dart';
import 'signup_birthday_gender.dart';

// ignore: must_be_immutable
class SignupUsernameSection extends StatelessWidget {
  const SignupUsernameSection({super.key});
  static const name = 'UserNameSec';

  @override
  Widget build(BuildContext context) {
    final firstNameController = TextEditingController();
    final lastNameController = TextEditingController();
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: lang.whoIsJoining,
          //text2: "Let's Get To Know You",
          text2: lang.getToKnowYou,
          onPressed: () {
            Navigator.popAndPushNamed(context, SignUpView.name);
          },
        ),
        body: UserNameBody(
          firstNameController: firstNameController,
          lastNameController: lastNameController,
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
      
              final userInfo = Provider.of<UserInfoProvider>(
                context,
                listen: false,
              );
              userInfo.setFirstName(newFirstName: firstNameController.text);
              userInfo.setLasttName(newLastName: lastNameController.text);
              Navigator.pushNamed(
                context,
                SignupBirthdayGender.name,
              
              );
            },
          ),
        ),
      ),
    );
  }
}
