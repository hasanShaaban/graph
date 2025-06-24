import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/appAssets.dart';
import '../../../../core/utils/constants.dart';

import '../../../follow/presentation/views/widgets/custom_app_bar.dart';
import 'widget/group_page_drop_down_sec.dart';
import 'widget/list_view_item.dart';
import 'widget/rate_row.dart';
import '../../../../generated/l10n.dart';

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
