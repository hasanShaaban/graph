import '../../../../core/services/local_data_base/local_data_base_service.dart';
import '../../../../core/utils/hive_boxes.dart';

class SettingsLocalDataSource {
  final LocalDataBaseService localDataBaseService;
  SettingsLocalDataSource(this.localDataBaseService);

  Future<bool> isDarkMode() async {
    final darkMode = await localDataBaseService.getData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.theme,
    );
    return darkMode ?? false;
  }

  Future<void> setDarkMode(bool darkMode) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.theme,
      value: darkMode,
    );
  }
}