import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/followers&following/domain/repo/follow_repo.dart';
import 'package:graph/features/followers&following/presentation/manager/cubit/friends_cubit.dart';
import 'package:graph/features/groups/domain/repos/groups_repo.dart';
import 'package:graph/features/groups/presentation/manager/project_cubit/project_cubit.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:graph/features/main/presentation/manager/user_image_cubit/user_image_cubit.dart';
import 'package:graph/features/profile/data/repos/profile_local_data_source.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';
import 'package:graph/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:graph/features/profile/presentation/manager/profile_posts/profile_posts_cubit.dart';
import 'features/auth/presentation/manager/company_cubit/company_cubit.dart';
import 'features/auth/presentation/manager/credintials_cubit/credintials_cubit.dart';
import 'features/auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
import 'features/auth/presentation/manager/role_cubit/role_cubit.dart';
import 'features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'core/services/api_service.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/domain/repos/auth_repo.dart';
import 'features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:provider/single_child_widget.dart';

PublicApiService apiService = PublicApiService(
  Dio(
    // BaseOptions(
    //   baseUrl: 'http://192.168.115.28:8000/api/',
    //   connectTimeout: const Duration(seconds: 5 * 6000),
    //   receiveTimeout: const Duration(seconds: 5 * 6000),
    //   sendTimeout: const Duration(seconds: 5 * 6000),
    //   headers: {
    //     'Content-Type': 'application/json',
    //     'Accept': 'application/json',
    //   },
    // ),
  ),
);
final ProfileLocalDataSource profileLocalDataSource =
    getIt<ProfileLocalDataSource>();
final AuthRepo authRepo = AuthRepoImpl(apiService);
List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => SignupCubit(authRepo)),
  BlocProvider(create: (context) => LoginCubit(authRepo)),
  BlocProvider(create: (context) => CredintialsCubit(authRepo)),
  BlocProvider(create: (context) => RoleCubit(authRepo)),
  BlocProvider(create: (context) => CompanyCubit(authRepo)),
  BlocProvider(create: (context) => FinalTouchesCubit(authRepo)),
  BlocProvider(create: (context) => ProfileCubit(getIt<ProfileRepo>())),
  BlocProvider(create: (context) => UserImageCubit(getIt<MainRepo>())),
  BlocProvider(create: (context) => FriendsCubit(getIt<FollowRepo>())),
  BlocProvider(create: (context) => ProjectCubit(getIt<GroupsRepo>())),
  BlocProvider(create: (context) => ProfilePostsCubit(getIt<ProfileRepo>())),
];


