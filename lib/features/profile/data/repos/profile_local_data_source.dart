import 'package:graph/core/services/local_data_base/local_data_base_service.dart';
import 'package:graph/core/utils/hive_boxes.dart';

class ProfileLocalDataSource {
  final LocalDataBaseService localDataBaseService;

  ProfileLocalDataSource(this.localDataBaseService);

  Future<void> setStudentYear(int year) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.year,
      value: year,
    );
  }

  Future<int> getStudentYear() async {
    final year = await localDataBaseService.getData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.year,
    );

    return year ?? 0;
  }

  Future<void> setStudentMajor(int? major) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.major,
      value: major,
    );
  }

  Future<int> getStudentMajor() async {
    final major = await localDataBaseService.getData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.major,
    );

    return major ?? 0;
  }

  Future<void> setStudentName(String name) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.name,
      value: name,
    );
  }

  Future<String> getStudentName() async {
    return  await localDataBaseService.getData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.name,
    );
  }

  Future<void> setUserImage(String image) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.image,
      value: image,
    );
  }

  Future<String> getUserImage() async {
    return  await localDataBaseService.getData(
      boxName: HiveBoxes.userBox,
      key: HiveBoxes.image,
    );
  }
}
