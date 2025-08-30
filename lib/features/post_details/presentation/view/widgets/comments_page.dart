import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/post_details/presentation/manager/comments_cubit/comment_cubit.dart';
import 'bottom_comment_textfield.dart';
import 'comment_root_and_children.dart';
import '../../../../../generated/l10n.dart';

class CommentsPage extends StatelessWidget {
  const CommentsPage({super.key, required this.lang, required this.width});

  final S lang;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: BlocBuilder<CommentCubit, CommentState>(
            builder: (context, state) {
              if (state is CommentSuccess) {
                return Column(
                  children: [
                    ...List.generate(state.comments.length, (index) {
                      return CommentRootAndChildrens(lang: lang, index: index, postComments: state.comments,);
                    }),
                  ],
                );
              }else if (state is CommentError){
                return Center(child: Text(state.errorMessage),);
              }else{
                return Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ),
        BottomCommentTextField(width: width, lang: lang),
      ],
    );
  }
}
