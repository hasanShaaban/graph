import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/appAssets.dart';
import '../../../../../../core/utils/app_text_style.dart';
import '../../../../../../core/utils/constants.dart';
import 'ads_page.dart';
import 'groups_page.dart';
import 'home_page_app_bar.dart';
import 'job_page.dart';
import 'public_page.dart';
import '../../../../../../generated/l10n.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({
    super.key,
    required this.width,
    required this.height,
    required this.lang,
  });
  final double width, height;
  final S lang;

  @override
  State<HomePageBody> createState() => _HomePageBodyState();
}

class _HomePageBodyState extends State<HomePageBody>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  final tabs = [
    {'icon': Assets.iconsEarthEuropa, 'label': 'Public'},
    {'icon': Assets.iconsCoworking, 'label': 'Groups'},
    {'icon': Assets.iconsEmployeeMan, 'label': 'Jobs'},
    {'icon': Assets.iconsPollH, 'label': 'Ads'},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener(() {
      if (_tabController.index != _currentIndex && mounted) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder:
          (context, innerBoxIsScrolled) => [
            HomePageAppBar(height: widget.height, width: widget.width),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverTabBarDelegate(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(tabs.length, (index) {
                    final isSelected = _currentIndex == index;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _currentIndex = index;
                        });
                        log(
                          '$isSelected, index = $index, controller endex = ${_tabController.index}',
                        );
                        _tabController.animateTo(index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(tabs[index]['icon']!),
                                const SizedBox(width: 5),
                                if (isSelected)
                                  AnimatedScale(
                                    duration: Duration(milliseconds: 200),
                                    scale: isSelected ? 1 : 0,
                                    child: Text(
                                      tabs[index]['label']!,
                                      style: AppTextStyle.cairoSemiBold20
                                          .copyWith(
                                            height: 1,
                                            color: Constants.lightPrimaryColor,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          AnimatedContainer(
                            curve: Curves.fastOutSlowIn,
                            duration: Duration(milliseconds: 200),
                            height: 3,
                            width: isSelected ? 70 : 0,
                            decoration: BoxDecoration(
                              color: Constants.lightPrimaryColor,
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: [
          PublicPage(),
          GroupsPage(),
          JobPage(),
          AdsPage(),
        ],
      ),
    );
  }
}

class _SliverTabBarDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;

  _SliverTabBarDelegate(this.child);

  @override
  double get minExtent => 56;

  @override
  double get maxExtent => 56;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(color: Constants.primaryColor, child: child);
  }

  @override
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) {
    return oldDelegate.child != child;
  }
}
