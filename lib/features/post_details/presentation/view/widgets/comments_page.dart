import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/functions/custom_snack_bar.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/post_details/presentation/manager/add_comment_cubit/add_comment_cubit.dart';
import 'package:graph/features/post_details/presentation/manager/comments_cubit/comment_cubit.dart';
import 'package:graph/features/post_details/presentation/view/widgets/comment_content.dart';
import 'bottom_comment_textfield.dart';
import 'comment_root_and_children.dart';
import '../../../../../generated/l10n.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({
    super.key,
    required this.lang,
    required this.width,
    required this.postId,
  });

  final S lang;
  final double width;
  final int postId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      children: [
        BlocListener<AddCommentCubit, AddCommentState>(
          listener: (context, state) {
            if (state is AddCommentSuccess) {
              context.read<CommentCubit>().getPostComments(postId: postId);
            } else if (state is AddCommentError) {
              ScaffoldMessenger.of(context).showSnackBar(
                customSnackBar(
                  message: state.errorMessage,
                  backgroundColor: Constants2.darkSecondaryColor(context),
                  textColor: Constants2.lightPrimaryColor(context),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: BlocBuilder<CommentCubit, CommentState>(
              builder: (context, state) {
                if (state is CommentSuccess) {
                  return Column(
                    children: [
                      ...List.generate(state.comments.length, (index) {
                        return CommentRootAndChildrens(
                          lang: lang,
                          index: index,
                          postComments: state.comments,
                        );
                      }),
                    ],
                  );
                } else if (state is CommentError) {
                  return Center(child: Text(state.errorMessage));
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ),
        BottomCommentTextField(width: width, lang: lang, postId: postId),
      ],
    );
  }
}

