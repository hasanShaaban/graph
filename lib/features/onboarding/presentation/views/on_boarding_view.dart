import 'package:flutter/material.dart';
import 'package:graph/features/onboarding/presentation/views/widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatelessWidget {
  const OnBoardingView({super.key});
  static const name = 'OnBoardingView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: OnBoardingViewBody()));
  }
}

