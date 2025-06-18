import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/auth/data/repos/auth_repo_impl.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:graph/features/auth/presentation/manager/signup_cubit/signup_cubit.dart';
import 'package:provider/single_child_widget.dart';

ApiService apiService = ApiService(Dio());

final AuthRepo authRepo = AuthRepoImpl(apiService);
List<SingleChildWidget> providers = [
  BlocProvider(create: (context) => SignupCubit(authRepo)),
];
