import '../../../../core/services/local_data_base/local_data_base_service.dart';
import '../../../../core/utils/hive_boxes.dart';

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

  Future<void> setUserId(int userId) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.userID,
      value: userId,
    );
  }

  Future<int> getUserId() async {
    return await localDataBaseService.getData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.userID,
    );
  }
}
