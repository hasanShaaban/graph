import 'package:flutter/material.dart';
import 'widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const name = 'OnBoardingView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: OnBoardingViewBody()));
  }
}

