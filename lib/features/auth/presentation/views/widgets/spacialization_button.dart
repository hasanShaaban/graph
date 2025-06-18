import 'package:flutter/material.dart';
import 'package:graph/core/services/providers/user_info_provider.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class SpacializationButton extends StatelessWidget {
  const SpacializationButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserInfoProvider>(context);
    final selected = userProvider.spacialization;
    final lang = S.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            userProvider.setSpacialization(newSpacialization: lang.softwareEng);
          },
          child: AnimatedContainerWidget(
            whatSelect: selected == lang.softwareEng,
            text: lang.softwareEng,
            icon: Assets.iconsCodeWindow,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            userProvider.setSpacialization(newSpacialization: lang.ai);
          },
          child: AnimatedContainerWidget(
            whatSelect: selected == lang.ai,
            text: lang.ai,
            icon: Assets.iconsMicrochipAi,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            userProvider.setSpacialization(newSpacialization: lang.networks);
          },
          child: AnimatedContainerWidget(
            whatSelect: selected == lang.networks,
            text: lang.networks,
            icon: Assets.iconsDataModel,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
      ],
    );
  }
}
