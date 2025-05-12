import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/features/onboarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  bool opacityEffect = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), (){
      setState(() {
        opacityEffect = true;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: opacityEffect? 1 : 0 ,
        duration: const Duration(milliseconds: 1500),
        child: SvgPicture.asset(Assets.iconsAppLogo),
        onEnd: () {
          Future.delayed(
            const Duration(seconds: 1),
            () {
              Navigator.pushReplacementNamed(context, OnBoardingView.name);
            }
          );
        },
      ),
    );
  }
}