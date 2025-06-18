import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';

import 'package:graph/features/follow/presentation/views/widgets/custom_app_bar.dart';
import 'package:graph/features/groups/presentation/views/widget/group_page_drop_down_sec.dart';
import 'package:graph/features/groups/presentation/views/widget/list_view_item.dart';
import 'package:graph/features/groups/presentation/views/widget/rate_row.dart';
import 'package:graph/generated/l10n.dart';

class MyGroupView extends StatelessWidget {
  const MyGroupView({super.key});
  static const name = 'myGroups';
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(text1: lang.myGroups, onPressed: () {}),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                GroupPageDropDownSec(),
                SizedBox(height: 28),
                SvgPicture.asset(Assets.iconsStarRate),
                SizedBox(height: 5),
                ...List.generate(3, (index) => ListViewItem()),
                Divider(thickness: 1, color: Constants.darkPrimaryColor),
                RateRow(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
