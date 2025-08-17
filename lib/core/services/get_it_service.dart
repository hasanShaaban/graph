import 'package:get_it/get_it.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
import 'package:graph/features/main/data/local_data_source/settings_local_data_source.dart';

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

  //onboarding local data source
  getIt.registerSingleton<OnBoardingLocalDataSource>(
    OnBoardingLocalDataSource(getIt<LocalDataBaseService>()),
  );

  //Language local data source
  getIt.registerSingleton<LangeageDataSource>(
    LangeageDataSource(getIt<LocalDataBaseService>()),
  );

  getIt.registerSingleton<SettingsLocalDataSource>(
    SettingsLocalDataSource(getIt<LocalDataBaseService>()),
  );

  //auth local data source
  getIt.registerSingleton<AuthLocalDataSource>(
    AuthLocalDataSource(getIt<LocalDataBaseService>()),
  );
}
