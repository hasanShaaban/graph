import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class BottomButtonContainer extends StatelessWidget {
  const BottomButtonContainer({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });
  final String text;
  final String icon;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width * 110 / 412,
        //width: 110,
        height: 35,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Constants2.primaryColor(context),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              color: Constants2.lightPrimaryColor(context),
            ),
            SizedBox(width: 7),
            Flexible(
              child: Text(
                text,
                style: AppTextStyle.cairoSemiBold14.copyWith(
                  color: Constants2.lightPrimaryColor(context),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
