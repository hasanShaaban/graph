import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/widgets/posts/presentation/public_post.dart';
import 'package:graph/features/profile/presentation/manager/profile_posts/profile_posts_cubit.dart';
import 'package:graph/generated/l10n.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({
    super.key,
    required this.width,
    required this.height,
    required this.lang,
  });

  final double width, height;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfilePostsCubit, ProfilePostsState>(
      builder: (context, state) {
        if (state is ProfilePostsSuccess) {
          return ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: state.posts.length,
            itemBuilder:
                (context, index) => Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                 // child: PublicPost(lang: lang, width: width, height: height, data: state.posts[index],),
                ),
          );
        } else if (state is ProfilePostsError) {
          return Text(state.errorMessage);
        } else {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
            ],
          );
        }
      },
    );
  }
}
