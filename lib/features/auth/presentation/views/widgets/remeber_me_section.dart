import 'package:flutter/material.dart';
import '../../../../../generated/l10n.dart';

import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';

class RemeberMeSection extends StatefulWidget {
  const RemeberMeSection({super.key});

  @override
  State<RemeberMeSection> createState() => _RemeberMeSectionState();
}

class _RemeberMeSectionState extends State<RemeberMeSection> {
  bool checked = false;
  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              checked = !checked;
            });
          },
          child: Stack(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: 20,
                height: 20,
                decoration: BoxDecoration(
                  color: checked ? Constants.secondryColor : Colors.transparent,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Constants.secondryColor, width: 3),
                ),
              ),
              checked
                  ? Icon(
                    Icons.check,
                    color: Constants2.lightPrimaryColor(context),
                    size: 20,
                  )
                  : SizedBox(),
            ],
          ),
        ),
        SizedBox(width: 5),
        Text(
          lang.rememberMe,
          style: AppTextStyle.cairoRegular18.copyWith(
            color: Constants.secondryColor,
          ),
        ),
      ],
    );
  }
}
