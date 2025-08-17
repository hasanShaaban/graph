import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class CircularProfilePicture extends StatelessWidget {
  const CircularProfilePicture({
    super.key,
    required this.width,
    required this.height,
    this.image,
    required this.onEditTap,
    required this.gender,
  });

  final double width;
  final double height;
  final File? image;
  final VoidCallback onEditTap;
  final String gender;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left: width / 2 - 90, // 90= 180/2 , width/2 to center the widget.
            top: height * 0.14, // (95 / 924) , //0.14, //(150 / 924),
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants2.primaryColor(context),
                  width: 5,
                ),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,

                backgroundImage: image != null ? FileImage(image!) : null,
                child:
                    image == null
                        ? ClipOval(
                          child: Transform.scale(
                            scale: 2, // 👈 زووم (غيّر الرقم حسب قد ما بدك تكبر)
                            child: Lottie.asset(
                              gender == lang.male
                                  ? Assets.imagesBoyProfile
                                  : Assets.imagesGirlProfile,
                              fit: BoxFit.fill,
                              width: double.infinity,
                              height: double.infinity,
                            ),
                          ),
                        )
                        : null,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: width * (134 / 412),
            child: GestureDetector(
              onTap: onEditTap,
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants2.primaryColor(context),
                ),
                child: SvgPicture.asset(
                  Assets.iconsPenCircle,
                  color: Colors.white,
                  width: 11,
                  height: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
