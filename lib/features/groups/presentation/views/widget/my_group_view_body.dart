import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/custom_stateless_appbar.dart';
import 'package:graph/core/widgets/major_and_year_dropdown_buttons_section.dart';
import 'package:graph/features/groups/presentation/views/widget/group_management_button.dart';
import 'package:graph/features/groups/presentation/views/widget/list_view_item.dart';
import 'package:graph/features/groups/presentation/views/widget/rate_row.dart';
import 'package:graph/generated/l10n.dart';

class MyGroupViewBody extends StatelessWidget {
  const MyGroupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CustomStatelessAppbar(lang: lang, title: lang.myGroups),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: MajorAndYearDropdownButtonsSection(height: height),
                  ),
                  SizedBox(width: 10),
                  GroupManagementButton(width: width, height: height),
                ],
              ),
              SizedBox(height: 10),
              RateButton(),
              SizedBox(height: 10),
              ...List.generate(
                3,
                (index) => ListViewItem(height: height, width: width),
              ),
              Divider(thickness: 1, color: Constants.darkPrimaryColor),
              RateRow(),
            ],
          ),
        ),
      ],
    );
  }
}

class RateButton extends StatefulWidget {
  const RateButton({super.key});

  @override
  State<RateButton> createState() => _RateButtonState();
}

class _RateButtonState extends State<RateButton> {
  String icon = Assets.iconsStarRateBoder;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (icon == Assets.iconsStarRateBoder) {
            icon = Assets.iconsStarRate;
          } else {
            icon = Assets.iconsStarRateBoder;
          }
        });
      },
      child: SizedBox(
        width: 26,
        height: 26,
        child: Center(child: SvgPicture.asset(icon)),
      ),
    );
  }
}
