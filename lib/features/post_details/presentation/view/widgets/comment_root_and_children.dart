import 'package:comment_tree/data/comment.dart';
import 'package:comment_tree/widgets/comment_tree_widget.dart';
import 'package:comment_tree/widgets/tree_theme_data.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import 'comment_content.dart';
import '../../../../../generated/l10n.dart';

class CommentRootAndChildrens extends StatelessWidget {
  const CommentRootAndChildrens({
    super.key,
    required this.lang, required this.index,
  });

  final S lang;
  final int index;

  @override
  Widget build(BuildContext context) {
    return CommentTreeWidget<Comment, Comment>(
      Comment(
        avatar: '${comments['comments'][index]['image']}',
        userName:
            '${comments['comments'][index]['userName']}',
        content: '${comments['comments'][index]['content']}',
      ),
      List.generate(
        comments['comments'][index]['replies'].length,
        (replyIndex) => Comment(
          avatar:
              '${comments['comments'][index]['replies'][replyIndex]['image']}',
          userName:
              '${comments['comments'][index]['replies'][replyIndex]['userName']}',
          content:
              '${comments['comments'][index]['replies'][replyIndex]['content']}',
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
              backgroundImage: AssetImage('${data.avatar}'),
            ),
          ),
      avatarChild:
          (context, data) => PreferredSize(
            preferredSize: Size.fromRadius(15),
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.grey,
              backgroundImage: AssetImage('${data.avatar}'),
            ),
          ),
      contentChild: (context, data) {
        return CommentContent(lang: lang, data: data);
      },
      contentRoot: (context, data) {
        return CommentContent(lang: lang, data: data);
      },
    );
  }
}

// comments examples

Map<String, dynamic> comments = {
  'comments': [
    {
      'id': 1,
      'userName': 'Hasan Shaaban',
      'image': 'assets/images/profile_image.jpg',
      'content':
          'Absolutely agree! Hot reload has saved me HOURS during debugging 😩🔥',
      'replies': [
      ]
    },
    {
      'id': 2,
      'userName': 'Hasan Shaaban',
      'image': 'assets/images/graph_logo.png',
      'content':
          'I’ve been using it for UI-heavy apps and it’s insane how fast you can build prototypes 😍',
      'replies': [
        {
          'id': 3,
          'userName': 'Hasan Shaaban',
          'image': 'assets/images/profile_image.jpg',
          'content':
              'Absolutely agree! Hot reload has saved me HOURS during debugging',
          'replies': [
          ]
        },
      ],
    },
    {
      'id': 4,
      'userName': 'Hasan Shaaban',
      'image': 'assets/images/profile_image.jpg',
      'content':
          'Absolutely agree! Hot reload has saved me HOURS during debugging 😩🔥',
      'replies': [
      ]
    },
  ],
};
