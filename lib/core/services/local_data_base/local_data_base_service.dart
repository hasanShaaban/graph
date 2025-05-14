abstract class LocalDataBaseService {
  Future<void> addData({required String boxName, required String key, required dynamic value});
  Future<dynamic> getData({required String boxName, required String key});
  Future<void> deleteData({required String boxName, required String key});
}