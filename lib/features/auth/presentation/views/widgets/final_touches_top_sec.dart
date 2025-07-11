
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';
import 'auth_app_bar.dart';
import '../../../../../generated/l10n.dart';

class FinalTouchesTopSection extends StatelessWidget {
  const FinalTouchesTopSection({super.key, required this.lang});

  final S lang;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        //Container(height: 100),
        AuthAppBar(
          text1: lang.addFinalTouches,
          text2: '',
          onPressed: () {
            Navigator.pop(context);
          },
        ),

        Container(
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
                    border: Border.all(color: Constants.primaryColor, width: 5),
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
                      color: Constants.primaryColor,
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
        ),
      ],
    );
  }
}
