import 'package:flutter/material.dart';
import 'package:graph/features/groups/presentation/views/widget/my_group_view_body.dart';

import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/appAssets.dart';
import '../../../../core/utils/constants.dart';
import '../../../../generated/l10n.dart';
import '../../../follow/presentation/views/widgets/custom_app_bar.dart';
import 'widget/group_page_drop_down_sec.dart';
import 'widget/list_view_item.dart';
import 'widget/rate_row.dart';

class MyGroupView extends StatelessWidget {
  const MyGroupView({super.key});
  static const name = 'myGroups';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: MyGroupViewBody()));
  }
}


