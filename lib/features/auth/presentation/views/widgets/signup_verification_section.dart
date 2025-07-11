import 'dart:math';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/signup_data_model.dart';
import 'four_digits_container.dart';
import '../../../../../generated/l10n.dart';

class SignupVerificationSection extends StatefulWidget {
  const SignupVerificationSection({super.key});
  static const name = 'verificationPage';
  @override
  State<SignupVerificationSection> createState() =>
      _SignupVerificationSectionState();
}

class _SignupVerificationSectionState extends State<SignupVerificationSection> {
  SignupDataModel? signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final args = ModalRoute.of(context)?.settings.arguments;
    if (args != null && args is SignupDataModel) {
      signupData = args;
    } else {
      // 👉 فقط وقت التطوير بنعبيها ببيانات وهمية
      assert(() {
        print("⚠️ No arguments passed, using fake data for design preview");
        signupData = SignupDataModel(
          email: 'dev@example.com',
          firstName: 'John',
          lastName: 'Doe',
          gender: 'Male',
          birthDate: '2000-01-01',
          password: '123456',
          confirmPassword: '123456',
          studyYear: '3',
        );
        return true;
      }());
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    if (signupData == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: GestureDetector(
                    // onTap: () {
                    //   Navigator.popAndPushNamed();
                    // },
                    child: SvgPicture.asset(Assets.iconsArrowLeft),
                  ),
                ),
                SizedBox(height: 40),
                Text(
                  lang.fourDigitsCode,

                  style: AppTextStyle.cairoBold34.copyWith(height: 1),
                ),

                Text(
                  signupData!.email,
                  style: AppTextStyle.cairoRegular18.copyWith(
                    color: Constants.secondryColor,
                  ),
                ),
                SizedBox(height: 50),
                Text(
                  'check your email inbox and inter the code :',
                  style: AppTextStyle.cairoRegular18.copyWith(
                    color: Constants.primaryColor,
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FourDigitsContainer(),
                    FourDigitsContainer(),

                    FourDigitsContainer(),

                    FourDigitsContainer(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
