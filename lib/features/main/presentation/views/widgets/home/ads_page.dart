import 'package:flutter/widgets.dart';

import '../../../../../../core/widgets/posts/ads_post.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AdsPost(),
      ],
    );
  }
}