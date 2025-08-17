import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/constants.dart';

class MainFloatingActionButton extends StatelessWidget {
  const MainFloatingActionButton({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 50 / 412,
      height: width * 50 / 412,
      decoration: BoxDecoration(
        boxShadow:  [BoxShadow(color: Constants.darkPrimaryColor.withOpacity(0.3), blurRadius: 6, offset: Offset(0, -3))],
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [Constants.primaryColor, Constants.thirdColor],
          end: Alignment.bottomLeft,
          begin: Alignment.topRight,
        ),
      ),
      child: Center(
        child: SvgPicture.asset(
          Assets.iconsNotesMedical,
          color: Constants.lightPrimaryColor,
        ),
      ),
    );
  }
}
