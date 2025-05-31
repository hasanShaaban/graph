import 'package:flutter/material.dart';
import 'package:graph/generated/l10n.dart';

import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({super.key});

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  bool selectMale = false;
  bool selectFeMale = false;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              selectMale = true;
              selectFeMale = false;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: selectMale,
            text: lang.male,
            icon: Assets.iconsSmilingBoy,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
        SizedBox(width: 8),
        GestureDetector(
          onTap: () {
            setState(() {
              selectFeMale = true;
              selectMale = false;
            });
          },

          child: AnimatedContainerWidget(
            whatSelect: selectFeMale,
            text: lang.female,
            icon: Assets.iconsSmilingGirl,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
      ],
    );
  }
}
