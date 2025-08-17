import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../../generated/l10n.dart';

class GroupVacancySection extends StatelessWidget {
  const GroupVacancySection({
    super.key,
    required this.width,
    required this.lang,
  });

  final double width;
  final S lang;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:
          lang.lang == 'en' ? Alignment.centerLeft : Alignment.centerRight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: width * 232 / 412,
            child: Text(
              lang.ifGroupIsNotCompleted,

              style: AppTextStyle.cairoRegular14.copyWith(
                color: Constants2.darkSecondaryColor(context),
                height: 1.3,
              ),
            ),
          ),
          SizedBox(height: 10),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
              backgroundColor: Constants2.lightSecondaryColor(context),
            ),
            onPressed: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  lang.advertiseAVacancy,
                  style: AppTextStyle.cairoRegular14.copyWith(
                    color: Constants2.primaryColor(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
