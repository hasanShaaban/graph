import '../../../../core/services/local_data_base/local_data_base_service.dart';
import '../../../../core/utils/hive_boxes.dart';

class OnBoardingLocalDataSource {
  final LocalDataBaseService localDataBaseService;

  OnBoardingLocalDataSource(this.localDataBaseService);

  Future<void> setOnBoardingSeen() async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.onBoardingSeen,
      value: true,
    );
  }

  Future<bool> isOnBoardingSeen() async {
    final seen = await localDataBaseService.getData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.onBoardingSeen,
    );
    return seen ?? false;
  }
}
