import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:photo_view/photo_view.dart';

class FullScreenImageView extends StatelessWidget {
  final ImageProvider image;
  final bool isDeletable;
  final String heroTag;
  static const name = 'fullScreenImage';
  const FullScreenImageView({
    super.key,
    required this.image,
    this.isDeletable = false,
    required this.heroTag,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants2.lightPrimaryColor(context),
      body: Stack(
        children: [
          Center(
            child: Hero(
              tag: heroTag,
              child: PhotoView(
                imageProvider: image,
                backgroundDecoration: const BoxDecoration(
                  color: Constants.lightPrimaryColor,
                ),
              ),
            ),
          ),

          Positioned(
            top: 40,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: SvgPicture.asset(Assets.iconsArrowLeft),
            ),
          ),

          if (isDeletable)
            Positioned(
              top: 50,
              right: 20,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context, 'delete');
                },
                child: Container(
                  width: 150,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Constants.lightSecondryColor,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('delete photo', style: AppTextStyle.cairoBold16),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
