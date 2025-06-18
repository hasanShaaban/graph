import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../follow/presentation/views/followers_view.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'custom_app_bar.dart';
import 'custom_text.dart';
import 'next_button.dart';
import 'signup_path_section.dart';

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
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          text1: lang.customizeProfile,
          text2: lang.optional,
          onPressed: () {
            Navigator.popAndPushNamed(context, SignupPathSection.name);
          },
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              CustomText(text: lang.uploadPicture),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  lang.pictureHelp,
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

                        Lottie.asset(Assets.imagesBoyProfile),
                      ],
                    ),
                  ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 70),
          child: NextButton(
            title: lang.submit,
            onPressed: () {
              //Navigator.pushNamed(context, FollowersView.name);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FollowersView()),
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
