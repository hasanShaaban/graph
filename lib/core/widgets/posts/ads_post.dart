import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/ads_post_widgets/ads_post_header.dart';
import 'package:graph/core/widgets/expandable_text.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/react_button.dart';

class AdsPost extends StatelessWidget {
  const AdsPost({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Column(
            children: [
              AdsPostHeader(width: width, height: height),
              SizedBox(height: 10),
              ExpandableText(
                'Notice: Algorithm Course Project Interviews This is to inform all students that interviews for the Algorithm course projects will be conducted next Sunday. All students are required to be prepared to present and discuss their project work with the course instructors. Further details regarding the schedule and venue will be announced soon.',
                trimLines: 3,
              ),
              SizedBox(height: 25),
              Divider(
                color: Constants2.dividerColor(context),
                thickness: 1,
                height: 1,
              ),
            ],
          ),
          ReactButton(
            height: height,
            width: width,
            buttonColor: Constants2.lightPrimaryColor(context),
            circleColor: Constants2.lightPrimaryColor(context),
          ),
        ],
      ),
    );
  }
}
