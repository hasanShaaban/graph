import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/create_post/presentation/views/creat_post_page.dart';
import 'package:graph/core/functions/get_years_list.dart';
import 'package:graph/features/main/presentation/manager/public_post_cubit/public_post_cubit.dart';
import 'package:graph/features/main/presentation/views/main_page.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../main/presentation/manager/user_image_cubit/user_image_cubit.dart';
import 'package:graph/core/functions/custom_snack_bar.dart';
import 'package:graph/features/groups/presentation/manager/project_cubit/project_cubit.dart';
import '../../../data/models/signup_data_model.dart';
import '../../manager/login_cubit/login_cubit.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../sign_up_view.dart';
import 'auth_button.dart';
import 'auth_redirect_text.dart';
import 'custom_password_field.dart';
import 'custom_text_field.dart';
import 'remeber_me_section.dart';

class LoginViewBody extends StatefulWidget {
  const LoginViewBody({super.key});

  @override
  State<LoginViewBody> createState() => _LoginViewBodyState();
}

class _LoginViewBodyState extends State<LoginViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          autovalidateMode: autovalidateMode,
          key: formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              Text(
                lang.loginTitle,
                style: AppTextStyle.cairoBold55.copyWith(height: 1.2),
              ),
              SizedBox(height: 60),
              CustomTextField(
                onSaved: (value) => email = value!.trim(),
                hintText: lang.email,
                prefixIcon: Assets.iconsEnvelope,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 25),
              CustomPasswordField(onSaved: (value) => password = value!.trim()),
              SizedBox(height: 25),
              RemeberMeSection(text: lang.rememberMe),
              SizedBox(height: 20),
              BlocConsumer<LoginCubit, LoginState>(
                listener: (context, state) async {
                  if (state is LoginSuccess) {
                    final year = await profileLocalDataSource.getStudentYear();
                    final major =
                        await profileLocalDataSource.getStudentMajor();
                    context.read<UserImageCubit>().getUserImage();
                    context.read<PublicPostCubit>().getMainPagePosts();
                    context.read<ProjectCubit>().getProjects(
                      yearId: year == 0 ? 1 : year,
                      majorId: major == 0 ? null : major,
                    );
                    Navigator.pushReplacementNamed(
                      context,
                      MainPage.name,
                      arguments: signupData,
                    );
                  } else if (state is LoginFailuer) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      customSnackBar(
                        message: state.errorMessage,
                        backgroundColor: Constants2.darkSecondaryColor(context),
                        textColor: Constants2.darkPrimaryColor(context),
                        icon:
                            state.errorMessage == 'There is no internet'
                                ? Icons.wifi_off
                                : Icons.error,
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  return AuthButton(
                    title: lang.login,
                    isLoading: state is LoginLoading,
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();

                        final cubit = context.read<LoginCubit>();

                        cubit.login(email: email, password: password);
                      } else {
                        autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                  );
                },
              ),
              SizedBox(height: 25),
              AuthRedirectText(
                staitcText: lang.dontHaveAccount,
                redirectorText: lang.createOne,
                onTap: () {
                  Navigator.pushReplacementNamed(context, SignUpView.name);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
