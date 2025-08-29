import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/auth/presentation/manager/verfiy_cubit/verification_cubit_cubit.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_final_touches_sec.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/models/signup_data_model.dart';
import 'four_digits_container.dart';

class SignupVerificationSection extends StatefulWidget {
  const SignupVerificationSection({super.key});
  static const name = 'verificationPage';
  @override
  State<SignupVerificationSection> createState() =>
      _SignupVerificationSectionState();
}

class _SignupVerificationSectionState extends State<SignupVerificationSection> {
  SignupDataModel? signupData;
  final List<TextEditingController> controllers = List.generate(
    6,
    (_) => TextEditingController(),
  );
  final List<FocusNode> focusNodes = List.generate(6, (_) => FocusNode());

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
          //  email: 'dev@example.com',
          firstName: 'John',
          lastName: 'Doe',
          gender: 'Male',
          birthDate: '2000-01-01',
          // password: '123456',
          // confirmPassword: '123456',
          studyYear: '3',
        );
        return true;
      }());
    }
  }

  void submitCode() {
    final code = controllers.map((c) => c.text).join();
    if (code.length == 6) {
      context.read<VerificationCubit>().verifyOtp(code);
      log(code);
    
    }
  }

  @override
  void dispose() {
    for (var c in controllers) {
      c.dispose();
    }
    for (var f in focusNodes) {
      f.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    if (signupData == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return SafeArea(
      child: Scaffold(
        body: BlocConsumer<VerificationCubit, VerificationCubitState>(
          listener: (context, state) {
            if (state is VerificationSuccess) {
              log('Verification success: ${state.response}');
              Navigator.pushNamed(context, SignupFinalTouchesSec.name);
            } else if (state is VerificationFailuer) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(22),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: SvgPicture.asset(Assets.iconsArrowLeft),
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      lang.fourDigitsCode,

                      style: AppTextStyle.cairoBold34.copyWith(height: 1),
                    ),

                    SizedBox(height: 50),
                    Text(
                      'check your email inbox and inter the code :',
                      style: AppTextStyle.cairoRegular18.copyWith(
                        color: Constants2.primaryColor(context),
                      ),
                    ),
                    SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: List.generate(
                        6,
                        (index) => FourDigitsContainer(
                          controller: controllers[index],
                          focusNode: focusNodes[index],
                          nextFocus: index < 5 ? focusNodes[index + 1] : null,

                          onChanged: submitCode,
                        ),
                      ),
                    ),
                    if (state is VerificationLoading)
                      const Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Center(child: CircularProgressIndicator()),
                      ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
