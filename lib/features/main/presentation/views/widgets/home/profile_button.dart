
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../../core/utils/appAssets.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../../core/widgets/shimmer_widgets/shimmer_box.dart';
import '../../../manager/user_image_cubit/user_image_cubit.dart';
import '../../../../../profile/presentation/manager/profile/profile_cubit.dart';
import '../../../../../profile/presentation/views/profile_view.dart';

class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserImageCubit, UserImageState>(
      builder: (context, state) {
        if (state is UserImageSuccess) {
          return GestureDetector(
            onTap: () {
              context.read<ProfileCubit>().getProfileData();
              
              Navigator.pushNamed(context, ProfileView.name);
            },
            child:
                state.response.profileImageUrl == ''
                    ? SvgPicture.asset(Assets.iconsProfile)
                    : CircleAvatar(
                      radius: 15,
                      backgroundColor: Constants2.lightPrimaryColor(context),
                      backgroundImage: CachedNetworkImageProvider(
                        '${state.response.profileImageUrl}',
                      ),
                    ),
          );
        } else if (state is UserImageError) {
          return GestureDetector(
            onTap: (){
              context.read<ProfileCubit>().getProfileData();
              Navigator.pushNamed(context, ProfileView.name);
            },
            child: SvgPicture.asset(Assets.iconsProfile));
        } else {
          return shimmerBox(
            context: context,
            width: 30,
            height: 30,
            radius: 15,
          );
        }
      },
    );
  }
}
