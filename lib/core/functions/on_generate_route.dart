import 'package:flutter/material.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_company_name_section.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_company_picture_sec.dart';
import 'package:graph/features/follow/presentation/views/followers_view.dart';
import 'package:graph/features/follow/presentation/views/following_view.dart';
import 'package:graph/core/widgets/posts/public_post_widgets/image_viewer.dart';

import 'package:graph/features/followers&following/presentation/views/follow_view.dart';
import 'package:graph/features/groups/presentation/views/group_management_view.dart';
import 'package:graph/features/groups/presentation/views/my_group_view.dart';
import 'package:graph/features/main/presentation/views/main_page.dart';
import 'package:graph/features/post_details/presentation/view/post_details_view.dart';
import 'package:graph/features/profile/presentation/views/edit_profile_view.dart';
import 'package:graph/features/profile/presentation/views/profile_view.dart';
import 'package:graph/features/profile/presentation/views/widgets/creat_post_page.dart';
import 'package:graph/features/profile/presentation/views/widgets/cvpdf.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_find_friends.dart';
import '../../features/auth/presentation/views/widgets/signup_final_touches_sec.dart';
import '../../features/auth/presentation/views/widgets/signup_verification_section.dart';
import '../../features/groups/presentation/views/groups_management_view.dart';

import '../../features/auth/presentation/views/login_view.dart';
import '../../features/auth/presentation/views/sign_up_view.dart';
import '../../features/auth/presentation/views/widgets/signup_birthday_gender.dart';
import '../../features/auth/presentation/views/widgets/signup_collage_stage_section.dart';
import '../../features/auth/presentation/views/widgets/signup_path_section.dart';
import '../../features/auth/presentation/views/widgets/signup_profile_picture_section.dart';
import '../../features/auth/presentation/views/widgets/signup_role_section.dart';
import '../../features/auth/presentation/views/widgets/signup_username_section.dart';
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
      return MaterialPageRoute(
        builder: (context) => SignupUsernameSection(),
        settings: settings,
      );
    case SignupBirthdayGender.name:
      return MaterialPageRoute(
        builder: (context) => SignupBirthdayGender(),
        settings: settings,
      );

    // case SignupPathSection.name:
    //   return MaterialPageRoute(
    //     builder:
    //         (context) => SignupPathSection(
    //           //onNext: (bool isStrudent) {}
    //         ),
      //   settings: settings,
      // );
    case SignupRoleSection.name:
      return MaterialPageRoute(
        builder: (context) => SignupRoleSection(),
        settings: settings,
      );
    case SignupCollageStageSection.name:
      return MaterialPageRoute(
        builder: (context) => SignupCollageStageSection(),
        settings: settings,
      );
    case SignupProfilePictureSection.name:
      return MaterialPageRoute(
        builder: (context) => const SignupProfilePictureSection(),
        settings: settings,
      );
    case SignupVerificationSection.name:
      return MaterialPageRoute(
        builder: (context) => const SignupVerificationSection(),
        settings: settings,
      );
    case FollowView.name:
      final args = settings.arguments;
      if (args == null || args is! Map<String, dynamic>) {
        return MaterialPageRoute(
          builder: (context) => FollowView(type: 'defaultType'),
        );
      } else {
        final Map<String, dynamic> arguments = args;
        return MaterialPageRoute(
          builder: (context) => FollowView(type: arguments['type']),
        );
      }

    case MyGroupView.name:
      return MaterialPageRoute(builder: (context) => const MyGroupView());
    case GroupManagementView.name:
      return MaterialPageRoute(
        builder: (context) => const GroupManagementView(),
      );
    case ProfileView.name:
      return MaterialPageRoute(builder: (context) => const ProfileView());
    case CVPDF.name:
      return MaterialPageRoute(builder: (context) => const CVPDF());
    case EditProfileView.name:
      return MaterialPageRoute(builder: (context) => const EditProfileView());
    case GroupsManagementView.name:
      return MaterialPageRoute(
        builder: (context) => const GroupsManagementView(),
      );
    case SignupFinalTouchesSec.name:
      return MaterialPageRoute(
        builder: (context) => const SignupFinalTouchesSec(),
      );
    case SignupFindFriends.name:
      return MaterialPageRoute(builder: (context) => const SignupFindFriends());
    case MainPage.name:
      return MaterialPageRoute(builder: (context) => const MainPage());
    case PostDetailsView.name:
      return MaterialPageRoute(builder: (context) => const PostDetailsView());
    case ImageViewer.name:
      final args = settings.arguments as Map<String, dynamic>;
      return MaterialPageRoute(
        builder:
            (context) => ImageViewer(
              imageUrls: args['imageUrls'],
              initialIndex: args['initialIndex'],
            ),
      );
    case CreatPostPage.name:
      return MaterialPageRoute(builder: (context) => CreatPostPage());

    case SignupCompanyNameSection.name:
      return MaterialPageRoute(
        builder: (context) => SignupCompanyNameSection(),
      );
    case SignupCompanyPictureSec.name:
      return MaterialPageRoute(
        builder: (context) => SignupCompanyPictureSec(),
        settings: settings,
      );

    // case SettingsView.name:
    //   return MaterialPageRoute(builder: (context) => SettingsView());
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
