import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../utils/appAssets.dart';
import '../utils/constants.dart';
import '../../generated/l10n.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({
    super.key,
    required this.width,
    required this.height,
    required this.imageWidth,
    required this.imageHeight,
    required this.borderThick,
    this.borderColor = Constants.lightPrimaryColor,
    this.editable = false,
    this.onTap,
    this.image = '',
  });

  final double width, imageWidth;
  final double height, imageHeight, borderThick;
  final Color? borderColor;
  final bool? editable;
  final VoidCallback? onTap;
  final String? image;
  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double stackWidth = width * imageWidth / 412;
    return Stack(
      fit: StackFit.loose,
      alignment:
          lang.lang == 'en' ? Alignment.bottomRight : Alignment.bottomLeft,
      clipBehavior: Clip.none,
      children: [
        Container(
          width: stackWidth,
          height: stackWidth,
          decoration: BoxDecoration(
            border: Border.all(color: borderColor!, width: borderThick),
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(stackWidth /2),
            image:
                image != null && image! != ''
                    ? DecorationImage(
                      image: CachedNetworkImageProvider(image!),
                      fit: BoxFit.cover,
                    )
                    : null,
          ),
          child:
              image == null || image == ''
                  ? SvgPicture.asset(
                    Assets.iconsProfile,
                    color: Constants2.darkSecondaryColor(context),
                  )
                  : null,
        ),
        if (editable!)
          Positioned(
            bottom: stackWidth * 5 / 170,
            right: lang.lang == 'en' ? stackWidth * 19 / 170 : null,
            left: lang.lang == 'ar' ? stackWidth * 19 / 170 : null,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                width: width * 35 / 412,
                height: width * 35 / 412,
                decoration: BoxDecoration(
                  color: Constants.primaryColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
      ],
    );
  }
}
