import 'package:flutter/material.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class CustomBottomSheetContainer extends StatelessWidget {
  const CustomBottomSheetContainer({
    super.key,
    required this.lang,
    required this.widget,
  });

  final S lang;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(55),
          topRight: Radius.circular(55),
        ),
         color: Constants2.lightPrimaryColor(context),
        
      ),
      height: 600,
      child: widget,
    );
  }
}
