import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
<<<<<<< HEAD:lib/features/follow/presentation/views/widgets/follow_list_view_item.dart
import 'package:graph/features/follow/presentation/views/widgets/custom_user_list_view.dart';

=======
import 'package:graph/core/utils/constants.dart';
>>>>>>> 87138231c48297d998c94191550669d2437d0aaf:lib/features/followers&following/presentation/views/widgets/follow_list_view_item.dart
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';

class FollowListViewItem extends StatelessWidget {
  const FollowListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
<<<<<<< HEAD:lib/features/follow/presentation/views/widgets/follow_list_view_item.dart
          CustomUserListView(),

=======
          CircleAvatar(
            radius: 30,
            backgroundColor: Colors.grey,
            backgroundImage: AssetImage(Assets.imagesProfileImage),
          ),
          SizedBox(width: 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Saly Karim',
                style: AppTextStyle.cairoRegular18.copyWith(height: 1),
              ),
              Text(
                'Teacher',
                style: AppTextStyle.cairoRegular14.copyWith(
                  color: Constants.darkSecondryColor,
                ),
              ),
            ],
          ),
>>>>>>> 87138231c48297d998c94191550669d2437d0aaf:lib/features/followers&following/presentation/views/widgets/follow_list_view_item.dart
          Spacer(),
          SvgPicture.asset(
            Assets.iconsDots,
            color: Constants.darkSecondryColor,
          ),
        ],
      ),
    );
  }
}
