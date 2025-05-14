
import 'package:graph/core/services/local_data_base/local_data_base_service.dart';
import 'package:hive/hive.dart';

//the implemntation of the local data base methods
class HiveDataBaseService implements LocalDataBaseService {
  @override
  Future<void> addData({required String boxName, required String key, required dynamic value}) async {
    var box = await Hive.openBox(boxName);
    await box.put(key, value);
    await box.close();
  }

  @override
  Future<dynamic> getData({required String boxName, required String key}) async {
    var box = await Hive.openBox(boxName);
    var data = box.get(key);
    await box.close();
    return data;
  }

  @override
  Future<void> deleteData({required String boxName, required String key}) async {
    var box = await Hive.openBox(boxName);
    await box.delete(key);
    await box.close();
  }
}
