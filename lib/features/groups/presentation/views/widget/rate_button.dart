import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';

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