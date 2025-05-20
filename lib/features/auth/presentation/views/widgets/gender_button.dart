import 'package:flutter/material.dart';

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
            text: 'Male',
            icon: Assets.iconsSmilingBoy,
            widthSelected: 150,
            widthNotSelected: 140,
          ),

          // child: AnimatedContainer(
          //   duration: Duration(microseconds: 300),
          //   width: selectMale ? 150 : 140,
          //   height: 55,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(15),
          //     color:
          //         selectMale
          //             ? Constants.primaryColor
          //             : Constants.darkSecondryColor,
          //     boxShadow:
          //         selectMale
          //             ? [
          //               BoxShadow(
          //                 color: Colors.black.withOpacity(0.5),

          //                 offset: Offset(4, 4), // اتجاه الظل
          //                 blurRadius: 20, // كم ينتشر الظل
          //               ),
          //             ]
          //             : [],
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(Icons.face),
          //       SizedBox(width: 4),
          //       Text('Male', style: AppTextStyle.cairoRegular20),
          //     ],
          //   ),
          // ),
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
            text: 'Femal',
            icon: Assets.iconsSmilingGirl,
            widthSelected: 150,
            widthNotSelected: 140,
          ),
        ),
      ],
    );
  }
}
