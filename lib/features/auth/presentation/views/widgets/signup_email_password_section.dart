import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
import '../../../data/models/credintials_model.dart';
import '../../manager/credintials_cubit/credintials_cubit.dart';
import 'signup_role_section.dart';
import '../../../data/models/signup_data_model.dart';

import '../../../../../generated/l10n.dart';
import 'auth_button.dart';
import 'signup_text_form_fields.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import 'auth_redirect_text.dart';
import 'remeber_me_section.dart';
import '../login_view.dart';

// ignore: must_be_immutable
class SignupEmailPasswordSection extends StatefulWidget {
  const SignupEmailPasswordSection({super.key});

  @override
  State<SignupEmailPasswordSection> createState() =>
      _SignupEmailPasswordSectionState();
}

class _SignupEmailPasswordSectionState
    extends State<SignupEmailPasswordSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;
    if (args == null || args is! SignupDataModel) {
      signupData = SignupDataModel();
    } else {
      signupData = args;
    }
  }

  String email = '';
  String password = '';
  String confirmPassword = '';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        autovalidateMode: autovalidateMode,
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
                onEmailSaved: (value) => email = value!.trim(),
                onPasswordSaved: (String? newValue) {
                  log('pass saved: $newValue');
                  password = newValue!.trim();
                },
                onConfirmPasswordSaved: (String? newValue) {
                  log('confirmPass saved: $newValue');
                  confirmPassword = newValue!.trim();
                },
              ),
              const SizedBox(height: 29),
              RemeberMeSection(
   
                text: lang.rememberMe,
              ),
              const SizedBox(height: 24),

              BlocConsumer<CredintialsCubit, CredintialsState>(
                listener: (context, state) async {
                  if (state is CredintialsSuccess) {
                     final token = state.response['message']['token'];
                    // await HiveDataBaseService().addData(
                    //   boxName: 'authBox',
                    //   key: 'token',
                    //   value: token,
                    // );
                    await getIt<AuthLocalDataSource>().setToken(token);

                    Navigator.pushNamed(context, SignupRoleSection.name);
                  } else if (state is CredintialsFailuer) {
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
                  }
                },
                builder: (context, state) {
                  return AuthButton(
                    title: lang.signUp,
                    isLoading: state is CredintialsLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        log(
                          'Email: $email, Password: $password, Confirm: $confirmPassword',
                        );
                        final credintials = CredintialsModel(
                          email: email,
                          passWord: password,
                          confirmPassword: confirmPassword,
                        );
                        final cubit = context.read<CredintialsCubit>();

                        cubit.credintials(credintialsModel: credintials);
                      } else {
                        setState(() {
                          autovalidateMode = AutovalidateMode.always;
                        });
                      }
                    },
                  );
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
      ),
    );
  }
}