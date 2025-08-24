import 'package:flutter/material.dart';
import 'package:graph/core/widgets/expandable_text.dart';
import '../../../../utils/app_text_style.dart';
import '../../../../utils/constants.dart';

import 'images_custom_layout.dart';

class PublicPostContent extends StatelessWidget {
  const PublicPostContent({
    super.key,
    required this.text,
    required this.images,
  });

  final String text;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        ExpandableText(text),
        SizedBox(height: 10),
        Text(
          '#Tag1 #Tag2 #Tag3',
          style: AppTextStyle.cairoRegular16.copyWith(
            height: 1.1,
            color: Constants2.secondaryColor(context),
          ),
        ),
        SizedBox(height: 10),
        images.isNotEmpty ?
        ImagesCustomLayout(
          imageUrls: images,
        ): SizedBox(),
      ],
    );
  }
}
