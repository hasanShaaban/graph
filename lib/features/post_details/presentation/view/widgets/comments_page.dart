import 'package:flutter/widgets.dart';
import 'package:graph/features/post_details/presentation/view/widgets/bottom_comment_textfield.dart';
import 'package:graph/features/post_details/presentation/view/widgets/comment_root_and_children.dart';
import 'package:graph/generated/l10n.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({
    super.key,
    required this.lang,
    required this.width,
  });

  final S lang;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              ...List.generate(comments['comments'].length, (index) {
                return CommentRootAndChildrens(
                  lang: lang,
                  index: index,
                );
              }),
            ],
          ),
        ),
        BottomCommentTextField(width: width, lang: lang),
      ],
    );
  }
}
