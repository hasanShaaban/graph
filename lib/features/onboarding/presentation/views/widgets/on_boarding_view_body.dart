import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/services/get_it_service.dart';
import '../../../../../core/utils/appAssets.dart';
import '../../../../../core/utils/app_text_style.dart';
import '../../../../../core/utils/constants.dart';
import '../../../../auth/presentation/views/login_view.dart';
import '../../../data/repos/on_boarding_local_data_source.dart';
import 'on_boarding_dots_indicator.dart';
import 'on_boarding_page.dart';

class OnBoardingViewBody extends StatefulWidget {
  const OnBoardingViewBody({super.key});

  @override
  State<OnBoardingViewBody> createState() => _OnBoardingViewBodyState();
}

class _OnBoardingViewBodyState extends State<OnBoardingViewBody> {
  final OnBoardingLocalDataSource onBoardingLocalDataSource =
      getIt<OnBoardingLocalDataSource>();

  void skipOnBoarding(context) async {
    await onBoardingLocalDataSource.setOnBoardingSeen();
    Navigator.pushReplacementNamed(context, LoginView.name);
  }

  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final lang = S.of(context);
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                Assets.iconsAppLogo,
                width: MediaQuery.of(context).size.width * 148 / 412,
              ),
              Spacer(),
              TextButton(
                style: TextButton.styleFrom(padding: EdgeInsets.zero),
                onPressed: () => skipOnBoarding(context),
                child: Text(
                  lang.skip,
                  style: AppTextStyle.cairoRegular16.copyWith(
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 500,
            width: MediaQuery.of(context).size.width,
            child: PageView(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              onPageChanged: (value) {
                setState(() {
                  _currentPage = value;
                });
              },
              children: [
                OnBoardingPage(
                  text: lang.onboarding1,
                  image: Assets.imagesOnboarding1,
                  width: 300,
                ),
                OnBoardingPage(
                  text: lang.onboarding2,
                  image: Assets.imagesOnboarding2,
                  width: 300,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 70),
                  child: OnBoardingPage(
                    text: lang.onboarding3,
                    image: Assets.imagesOnboarding3,
                    width: 400,
                  ),
                ),
              ],
            ),
          ),

          OnBoardingDotsIndecator(currentPage: _currentPage),
          Spacer(),
          Visibility(
            visible: _currentPage == 2,
            child: TextButton(
              style: TextButton.styleFrom(
                minimumSize: Size(double.infinity, 60),
                backgroundColor: Constants2.primaryColor(context),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onPressed: () => skipOnBoarding(context),
              child: Text(
                lang.begin,
                style: AppTextStyle.cairoBold22.copyWith(
                  color: Constants2.lightPrimaryColor(context),
                ),
              ),
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}


