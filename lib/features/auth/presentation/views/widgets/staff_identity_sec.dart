import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../manager/staff_identity_cubit/staff_identity_cubit.dart';
import 'auth_app_bar.dart';
import 'custom_text.dart';
import 'next_button.dart';
import '../../../../../generated/l10n.dart';
import 'package:image_picker/image_picker.dart';

class StaffIdentitySec extends StatefulWidget {
  const StaffIdentitySec({super.key});
  static const name = 'staffIdentitySec';

  @override
  State<StaffIdentitySec> createState() => _StaffIdentitySecState();
}

class _StaffIdentitySecState extends State<StaffIdentitySec> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              AuthAppBar(
                text1: lang.verifyIdentity,
                text2: '',
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Column(
                  children: [
                    CustomText(text: lang.pleasseVerfyIdentity),
                    Text(
                      lang.makeSureAllDetailsVisible,
                      style: AppTextStyle.cairoRegular14,
                    ),
                    SizedBox(height: 10),
                    FormField<File?>(
                      validator: (value) {
                        if (selectedImage == null) {
                          return lang.pleasseVerfyIdentity; // أو رسالة خطأ أوضح
                        }
                        return null;
                      },
                      builder:
                          (field) => Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  pickImageFromGallery();
                                },
                                child: Container(
                                  width: double.infinity,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Constants2.lightSecondaryColor(
                                      context,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child:
                                        selectedImage != null
                                            ? Image.file(
                                              selectedImage!,
                                              width: 220,
                                              height: 220,
                                              fit: BoxFit.cover,
                                            )
                                            : Icon(
                                              Icons.person,
                                              size: 100,
                                              color: Colors.grey,
                                            ),
                                  ),
                                ),
                              ),
                              if (field.hasError)
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    field.errorText!,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                            ],
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 70),
          child: BlocConsumer<StaffIdentityCubit, StaffIdentityState>(
            listener: (context, state) {
              if (state is StaffIdentitySuccess) {
                log(state.response is num ? state.response as num : 0);

                Navigator.pushNamed(context, StaffIdentitySec.name);
              } else if (state is StaffIdentityFailuer) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return NextButton(
                isLoading: state is StaffIdentityLoading,

                onPressed: () async {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    final image = selectedImage;
                    final cubit = context.read<StaffIdentityCubit>();

                    cubit.staffIdentity(image: image!);
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                title: lang.Save,
              );
            },
          ),
        ),
      ),
    );
  }

  Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    if (returnedImage == null) return;
    setState(() {
      selectedImage = File(returnedImage.path);
      formKey.currentState?.validate();
    });
  }
}
