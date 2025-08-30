import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/main/presentation/manager/group_post_cubit/group_posts_cubit.dart';
import '../../../../../../core/widgets/major_and_year_dropdown_buttons_section.dart';
import '../../../../../../core/widgets/posts/presentation/group_post.dart';

class GroupsPage extends StatelessWidget {
  const GroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          MajorAndYearDropdownButtonsSection(height: height),
          BlocBuilder<GroupPostsCubit, GroupPostsState>(
            builder: (context, state) {
              if (state is GroupPostsSuccess) {
                return Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.posts.length,
                    itemBuilder: (context, index) => GroupPost(post: state.posts[index],),
                  ),
                );
              } else if (state is GroupPostsError) {
                return Center(child: Text(state.errorMessage));
              } else {
                return Center(child: CircularProgressIndicator());
              }
            },
          ),
        ],
      ),
    );
  }
}
