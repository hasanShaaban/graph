
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';

class CircularProfilePicture extends StatelessWidget {
  const CircularProfilePicture({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            left:
                width / 2 - 90, // 90= 180/2 , width/2 to center the widget.
            top: height * 0.14, // (95 / 924) , //0.14, //(150 / 924),
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Constants2.primaryColor(context),
                  width: 5,
                ),
              ),
              child: CircleAvatar(
                radius: 30,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                  'https://plus.unsplash.com/premium_photo-1663054688278-ebf09d654d33?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fGdpcmwlMjBmYWNlfGVufDB8fDB8fHww',
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: width * (134 / 412),
            child: GestureDetector(
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Constants2.primaryColor(context),
                ),
                child: SvgPicture.asset(
                  Assets.iconsPenCircle,
                  color: Colors.white,
                  width: 11,
                  height: 11,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
