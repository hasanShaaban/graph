import 'package:flutter/material.dart';
import 'user_name_body.dart';
import '../sign_up_view.dart';
import 'custom_app_bar.dart';
import 'next_button.dart';
import 'signup_birthday_gender.dart';

// ignore: must_be_immutable
class SignupUsernameSection extends StatefulWidget {
  const SignupUsernameSection({super.key});
  static const name = 'UserNameSec';

  @override
  State<SignupUsernameSection> createState() => _SignupUsernameSectionState();
}

class _SignupUsernameSectionState extends State<SignupUsernameSection> {
  late TextEditingController? firstNameController;
  late TextEditingController? lastNameController;
  @override
  void initState() {
    super.initState();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
  }

  @override
  void dispose() {
    firstNameController!.dispose();
    lastNameController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: "Who's Joining Us?",
          text2: "Let's Get To Know You",
          onPressed: () {
            Navigator.popAndPushNamed(context, SignUpView.name);
          },
        ),
        body: UserNameBody(
          firstNameController: firstNameController, lastNameController: lastNameController
          ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              final firstName = firstNameController!.text;
              final lastName = lastNameController!.text;
              Navigator.pushNamed(
                context,
                SignupBirthdayGender.name,
                arguments: {'firstName': firstName, 'lastName': lastName},
              );
            },
          ),
        ),
      ),
    );
  }
}
