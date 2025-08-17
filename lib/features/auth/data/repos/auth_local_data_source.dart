import 'package:graph/core/services/local_data_base/local_data_base_service.dart';
import 'package:graph/core/utils/hive_boxes.dart';

class AuthLocalDataSource {
  final LocalDataBaseService localDataBaseService;

  AuthLocalDataSource(this.localDataBaseService);

  Future<void> setRejestered(bool value) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.rejestered,
      value: true,
    );
  }

  Future<bool> isRejestered() async {
    final rejestered = await localDataBaseService.getData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.rejestered,
    );
    return rejestered ?? false;
  }

  Future<void> setToken(String token) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.token,
      value: token,
    );
  }

  Future<String?> getToken() async {
    return await localDataBaseService.getData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.token,
    );
  }
}
