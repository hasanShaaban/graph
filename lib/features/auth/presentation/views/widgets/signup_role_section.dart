import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/role_cubit/role_cubit.dart';
import 'next_button.dart';
import 'signup_company_name_section.dart';
import 'signup_username_section.dart';
import '../../../data/models/signup_data_model.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';

import 'custom_dropdown_button.dart';
import 'custom_text.dart';

class SignupRoleSection extends StatefulWidget {
  const SignupRoleSection({super.key});
  static const name = 'roleSec';

  @override
  State<SignupRoleSection> createState() => _SignupRoleSectionState();
}

class _SignupRoleSectionState extends State<SignupRoleSection> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final List<String> role = ['student', 'company','staff'];
  String? selectedRole;
  int? roleId;
  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    signupData = SignupDataModel();
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);

    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          child: Column(
            children: [
              AuthAppBar(
                text1: lang.almostThere,
                text2: lang.fewDetails,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    CustomText(text: lang.specifyRole),
                    SizedBox(height: 34),

                    Material(
                      child: customDropDownButton(
                        border: 15,
                        width: 300,
                        height: 55,
                        list: role,
                        text: selectedRole ?? lang.selectRole,
                        onChanged: (value) {
                          setState(() {
                            selectedRole = value;
                          });
                        },

                        iconPadding: 70,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 70),
          child: BlocConsumer<RoleCubit, RoleState>(
            listener: (context, state) async {
              if (state is RoleSuccess) {
                
                if (selectedRole == 'student') {
                  print(selectedRole);
                  Navigator.pushNamed(
                    context,
                    SignupUsernameSection.name,
                    arguments: signupData.copyWith(role: selectedRole),
                  );
                  print(selectedRole);
                } else if (selectedRole == 'company') {
                  print(selectedRole);
                  Navigator.pushNamed(
                    context,
                    SignupCompanyNameSection.name,
                    arguments: signupData.copyWith(role: selectedRole),
                  );
                  print(selectedRole);
                }
              } else if (state is RoleFailuer) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return NextButton(
                title: lang.next,
                isLoading: state is RoleLoading,
                onPressed: () {
                  if (selectedRole == null || selectedRole!.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.redAccent,
                        content: Text(lang.pleaseSelectRole),
                      ),
                    );
                  } else {
                    final cubit = context.read<RoleCubit>();
                    cubit.setRole(role: selectedRole!);
                  }
                },

                // onPressed: () {
                //   if (selectedRole == null || selectedRole!.isEmpty) {
                //     ScaffoldMessenger.of(context).showSnackBar(
                //       SnackBar(
                //         backgroundColor: Colors.redAccent,
                //         content: Text(lang.pleaseSelectRole),
                //       ),
                //     );
                //   } else {
                //     signupData = signupData.copyWith(role: selectedRole!);

                //     Navigator.pushNamed(
                //       context,
                //       SignupUsernameSection.name,
                //       arguments: signupData,
                //     );
                //   }
                // },
              );
            },
          ),
        ),
      ),
    );
  }
}
