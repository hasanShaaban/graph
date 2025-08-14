import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/expandable_text.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/images_custom_layout.dart';

class PublicPostContent extends StatelessWidget {
  const PublicPostContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        ExpandableText(
          'Great! You\'re describing a custom image layout widget similar to Facebook\'s post image style.\n \n Here\'s how you can create a custom FacebookImageLayout widget in Flutter that handles Great! You\'re describing a custom image layout widget similar to Facebook\'s post image style. Here\'s how you can create a custom FacebookImageLayout widget in Flutter that handles',
        ),
        SizedBox(height: 10),
        Text(
          '#Tag1 #Tag2 #Tag3',
          style: AppTextStyle.cairoRegular16.copyWith(
            height: 1.1,
            color: Constants2.secondaryColor(context),
          ),
        ),
        SizedBox(height: 10),
        ImagesCustomLayout(
          imageUrls: [
            Assets.imagesProfileImage,
            Assets.imagesProfileImage,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
            Assets.imagesGraphLogo,
          ],
        ),
      ],
    );
  }
}
