import 'dart:io';

import 'package:flutter/material.dart';

import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/auth/presentation/views/widgets/custom_text.dart';
import 'package:graph/features/auth/presentation/views/widgets/next_button.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_collage_stage_section.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lottie/lottie.dart';

class SignupProfilePictureSection extends StatefulWidget {
  const SignupProfilePictureSection({super.key});
  static const name = 'profilePictureSec';
 
  @override
  State<SignupProfilePictureSection> createState() =>
      _SignupProfilePictureSectionState();
}

class _SignupProfilePictureSectionState
    extends State<SignupProfilePictureSection> {
  File? selectedImage;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: "Let's customize your profile",
          text2: r'"optional"',
          onPressed: () {
          
              Navigator.popAndPushNamed(
                context,
                SignupCollageStageSection.name,
              );
           
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              customText(text: 'Upload Your Picture'),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Profile pictures help others recognize you.',
                  style: AppTextStyle.cairoRegular14.copyWith(
                    color: Constants.darkSecondryColor,
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
                          height: 220,
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
                                color: Constants.darkSecondryColor,
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
                            color: Constants.lightSecondryColor,
                          ),
                        ),
                       
                             Lottie.asset(Assets.imagesBoyProfile)
                          
                      ],
                    ),
                  ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 70),
          child: NextButton(
            title: 'Submit',
            onPressed: () {
              Navigator.pushNamed(context, SignupCollageStageSection.name);
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
