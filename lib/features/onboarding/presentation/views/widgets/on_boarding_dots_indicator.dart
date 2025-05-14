import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';

class OnBoardingDotsIndecator extends StatelessWidget {
  const OnBoardingDotsIndecator({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  final int _currentPage;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 3,
      position: _currentPage.toDouble(),
      decorator: DotsDecorator(
        color: Constants.primaryColor,
        activeColor: Constants.primaryColor,
        size: const Size.square(10.0),
        activeSize: const Size(25.0, 10.0),
        activeShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0)),
      ),
    );
  }
}