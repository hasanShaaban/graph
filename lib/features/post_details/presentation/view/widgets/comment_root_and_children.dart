import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import 'package:graph/features/post_details/domain/entity/comment_entity.dart';
import '../../../../../core/utils/constants.dart';
import 'comment_content.dart';
import '../../../../../generated/l10n.dart';

class CommentRootAndChildrens extends StatelessWidget {
  const CommentRootAndChildrens({
    super.key,
    required this.lang,
    required this.index,
    required this.postComments,
  });

  final List<CommentEntity> postComments;

  final S lang;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CommentTreeWidget<Comment, Comment>(
      Comment(
        avatar: postComments[index].user.imageUrl,
        userName: postComments[index].user.name,
        content: postComments[index].comment,
      ),
      List.generate(
        postComments[index].responses.length,
        (replyIndex) => Comment(
          avatar: postComments[index].responses[replyIndex].user.imageUrl,
          userName: postComments[index].responses[replyIndex].user.name,
          content: postComments[index].responses[replyIndex].comment,
        ),
      ),
      treeThemeData: TreeThemeData(
        lineColor: Constants2.dividerColor(context),
        lineWidth: 1,
      ),
      avatarRoot:
          (context, data) => PreferredSize(
            preferredSize: Size.fromRadius(35 / 2),
            child: CircleAvatar(
              radius: 35 / 2,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('${data.avatar}'),
            ),
          ),
      avatarChild:
          (context, data) => PreferredSize(
            preferredSize: Size.fromRadius(15),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage('${data.avatar}'),
            ),
          ),
      contentChild: (context, data) {
        return CommentContent(lang: lang, data: data, id: postComments[index].commentId,);
      },
      contentRoot: (context, data) {
        return CommentContent(
          lang: lang,
          data: data,
          responseCount: postComments[index].responses.length,
          id: postComments[index].commentId,
        );
      },
    );
  }
}


