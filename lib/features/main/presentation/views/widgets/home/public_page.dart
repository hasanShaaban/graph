import 'package:flutter/material.dart';
import 'package:graph/core/widgets/posts/public_post.dart';
import 'package:graph/features/post_details/presentation/view/post_details_view.dart';
import 'package:graph/generated/l10n.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var lang = S.of(context);
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder:
          (context, index) => Padding(
            padding: const EdgeInsets.only(
              bottom: 20,
              left: 20,
              right: 20,
              top: 5,
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, PostDetailsView.name);
              },
              child: PublicPost(lang: lang, width: width, height: height),
            ),
          ),
      itemCount: 20,
    );
  }
}
