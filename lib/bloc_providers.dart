import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/features/auth/presentation/manager/delete_profile_image_cubit/delete_profile_image_cubit.dart';
import 'package:graph/features/auth/presentation/manager/post_skills_cubit/post_skills_cubit.dart';
import 'package:graph/features/auth/presentation/manager/student_info_cubit/student_info_cubit.dart';
import 'features/auth/presentation/manager/company_cubit/company_cubit.dart';
import 'features/auth/presentation/manager/credintials_cubit/credintials_cubit.dart';
import 'features/auth/presentation/manager/final_touches_cubit/final_touches_cubit.dart';
import 'features/auth/presentation/manager/role_cubit/role_cubit.dart';
import 'features/auth/presentation/manager/login_cubit/login_cubit.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:provider/single_child_widget.dart';

// ApiService apiService = ApiService(
//   Dio(

//   ),
// );

// final AuthRepo authRepo = AuthRepoImpl(apiService);
List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => SignupCubit(getIt.get<AuthRepoImpl>())),
  BlocProvider(create: (context) => LoginCubit(getIt.get<AuthRepoImpl>())),
  BlocProvider(
    create: (context) => CredintialsCubit(getIt.get<AuthRepoImpl>()),
  ),
  BlocProvider(create: (context) => RoleCubit(getIt.get<AuthRepoImpl>())),
  BlocProvider(create: (context) => CompanyCubit(getIt.get<AuthRepoImpl>())),
  BlocProvider(
    create: (context) => FinalTouchesCubit(getIt.get<AuthRepoImpl>()),
  ),
  BlocProvider(
    create: (context) => DeleteProfileImageCubit(getIt.get<AuthRepoImpl>()),
  ),
  BlocProvider(
    create: (context) => StudentInfoCubit(getIt.get<AuthRepoImpl>()),
  ),
  BlocProvider(create: (context) => PostSkillsCubit(getIt.get<AuthRepoImpl>())),
];
