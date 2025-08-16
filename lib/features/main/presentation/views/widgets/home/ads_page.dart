import 'package:flutter/widgets.dart';
import 'package:graph/core/widgets/posts/ads_post.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) => AdsPost(),
          ),
        ),
      ],
    );
  }
}
