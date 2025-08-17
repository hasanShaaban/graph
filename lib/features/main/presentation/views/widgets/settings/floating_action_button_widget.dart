import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/utils/appAssets.dart';

class FloatngActionButtonWidget extends StatelessWidget {
  const FloatngActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFFC0EFE0),
      onPressed: () {},
      child: SvgPicture.asset(Assets.iconsNotesMedical, color: Colors.black),
    );
  }
}
