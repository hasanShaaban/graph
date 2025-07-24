import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/generated/l10n.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class MainNavigationBar extends StatelessWidget {
  const MainNavigationBar({
    super.key,
    required this.lang,
    required this.onTap,
    required this.selected,
  });
  final S lang;
  final ValueChanged<int> onTap;
  final int selected;

  @override
  Widget build(BuildContext context) {
    return StylishBottomBar(
      notchStyle: NotchStyle.circle,
      currentIndex: selected,
      elevation: 20,
      hasNotch: true,
      backgroundColor: Constants.lightPrimaryColor,
      fabLocation: StylishBarFabLocation.end,
      items: [
        bottomTabBuilder(icon: Assets.iconsHome, title: 'Home'),
        bottomTabBuilder(
          icon: Assets.iconsNotifecationBell,
          title: 'Notifications',
        ),
        bottomTabBuilder(icon: Assets.iconsSettings, title: 'Settings'),
        bottomTabBuilder(icon: Assets.iconsSearch, title: 'Search'),
      ],
      option: BubbleBarOptions(
        iconSize: 20,
        inkEffect: true,
        inkColor: Constants.lightSecondryColor,
        barStyle: BubbleBarStyle.horizontal,
        bubbleFillStyle: BubbleFillStyle.fill,
      ),
      onTap: onTap,
    );
  }
}

BottomBarItem bottomTabBuilder({required String icon, required String title}) {
  return BottomBarItem(
    backgroundColor: Constants.lightSecondryColor,
    icon: SvgPicture.asset(icon, color: Constants.darkSecondryColor),
    selectedIcon: SvgPicture.asset(icon, color: Constants.primaryColor),
    selectedColor: Constants.primaryColor,
    unSelectedColor: Constants.darkSecondryColor,
    title: Text(
      title,
      style: AppTextStyle.cairoSemiBold16.copyWith(
        color: Constants.primaryColor,
      ),
    ),
  );
}
