import 'package:flutter/material.dart';
import 'package:graph/features/splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});
  static const name = 'splashView';
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(body: SafeArea(child: SplashViewBody())));
  }
}


