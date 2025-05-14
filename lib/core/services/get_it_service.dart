import 'package:get_it/get_it.dart';
import 'package:graph/core/services/local_data_base/hive_data_base_service.dart';
import 'package:graph/core/services/local_data_base/local_data_base_service.dart';
import 'package:graph/features/onboarding/data/repos/on_boarding_local_data_source.dart';

final getIt = GetIt.instance;

void setupGetit() {
  //hive data base service
  getIt.registerSingleton<LocalDataBaseService>(HiveDataBaseService());

  //onboarding local data source
  getIt.registerSingleton<OnBoardingLocalDataSource>(
    OnBoardingLocalDataSource(getIt<LocalDataBaseService>()),
  );
}
