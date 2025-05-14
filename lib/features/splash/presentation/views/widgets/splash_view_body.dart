import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/features/auth/presentation/views/login_view.dart';
import 'package:graph/features/onboarding/data/repos/on_boarding_local_data_source.dart';
import 'package:graph/features/onboarding/presentation/views/on_boarding_view.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {

  final OnBoardingLocalDataSource onBoardingLocalDataSource = getIt<OnBoardingLocalDataSource>();
  Future<void> checkOnBoardingSeem() async{
    final onBoardingSeen = await onBoardingLocalDataSource.isOnBoardingSeen();
    if(onBoardingSeen){
      Navigator.pushReplacementNamed(context, LoginView.name);
    }else{
      Navigator.pushReplacementNamed(context, OnBoardingView.name);
    }
  }

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
            () => checkOnBoardingSeem()
          );
        },
      ),
    );
  }
}