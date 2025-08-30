// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/posts/presentation/public_post_widgets/share_with_widget.dart';
import 'package:graph/core/widgets/profile_image.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';
import 'package:graph/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:graph/features/profile/presentation/views/profile_view.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    required this.width,
    required this.height,
    required this.user,
    required this.date,
    required this.privecy,
    required this.imageUrl,
    this.project,
  });

  final double width;
  final double height;
  final String date, privecy, imageUrl;
  final List<UserEntity> user;
  final String? project;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            context.read<ProfileCubit>().getUserProfileData(user[0].id);
            Navigator.pushNamed(context, ProfileView.name);
          },
          child: ProfileImage(
            width: width,
            height: height,
            imageWidth: 55,
            imageHeight: 55,
            borderThick: 1,
            image: imageUrl,
          ),
        ),
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  user[0].name,
                  style: AppTextStyle.cairoSemiBold18.copyWith(
                    color: Constants2.darkPrimaryColor(context),
                    height: 1.1,
                  ),
                ),
                SizedBox(width: 5),
                user.length > 1 ? ShareWithWidget(user: user) : Container(),
              ],
            ),
            Row(
              children: [
                Text(
                  date,
                  style: AppTextStyle.cairoRegular12.copyWith(
                    color: Constants2.darkSecondaryColor(context),
                    height: 1.3,
                  ),
                ),
                SizedBox(width: 7),
                SvgPicture.asset(
                  project != null
                      ? Assets.iconsPollH
                      : privecy == 'public'
                      ? Assets.iconsEarthAfrica
                      : Assets.iconsFriends,
                  width: 12,
                  color: Constants2.darkSecondaryColor(context),
                ),
              ],
            ),
          ],
        ),
        Spacer(),
        SizedBox(width: 10),
        //TODO: implemet more button
        SvgPicture.asset(
          Assets.iconsDots,
          color: Constants2.darkSecondaryColor(context),
        ),
      ],
    );
  }
}
