
import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';

class VacancyButton extends StatelessWidget {
  const VacancyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 7),
      child: GestureDetector(
        child: Container(
          width: MediaQuery.of(context).size.width * 204 / 412,
          height: 42,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Constants.lightSecondryColor,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(4, 5),
                blurRadius: 5,
              ),
            ],
          ),
          child: Center(
            child: Text(
              'advertise a vacancy',
              style: AppTextStyle.cairoRegular14.copyWith(
                color: Constants.primaryColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}