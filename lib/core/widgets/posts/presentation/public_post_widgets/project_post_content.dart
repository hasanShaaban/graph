import 'package:flutter/material.dart';
import 'package:graph/core/widgets/expandable_text.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/generated/l10n.dart';
import '../../../../utils/app_text_style.dart';
import '../../../../utils/constants.dart';

import 'images_custom_layout.dart';

class ProjectPostContent extends StatelessWidget {
  const ProjectPostContent({
    super.key,
    required this.post,
  });

  final NormalPostEntity post;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10),
        Text('${lang.project} : ${post.project} ', style: AppTextStyle.cairoBold16,),
        ExpandableText(post.description),
        SizedBox(height: 10),
        Text(
          '#Tag1 #Tag2 #Tag3',
          style: AppTextStyle.cairoRegular16.copyWith(
            height: 1.1,
            color: Constants2.secondaryColor(context),
          ),
        ),
        SizedBox(height: 10),
        post.files.isNotEmpty ?
        ImagesCustomLayout(
          imageUrls: post.files,
        ): SizedBox(),
      ],
    );
  }
}


