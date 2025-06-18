import 'package:flutter/material.dart';
import 'package:graph/features/groups/presentation/views/groups_management_view.dart';
import 'package:graph/features/groups/presentation/views/my_group_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/widgets/signup_birthday_gender.dart';
import '../../features/auth/presentation/views/widgets/signup_collage_stage_section.dart';
import '../../features/auth/presentation/views/widgets/signup_path_section.dart';
import '../../features/auth/presentation/views/widgets/signup_profile_picture_section.dart';
import '../../features/auth/presentation/views/widgets/signup_role_section.dart';
import '../../features/auth/presentation/views/widgets/signup_username_section.dart';
import '../../features/follow/presentation/views/followers_view.dart';
import '../../features/follow/presentation/views/following_view.dart';
import '../../features/onboarding/presentation/views/on_boarding_view.dart';
import '../../features/splash/presentation/views/splash_view.dart';

/// Returns a route based on [settings.name].
///
/// The supported routes are:
///
/// - [SplashView.name]
/// - [OnBoardingView.name]
/// - [LoginView.name]
///
/// If [settings.name] is not recognized, a default route is returned that
/// displays an empty [Scaffold].
Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case SplashView.name:
      return MaterialPageRoute(builder: (context) => const SplashView());
    case OnBoardingView.name:
      return MaterialPageRoute(builder: (context) => const OnBoardingView());
    case LoginView.name:
      return MaterialPageRoute(builder: (context) => const LoginView());
    case SignUpView.name:
      return MaterialPageRoute(builder: (context) => const SignUpView());
    case SignupUsernameSection.name:
      return MaterialPageRoute(builder: (context) => SignupUsernameSection());
    case SignupBirthdayGender.name:
     

      return MaterialPageRoute(builder: (context) => SignupBirthdayGender());

    case SignupPathSection.name:
      return MaterialPageRoute(
        builder:
            (context) => SignupPathSection(
              //onNext: (bool isStrudent) {}
            ),
      );
    case SignupRoleSection.name:
      return MaterialPageRoute(builder: (context) => SignupRoleSection());
    case SignupCollageStageSection.name:
      return MaterialPageRoute(
        builder: (context) => SignupCollageStageSection(),
      );
    case SignupProfilePictureSection.name:
      return MaterialPageRoute(
        builder: (context) => const SignupProfilePictureSection(),
      );
    case FollowersView.name:
      return MaterialPageRoute(builder: (context) => const FollowersView());
    case FollowingView.name:
      return MaterialPageRoute(builder: (context) => const FollowingView());
    case MyGroupView.name:
      return MaterialPageRoute(builder: (context) => const MyGroupView());
    case GroupsManagementView.name:
      return MaterialPageRoute(
        builder: (context) => const GroupsManagementView(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
