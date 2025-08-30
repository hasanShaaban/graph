import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/features/post_details/presentation/manager/reactions_cubit/reactions_cubit.dart';
import '../../../../../core/utils/app_text_style.dart';

class ReactsPage extends StatelessWidget {
  const ReactsPage({super.key, required this.reactsId});

  final Map reactsId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReactionsCubit, ReactionsState>(
      builder: (context, state) {
        if (state is ReactionsSuccess) {
          return ListView.builder(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.reactions.length,
            itemBuilder:
                (context, index) => ListTile(
                  horizontalTitleGap: 5,
                  leading: CircleAvatar(
                    radius: 35 / 2,
                    backgroundImage: CachedNetworkImageProvider(
                      state.reactions[index].users[0].profileImageUrl,
                    ),
                  ),
                  title: Text(
                    state.reactions[index].users[0].name,
                    style: AppTextStyle.cairoSemiBold16,
                  ),
                  trailing: SvgPicture.asset(
                    reactsByName[state.reactions[index].reactionId]!,
                  ),
                ),
          );
        } else if (state is ReactionsError) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

final Map<int, String> reactsByName = {
  1: Assets.iconsReactLove,
  2: Assets.iconsReactClap,
  3: Assets.iconsReactLaugh,
};
