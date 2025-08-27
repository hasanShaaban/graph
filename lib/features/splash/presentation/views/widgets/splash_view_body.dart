import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../auth/data/repos/auth_local_data_source.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../../main/presentation/manager/user_image_cubit/user_image_cubit.dart';
import '../../../../main/presentation/views/main_page.dart';
import '../../../../onboarding/data/repos/on_boarding_local_data_source.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/services/providers/local_provider.dart';
import '../../../../../core/services/sources/langeage_data_source.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../onboarding/presentation/views/on_boarding_view.dart';
import 'package:provider/provider.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  final LangeageDataSource langeageDataSource = getIt<LangeageDataSource>();
  final OnBoardingLocalDataSource onBoardingLocalDataSource =
      getIt<OnBoardingLocalDataSource>();
  final AuthLocalDataSource authLocalDataSource = getIt<AuthLocalDataSource>();

  bool opacityEffect = false;
  bool? isFirstTime;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _init(context));
  }

  Future<void> _init(BuildContext context) async {
    final languageSeen = await langeageDataSource.isLanguageSelected();
    final onBoardingSeen = await onBoardingLocalDataSource.isOnBoardingSeen();
    final rejestered = await authLocalDataSource.isRejestered();
    setState(() {
      isFirstTime = !languageSeen;
    });
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        opacityEffect = true;
      });
    });
    log(
      'languageSeen: $languageSeen, onBoardingSeen: $onBoardingSeen, rejestered: $rejestered',
    );
    if (languageSeen) {
      await Future.delayed(const Duration(seconds: 3));
      if (onBoardingSeen) {
        if (rejestered) {
          context.read<UserImageCubit>().getUserImage();
          Navigator.pushReplacementNamed(
            context,
            MainPage.name,
          ); // Assuming this exists
        } else {
          Navigator.pushReplacementNamed(
            context,
            LoginView.name,
          ); // Assuming this exists
        }
      } else {
        Navigator.pushReplacementNamed(
          context,
          OnBoardingView.name,
        ); // Assuming this exists
      }
    }
  }

  void _onLanguageSelected(String languageCode) async {
    await Provider.of<LocalProvider>(
      context,
      listen: false,
    ).setLocal(languageCode);
    if (context.mounted) {
      Navigator.pushReplacementNamed(
        context,
        OnBoardingView.name,
      ); // Assuming this exists
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedOpacity(
        opacity: opacityEffect ? 1 : 0,
        duration: const Duration(milliseconds: 1500),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(Assets.iconsAppLogo, height: 120),
            const SizedBox(height: 40),
            if (isFirstTime == true) ...[
              Text(
                'Choose your language:',
                style: AppTextStyle.cairoBold22.copyWith(
                  color: Constants2.darkPrimaryColor(context),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: Size(184, 55),
                ),
                onPressed: () => _onLanguageSelected('en'),
                child: const Text(
                  'English',
                  style: AppTextStyle.cairoSemiBold18,
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  minimumSize: Size(184, 55),
                ),
                onPressed: () => _onLanguageSelected('ar'),
                child: const Text('عربي', style: AppTextStyle.cairoSemiBold18),
              ),
              const Spacer(),
            ] else
              const Spacer(), // Add space if no buttons
          ],
        ),
      ),
    );
  }
}