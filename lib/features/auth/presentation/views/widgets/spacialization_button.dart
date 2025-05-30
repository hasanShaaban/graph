import 'package:flutter/material.dart';
import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class SpacializationButton extends StatefulWidget {
  const SpacializationButton({super.key});

  @override
  State<SpacializationButton> createState() => _SacializationButtonState();
}

class _SacializationButtonState extends State<SpacializationButton> {
  //Software Engineering
  bool se = false;
  //Artificial Inteligence
  bool ai = false;
  //Network and OS
  bool no = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              se = true;
              ai = false;
              no = false;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: se,
            text: 'Software Engineering',
            icon: Assets.iconsCodeWindow,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              se = false;
              ai = true;
              no = false;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: ai,
            text: 'Artificial Inteligence',
            icon: Assets.iconsMicrochipAi,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              se = false;
              ai = false;
              no = true;
            });
          },
          child: AnimatedContainerWidget(
            whatSelect: no,
            text: 'Network and OS',
            icon: Assets.iconsDataModel,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
      ],
    );
  }
}
