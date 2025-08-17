import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/appAssets.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../profile/presentation/views/profile_view.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      elevation: 0,
      floating: true,
      snap: true,
      titleSpacing: 20,
      collapsedHeight: height * 80 / 915,
      backgroundColor: Constants2.lightPrimaryColor(context),
      title: Padding(
        padding: EdgeInsets.only(top: 10),
        child: SvgPicture.asset(Assets.iconsMainLogo, width: width * 105 / 412),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20, top: 10),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileView.name);
                },
                icon: SvgPicture.asset(
                  Assets.iconsCircleUser,
                  color: Constants.primaryColor,
                ),
              ),
              SizedBox(width: 20),
              SvgPicture.asset(Assets.iconsChat),
            ],
          ),
        ),
      ],
    );
  }
}
