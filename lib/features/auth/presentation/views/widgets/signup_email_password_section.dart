import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:graph/features/auth/data/models/user_model.dart';
import 'package:graph/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import 'auth_button.dart';
import 'signup_text_form_fields.dart';
import 'signup_username_section.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'auth_redirect_text.dart';
import 'remeber_me_section.dart';
import '../login_view.dart';

class SignupEmailPasswordSection extends StatelessWidget {
  const SignupEmailPasswordSection({super.key});

  @override
  Widget build(BuildContext context) {
    final emilController = TextEditingController();
    final passwordContrller = TextEditingController();
    final confirmPasswordController = TextEditingController();
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, LoginView.name);
              },
              icon: SvgPicture.asset(Assets.iconsArrowLeft),
            ),
            const SizedBox(height: 40),
            Text(
              lang.createNewAccount,
              style: AppTextStyle.cairoBold55.copyWith(height: 1.2),
            ),
            const SizedBox(height: 60),
            SignupTextFormFields(
              emailController: emilController,
              passwordController: passwordContrller,
              confirmPasswordController: confirmPasswordController,
            ),
            const SizedBox(height: 29),
            const RemeberMeSection(),
            const SizedBox(height: 24),

            BlocConsumer<SignupCubit, SignupState>(
              listener: (context, state) {
                if (state is SignupSuccess) {
                  Navigator.pushNamed(context, SignupUsernameSection.name);
                  print('Signup success, navigating...');
                } else if (state is SignupFailuer) {
                  print('Signup failed with error: ${state.errorMessage}');
                  ScaffoldMessenger.of(
                    context,
                  ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                }
              },
              builder: (context, state) {
                if (state is SignupLoading) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return AuthButton(
                    title: lang.signUp,

                    onPressed: () {
                      final userProvider = Provider.of<UserInfoProvider>(
                        context,
                        listen: false,
                      );
                      userProvider.setEmail(newEmail: emilController.text);
                      userProvider.setPassword(
                        newPassword: passwordContrller.text,
                      );
                      userProvider.setConfirmPassword(
                        newConfirmPassword: confirmPasswordController.text,
                      );

                      context.read<SignupCubit>().signup(
                        userModel: UserModel(
                          firstName: '',
                          lastName: '',
                          email: emilController.text,
                          passWord: passwordContrller.text,
                          confirmPassword: confirmPasswordController.text,
                          dateOfBirht: '',
                          gender: '',
                          studyYear: 0,
                          spacialization: 0,
                       //   image: '',
                        ),
                      );

                      // Navigator.pushNamed(context, SignupUsernameSection.name);
                    },
                  );
                }
              },
            ),
            const SizedBox(height: 25),
            AuthRedirectText(
              staitcText: lang.alreadyHaveAccount,
              redirectorText: lang.login,
              onTap: () {
                Navigator.popAndPushNamed(context, LoginView.name);
              },
            ),
          ],
        ),
      ),
    );
  }
}
