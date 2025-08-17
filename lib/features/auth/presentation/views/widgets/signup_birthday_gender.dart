import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_collage_stage_section.dart';
import '../../../data/models/signup_data_model.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';
import 'birthday_gender_body.dart';
import 'next_button.dart';

class SignupBirthdayGender extends StatefulWidget {
  const SignupBirthdayGender({super.key});
  static const name = 'birthday&genderSec';

  @override
  State<SignupBirthdayGender> createState() => _SignupBirthdayGenderState();
}

class _SignupBirthdayGenderState extends State<SignupBirthdayGender> {
  late SignupDataModel signupData;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

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
        resizeToAvoidBottomInset: true,

        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            autovalidateMode: autovalidateMode,
            child: Column(
              children: [
                AuthAppBar(
                  text1: '${lang.welcome} ${signupData.firstName}',
                  text2: lang.tellAboutYourself,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BirthdayGenderBody(
                  onBirthDateSaved: (String? newValue) {
                    setState(() {
                      signupData = signupData.copyWith(
                        birthDate: newValue!.trim(),
                      );
                    });
                  },
                  onGenderSaved: (String? newValue) {
                    setState(() {
                      signupData = signupData.copyWith(
                        gender: newValue!.trim(),
                      );
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: NextButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();

                Navigator.pushNamed(
                  context,
                  SignupCollageStageSection.name,
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
