import 'package:flutter/material.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import 'package:lottie/lottie.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key, required this.text, required this.image, required this.width});
  final String text;
  final String image;
  final double width;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 61),
        LottieBuilder.asset(image, width: width,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22),
          child: Text(
            textAlign: TextAlign.center,
            text,
            style: AppTextStyle.cairoSemiBold20
                .copyWith(color: Constants.darkPrimaryColor),
          ),
        )
      ],
    );
  }
}