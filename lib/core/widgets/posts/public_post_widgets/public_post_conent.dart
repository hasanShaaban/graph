import 'package:flutter/material.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/images_custom_layout.dart';
import 'package:graph/generated/l10n.dart';

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

class ExpandableText extends StatefulWidget {
  final String text;
  final int trimLines;

  const ExpandableText(this.text, {super.key, this.trimLines = 3});

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  bool _readMore = true;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    final textSpan = TextSpan(text: widget.text);
    final textPainter = TextPainter(
      text: textSpan,
      maxLines: widget.trimLines,
      textDirection: lang.lang == 'ar' ? TextDirection.rtl : TextDirection.ltr,
    );
    textPainter.layout(maxWidth: MediaQuery.of(context).size.width);

    final isOverflowing = textPainter.didExceedMaxLines;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: _readMore ? widget.trimLines : null,
          overflow: _readMore ? TextOverflow.ellipsis : TextOverflow.visible,
          style: AppTextStyle.cairoRegular16.copyWith(
            color: Constants2.darkPrimaryColor(context),
            height: 1.2,
          ),
        ),
        if (isOverflowing)
          GestureDetector(
            onTap: () => setState(() => _readMore = !_readMore),
            child: Text(
              _readMore ? "Read more" : "Read less",
              style: AppTextStyle.cairoRegular16.copyWith(
                color: Constants2.darkSecondaryColor(context),
                height: 1.2,
              ),
            ),
          ),
      ],
    );
  }
}
