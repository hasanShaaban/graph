import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/main/presentation/views/widgets/home/home_page_app_bar.dart';
import 'package:graph/generated/l10n.dart';

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
      if (!_tabController.indexIsChanging) {
        setState(() {});
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
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: List.generate(tabs.length, (index) {
                      final isSelected = _tabController.index == index;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            log(
                              '$isSelected, index = $index, controller endex = ${_tabController.index}',
                            );
                            _tabController.animateTo(index);
                          });
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(tabs[index]['icon']!),
                                if (isSelected)
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(
                                      tabs[index]['label']!,
                                      style: AppTextStyle.cairoSemiBold20
                                          .copyWith(
                                            color: Constants.lightPrimaryColor,
                                          ),
                                    ),
                                  ),
                              ],
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 200),
                              height: 3,
                              width: isSelected ? 75 : 0,
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
            ),
          ],
      body: TabBarView(
        controller: _tabController,
        children: [
          Center(child: Text('Public Posts')),
          Center(child: Text('Groups Posts')),
          Center(child: Text('Jobs')),
          Center(child: Text('Ads')),
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
  bool shouldRebuild(covariant _SliverTabBarDelegate oldDelegate) => false;
}
