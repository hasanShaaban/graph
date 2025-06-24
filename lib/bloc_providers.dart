import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/api_service.dart';
import 'features/auth/data/repos/auth_repo_impl.dart';
import 'features/auth/domain/repos/auth_repo.dart';
import 'features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:provider/single_child_widget.dart';

ApiService apiService = ApiService(Dio());

final AuthRepo authRepo = AuthRepoImpl(apiService);
List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => SignupCubit(authRepo)),
];
