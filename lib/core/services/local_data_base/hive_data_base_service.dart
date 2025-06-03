import 'package:hive/hive.dart';

import 'local_data_base_service.dart';

//the implemntation of the local data base methods
class HiveDataBaseService implements LocalDataBaseService {
  @override
  Future<void> addData({
    required String boxName,
    required String key,
    required dynamic value,
  }) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
  }

  @override
  Future<dynamic> getData({
    required String boxName,
    required String key,
  }) async {
    var box = await Hive.openBox(boxName);
    var data = box.get(key);
    return data;
  }

  @override
  Future<void> deleteData({
    required String boxName,
    required String key,
  }) async {
    var box = await Hive.openBox(boxName);
    await box.delete(key);
  }
}
