import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/appAssets.dart';
import '../../../../../../core/utils/constants.dart';
import '../../../../../profile/presentation/views/profile_view.dart';

import 'package:graph/generated/l10n.dart';

class HomePageAppBar extends StatelessWidget {
  const HomePageAppBar({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
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
          padding: EdgeInsets.only(
            right: lang.lang == 'en' ? 20 : 0,
            left: lang.lang == 'ar' ? 20 : 0,
            top: 10,
          ),
          child: Row(
            children: [
              SvgPicture.asset(Assets.iconsSearch,color: Constants2.darkPrimaryColor(context),),
              SizedBox(width: 10),
              IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileView.name);
                },
                icon: CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(Assets.imagesProfileImage),
                ),
              ),
              SizedBox(width: 10),
              SvgPicture.asset(Assets.iconsChat),
              
            ],
          ),
        ),
      ],
    );
  }
}
