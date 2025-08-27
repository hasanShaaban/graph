import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/auth/presentation/manager/staff_identity_cubit/staff_identity_cubit.dart';
import 'package:graph/features/auth/presentation/manager/verfiy_cubit/verification_cubit_cubit.dart';
import 'package:graph/features/main/presentation/manager/change_password_cubit/change_password_cubit.dart';
import 'package:graph/features/main/presentation/manager/logout_cubit/logout_cubit.dart';

import 'core/services/api_service.dart';
import 'core/services/get_it_service.dart';
import 'features/auth/domain/repos/auth_repo.dart';
import 'features/auth/presentation/manager/get_skills_cubit/get_skills_cubit.dart';

import 'features/auth/presentation/manager/staff_signup_cubit/staff_signup_cubit.dart';
import 'features/create_post/domain/repos/create_post_repo.dart';
import 'features/create_post/presentation/manager/get_all_project_cubit/get_all_project_cubit.dart';
import 'features/create_post/presentation/manager/hashtag_search_cubit/hashtag_search_cubit.dart';
import 'features/create_post/presentation/manager/post_new_post_cubit/post_new_post_cubit.dart';
import 'features/create_post/presentation/manager/search_cubit/search_cubit.dart';
import 'features/main/domain/repos/main_repo.dart';
import 'features/main/presentation/manager/user_image_cubit/user_image_cubit.dart';
import 'features/profile/domain/repos/profile_repo.dart';
import 'features/profile/presentation/manager/profile/profile_cubit.dart';
import 'features/auth/presentation/manager/delete_profile_image_cubit/delete_profile_image_cubit.dart';
import 'features/auth/presentation/manager/post_skills_cubit/post_skills_cubit.dart';
import 'features/auth/presentation/manager/student_info_cubit/student_info_cubit.dart';
import 'features/auth/presentation/manager/company_cubit/company_cubit.dart';
import 'features/auth/presentation/manager/credintials_cubit/credintials_cubit.dart';
import 'features/auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
import 'features/auth/presentation/manager/role_cubit/role_cubit.dart';
import 'features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:provider/single_child_widget.dart';

PublicApiService apiService = PublicApiService(Dio());

final AuthRepo authRepo = AuthRepoImpl(getIt<SecureApiService>());
List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => SignupCubit(authRepo)),
  BlocProvider(create: (context) => LoginCubit(authRepo)),
  BlocProvider(create: (context) => CredintialsCubit(authRepo)),
  BlocProvider(create: (context) => RoleCubit(authRepo)),
  BlocProvider(create: (context) => CompanyCubit(authRepo)),
  BlocProvider(create: (context) => StaffSignupCubit(authRepo)),
  BlocProvider(create: (context) => StaffIdentityCubit(authRepo)),
  BlocProvider(create: (context) => VerificationCubit(authRepo)),
  BlocProvider(create: (context) => FinalTouchesCubit(authRepo)),
  BlocProvider(create: (context) => DeleteProfileImageCubit(authRepo)),
  BlocProvider(create: (context) => StudentInfoCubit(authRepo)),
  BlocProvider(create: (context) => PostSkillsCubit(authRepo)),
  BlocProvider(create: (context) => GetSkillsCubit(authRepo)),
  BlocProvider(create: (context) => ProfileCubit(getIt<ProfileRepo>())),
  BlocProvider(create: (context) => UserImageCubit(getIt<MainRepo>())),
  BlocProvider(create: (context) => ChangePasswordCubit(getIt<MainRepo>())),
    BlocProvider(create: (context) => LogoutCubit(getIt<MainRepo>())),
  BlocProvider(create: (context) => PostNewPostCubit(getIt<CreatePostRepo>())),
  BlocProvider(
    create: (context) => GetAllProjectCubit(getIt<CreatePostRepo>()),
  ),
  BlocProvider(create: (context) => SearchCubit(getIt<CreatePostRepo>())),
  BlocProvider(
    create: (context) => HashtagSearchCubit(getIt<CreatePostRepo>()),
  ),
];
