import 'dart:io';

// @override
// void initState() {
//   super.initState();
//   imageFile = widget.image;
// }

// Future<void> pickImage() async {
//   final picker = ImagePicker();
//   final picked = await picker.pickImage(source: ImageSource.gallery);
//   if (picked != null && mounted) {
//     setState(() {
//       imageFile = File(picked.path);
//     });
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/auth/presentation/views/widgets/full_screen_image_view.dart';
import 'package:graph/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class CircularProfilePicture extends StatefulWidget {
  const CircularProfilePicture({
    super.key,
    required this.width,
    required this.height,
    this.image,
    required this.onEditTap,
    required this.gender,
    required this.onDelete,
    required this.lang,
  });

  final double width;
  final double height;
  final File? image;
  final VoidCallback onEditTap;
  final String gender;
  final VoidCallback onDelete;
  final S lang;

  @override
  State<CircularProfilePicture> createState() => _CircularProfilePictureState();
}

class _CircularProfilePictureState extends State<CircularProfilePicture> {
  File? currentImage;
  @override
  void initState() {
    super.initState();
    currentImage = widget.image;
  }

  void deleteImage() {
    setState(() {
      currentImage = null;
    });
    widget.onDelete();
  }

  @override
  void didUpdateWidget(covariant CircularProfilePicture oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.image != widget.image) {
      setState(() {
        currentImage = widget.image;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final lang = S.of(context);
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left:
                widget.width / 2 -
                90, // 90= 180/2 , width/2 to center the widget.
            top: widget.height * 0.14, // (95 / 924) , //0.14, //(150 / 924),
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
              child: GestureDetector(
                onTap: () async {
                  final result = await Navigator.pushNamed(
                    context,
                    FullScreenImageView.name,
                    arguments: {
                      'image':
                          currentImage != null
                              ? FileImage(currentImage!)
                              : null,

                      'isDeletable': currentImage != null,
                      'heroTag': 'profile-image-hero',
                    },
                  );

                  if (result == 'delete') {
                    deleteImage();
                  }
                },
                child: Hero(
                  tag: 'profile-image-hero',
                  child: ClipOval(
                    child: Container(
                      width: 180,
                      height: 180,
                      color: Constants2.lightPrimaryColor(context),
                      child:
                          currentImage != null
                              ? Image.file(
                                currentImage!,
                                fit: BoxFit.cover,
                                width: 180,
                                height: 180,
                              )
                              : Lottie.asset(
                                widget.gender == widget.lang.male
                                    ? Assets.imagesBoyProfile
                                    : Assets.imagesGirlProfile,
                                fit: BoxFit.fill,
                                width: 180,
                                height: 180,
                              ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 4,

            right: widget.width * (134 / 412),
            child: GestureDetector(
              onTap: widget.onEditTap,
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
