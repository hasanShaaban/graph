import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/staff_signup_cubit/staff_signup_cubit.dart';
import 'staff_identity_sec.dart';
import '../../../data/models/signup_data_model.dart';
import '../../../data/models/user_model.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'custom_text.dart';
import 'next_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class StaffImageSection extends StatefulWidget {
  const StaffImageSection({super.key});
  static const name = 'staffImageSec';

  @override
  State<StaffImageSection> createState() => _SignupProfilePictureSectionState();
}

class _SignupProfilePictureSectionState extends State<StaffImageSection> {
  File? selectedImage;
  File? imageToSend;

  late SignupDataModel signupData;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null && args is SignupDataModel) {
      signupData = args;
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AuthAppBar(
              text1: lang.customizeProfile,
              text2: lang.optional,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  CustomText(text: lang.uploadPicture),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      lang.pictureHelp,
                      style: AppTextStyle.cairoRegular14.copyWith(
                        color: Constants2.darkSecondaryColor(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),

                  selectedImage != null
                      ? GestureDetector(
                        onTap: () {
                          pickImageFromGallery();
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: 220,
                              // MediaQuery.of(context).size.width *
                              // (220 / 412),
                              height: 220,
                              // MediaQuery.of(context).size.height *
                              // (220 / 892),
                              decoration: BoxDecoration(shape: BoxShape.circle),
                              child: ClipOval(
                                child: Image.file(
                                  selectedImage!,
                                  width: 220,
                                  height: 220,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Positioned(
                              top: 5,

                              left: 15,
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedImage = null;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Constants2.darkSecondaryColor(
                                      context,
                                    ),
                                  ),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                      : GestureDetector(
                        onTap: () {
                          pickImageFromGallery();
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              width: 220,
                              height: 220,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Constants2.lightSecondaryColor(context),
                              ),
                            ),

                            Lottie.asset(Assets.imagesBoyProfile),
                          ],
                        ),
                      ),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 70),
          child: BlocConsumer<StaffSignupCubit, StaffSignupState>(
            listener: (context, state) async {
              if (state is StaffSignupSuccess) {
                log(state.response.toString());
                Navigator.pushNamed(
                  context,

                  StaffIdentitySec.name,
              //    arguments: signupData,
                );
              } else if (state is StaffSignupFailuer) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return NextButton(
                title: lang.submit,
                isLoading: state is StaffSignupLoading,
                onPressed: () async {
                  log('firstname: ${signupData.firstName}');
                  log('lastname: ${signupData.lastName}');

                  final userModel = UserModel(
                    firstName: signupData.firstName!,
                    lastName: signupData.lastName!,

                    image: selectedImage,
                  );

                  final cubit = context.read<StaffSignupCubit>();

                  cubit.staffSignup(userModel: userModel);
                },
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
    });
  }
}
