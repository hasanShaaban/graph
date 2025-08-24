import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/features/auth/domain/repos/auth_repo.dart';
import 'package:graph/features/create_post/data/repos/create_post_repo_iml.dart';
import 'package:graph/features/create_post/domain/repos/create_post_repo.dart';
import 'package:graph/features/main/data/repos/main_repo_impl.dart';
import 'package:graph/features/main/domain/repos/main_repo.dart';
import 'package:graph/features/profile/data/repos/profile_repo_impl.dart';
import 'package:graph/features/profile/domain/repos/profile_repo.dart';
import 'package:graph/features/auth/data/repos/auth_repo_impl.dart';
import '../../features/main/data/local_data_source/settings_local_data_source.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';

import '../../features/onboarding/data/repos/on_boarding_local_data_source.dart';
import 'local_data_base/hive_data_base_service.dart';
import 'local_data_base/local_data_base_service.dart';
import 'sources/langeage_data_source.dart';

final getIt = GetIt.instance;

/// Registers all the services needed by the application in the [GetIt] service
/// locator. This function should be called before calling [runApp] to ensure
/// that all services are registered and ready to be used.
void setupGetit() {
  //hive data base service
  getIt.registerSingleton<LocalDataBaseService>(HiveDataBaseService());

  //Dio
  getIt.registerSingleton<Dio>(Dio());

  //onboarding local data source
  getIt.registerSingleton<OnBoardingLocalDataSource>(
    OnBoardingLocalDataSource(getIt<LocalDataBaseService>()),
  );

  //Language local data source
  getIt.registerSingleton<LangeageDataSource>(
    LangeageDataSource(getIt<LocalDataBaseService>()),
  );

  //settings local data source
  getIt.registerSingleton<SettingsLocalDataSource>(
    SettingsLocalDataSource(getIt<LocalDataBaseService>()),
  );

  //auth local data source
  getIt.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSource(getIt<LocalDataBaseService>()),
  );

  //Secured api service
  getIt.registerSingleton<SecureApiService>(
    SecureApiService(getIt<Dio>(), getIt<AuthLocalDataSource>()),
  );
  //Public api service
  getIt.registerSingleton<PublicApiService>(PublicApiService(getIt<Dio>()));

  //Profile repo
  getIt.registerSingleton<ProfileRepo>(
    ProfileRepoImpl(getIt<SecureApiService>(), getIt<AuthLocalDataSource>()),
  );

  getIt.registerSingleton<MainRepo>(MainRepoImpl(getIt<SecureApiService>()));

  getIt.registerSingleton<AuthRepo>(AuthRepoImpl(getIt<SecureApiService>()));
  getIt.registerSingleton<CreatePostRepo>(
    CreatePostRepoIml(getIt<SecureApiService>(), getIt<AuthLocalDataSource>()),
  );

  //repo iml data source
  //getIt.registerSingleton<AuthRepoImpl>(AuthRepoImpl(PublicApiService(Dio())));
  //Profile repo
  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImpl(getIt<SecureApiService>(), getIt<AuthLocalDataSource>()),
  // );
}
