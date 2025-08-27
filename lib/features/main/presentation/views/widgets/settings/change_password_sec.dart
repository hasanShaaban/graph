import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'dart:developer';

import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/auth/presentation/views/widgets/auth_button.dart';
import 'package:graph/features/main/data/models/change_password_model.dart';
import 'package:graph/features/main/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:graph/features/main/presentation/views/widgets/settings/change_password_text_form_field.dart';
import 'package:graph/features/profile/presentation/views/edit_profile_view.dart';
import 'package:graph/generated/l10n.dart';

class ChangePasswordSec extends StatefulWidget {
  const ChangePasswordSec({super.key});
  static const name = 'changePassword';

  @override
  State<ChangePasswordSec> createState() => _SignupEmailPasswordSectionState();
}

class _SignupEmailPasswordSectionState extends State<ChangePasswordSec> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String oldPassword = '';
  String newPassword = '';
  String confirmNewPassword = '';

  String? password;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(Assets.iconsArrowLeft),
                ),
                const SizedBox(height: 40),
                Text(
                  lang.changeYourPassword,
                  style: AppTextStyle.cairoBold55.copyWith(height: 1.2),
                ),
                const SizedBox(height: 60),
                ChangePasswordTextFormField(
                  onEmailSaved: (value) => oldPassword = value!.trim(),
                  onPasswordSaved: (String? newValue) {
                    log('new password: $newValue');
                    newPassword = newValue!.trim();
                  },
                  onConfirmPasswordSaved: (String? newValue) {
                    log('confirm new password saved: $newValue');
                    confirmNewPassword = newValue!.trim();
                  },
                ),
                const SizedBox(height: 29),

                BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
                  listener: (context, state) async {
                    if (state is ChangePasswordSuccess) {
                      log(state.response.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.response['message'])),
                      );

                      Navigator.pushNamed(context, EditProfileView.name);
                    } else if (state is ChangePasswordFailuer) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(state.errorMessage)),
                      );
                    }
                  },
                  builder: (context, state) {
                    return AuthButton(
                      title: lang.Save,
                      isLoading: state is ChangePasswordLoading,
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          log(
                            'old: $oldPassword, new: $newPassword, Confirm: $confirmNewPassword',
                          );

                          final changePass = ChangePasswordModel(
                            oldPassword: oldPassword,
                            newPassword: newPassword,
                            confirmNewPassword: confirmNewPassword,
                          );

                          final cubit = context.read<ChangePasswordCubit>();

                          cubit.changePassword(changePasswordModel: changePass);
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
