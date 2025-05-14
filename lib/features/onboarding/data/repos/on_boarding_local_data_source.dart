
import 'package:graph/core/services/local_data_base/local_data_base_service.dart';
import 'package:graph/core/utils/hive_boxes.dart';

class OnBoardingLocalDataSource {
  final LocalDataBaseService localDataBaseService;

  OnBoardingLocalDataSource(this.localDataBaseService);

  static const key = 'onBoardingSeen';

  Future<void> setOnBoardingSeen() async {
    await localDataBaseService.addData(boxName: HiveBoxes.settingsBox, key: key, value: true);
  }

  Future<bool> isOnBoardingSeen() async {
    final seen = await localDataBaseService.getData(boxName: HiveBoxes.settingsBox, key: key);
    return seen ?? false;
  }
}