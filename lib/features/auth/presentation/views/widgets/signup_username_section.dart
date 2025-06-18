import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/auth_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/user_name_text_field.dart';
import '../../../../../generated/l10n.dart';
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

  late String firstName, lastName;

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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
    var lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Form(
            autovalidateMode: autovalidateMode,
            key: formKey,
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
                SizedBox(height: 20),
                CustomText(text: lang.whatToCallYou),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    UserNameTextField(
                      width: MediaQuery.sizeOf(context).width / 2 - 22,
                      text: lang.firstName,
                      controller: firstNameController,
                      onSaved: (value) {
                        firstName = value!;
                      },
                    ),
                    SizedBox(width: 3),
                    UserNameTextField(
                      width: MediaQuery.sizeOf(context).width / 2 - 22,
                      text: lang.lastName,
                      controller: lastNameController,
                      onSaved: (value) {
                        lastName = value!;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 400 / 890,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: NextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        Navigator.pushNamed(
                          context,
                          SignupBirthdayGender.name,
                          arguments: {
                            'firstName': firstName,
                            'lastName': lastName,
                          },
                        );
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
