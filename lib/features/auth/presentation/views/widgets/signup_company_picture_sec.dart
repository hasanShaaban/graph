import 'dart:io';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../data/models/company_model.dart';
import '../../../data/models/signup_data_model.dart';
import '../../manager/company_cubit/company_cubit.dart';
import 'auth_app_bar.dart';
import 'custom_text.dart';
import 'next_button.dart';
import 'signup_verification_section.dart';
import '../../../../../generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class SignupCompanyPictureSec extends StatefulWidget {
  const SignupCompanyPictureSec({super.key});
  static const name = 'companyPicture';
  @override
  State<SignupCompanyPictureSec> createState() =>
      _SignupCompanyPictureSecState();
}

class _SignupCompanyPictureSecState extends State<SignupCompanyPictureSec> {
  File? selectedImage;
  File? imageToSend;

  SignupDataModel? signupData;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments;

    if (args != null && args is SignupDataModel) {
      signupData = args;
    } else {
      // إذا ما في arguments نرجع للصفحة السابقة مباشرة
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pop(context);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // String? gender = signupData.gender;
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
          child: BlocConsumer<CompanyCubit, CompanyState>(
            listener: (context, state) async {
              if (state is CompanySuccess) {
                final token = state.response['token'];
                final message = state.response['message'];

                Navigator.pushNamed(context, SignupVerificationSection.name);
              } else if (state is CompanyFailuer) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            builder: (context, state) {
              return NextButton(
                title: lang.submit,
                isLoading: state is CompanyLoading,
                onPressed: () async {
                  if (selectedImage != null) {
                    imageToSend = selectedImage!;
                  }
                  if (signupData == null) return; // أو SizedBox() في build

                  final companyModel = CompanyModel(
                    firstName: signupData!.firstName,

                    image: imageToSend,
                    // selectedImage != null
                    //     ? selectedImage!.path
                    //     : (signupData.gender == 'Male'
                    //         ? 'assets/images/boy_profile.json'
                    //         : 'assets/images/girl_profile.json'),
                  );

                  final cubit = context.read<CompanyCubit>();

                  cubit.Company(companyModel: companyModel);
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
