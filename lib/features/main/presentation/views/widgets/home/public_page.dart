import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/widgets/posts/presentation/manager/react_cubit/react_cubit.dart';
import 'package:graph/features/main/presentation/manager/public_post_cubit/public_post_cubit.dart';
import 'package:graph/generated/l10n.dart';
import '../../../../../../core/widgets/posts/presentation/public_post.dart';
import '../../../../../post_details/presentation/view/post_details_view.dart';

class PublicPage extends StatelessWidget {
  const PublicPage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var lang = S.of(context);
    return BlocBuilder<PublicPostCubit, PublicPostState>(
      builder: (context, state) {
        if (state is PublicPostSuccess) {
          return RefreshIndicator(
            onRefresh: () {
              context.read<PublicPostCubit>().getMainPagePosts();
              return Future.value();
            },
            child: BlocListener<ReactCubit, ReactState>(
              listener: (context, state) {
                if(state is ReactSuccess){
                  log('React ADDED Successfully');
                }else if(state is ReactError){
                  log(state.message);
                }
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemBuilder:
                    (context, index) => Padding(
                      padding: const EdgeInsets.only(
                        bottom: 20,
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: PublicPost(
                        data: state.posts[index],
                        lang: lang,
                        width: width,
                        height: height,
                        onTap: () {
                          Navigator.pushNamed(context, PostDetailsView.name);
                        },
                      ),
                    ),
                itemCount: state.posts.length,
              ),
            ),
          );
        } else if (state is PublicPostError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
