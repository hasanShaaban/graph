import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/features/auth/presentation/views/widgets/full_screen_image_view.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import 'package:graph/generated/l10n.dart';
import 'package:lottie/lottie.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class ProfilePicture extends StatefulWidget {
  ProfilePicture({
    super.key,
    required this.width,
    required this.height,
    required this.profile,
    required this.onEditTap,
    required this.gender,
    required this.onDelete,
    required this.lang,
  });

  final double width;
  final double height;
  final ProfileEntity profile;
  final VoidCallback onEditTap;
  final String gender;
  final VoidCallback onDelete;
  final S lang;

  @override
  State<ProfilePicture> createState() => _CircularProfilePictureState();
}

class _CircularProfilePictureState extends State<ProfilePicture> {
  File? currentImage;

  @override
  void initState() {
    super.initState();
    if (widget.profile.image != null && widget.profile.image!.isNotEmpty) {
      currentImage = File(widget.profile.image!);
    }
  }

  void deleteImage() {
    setState(() {
      currentImage = null;
    });
    widget.onDelete();
  }

  @override
  void didUpdateWidget(covariant ProfilePicture oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile.image != widget.profile.image) {
      setState(() {
        currentImage =
            (widget.profile.image != null && widget.profile.image!.isNotEmpty)
                ? File(widget.profile.image!)
                : null;
      });
    }
  }

  Widget _buildProfileImage() {
    if (widget.profile.image != null && widget.profile.image!.isNotEmpty) {
      return Image.network(
        widget.profile.image!,
        fit: BoxFit.cover,
        width: 180,
        height: 180,
      );
    } else {
      return Lottie.asset(
        widget.gender == widget.lang.male
            ? Assets.imagesBoyProfile
            : Assets.imagesGirlProfile,
        fit: BoxFit.fill,
        width: 180,
        height: 180,
      );
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
                    child: _buildProfileImage(),

                    //  Container(
                    //   width: 180,
                    //   height: 180,
                    //   color: Constants2.lightPrimaryColor(context),
                    //   child:
                    //       currentImage != null
                    //           ? Image.file(
                    //             currentImage!,
                    //             fit: BoxFit.cover,
                    //             width: 180,
                    //             height: 180,
                    //           )
                    //           : Lottie.asset(
                    //             widget.gender == widget.lang.male
                    //                 ? Assets.imagesBoyProfile
                    //                 : Assets.imagesGirlProfile,
                    //             fit: BoxFit.fill,
                    //             width: 180,
                    //             height: 180,
                    //           ),
                    // ),
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
