import '../../utils/hive_boxes.dart';
import '../local_data_base/local_data_base_service.dart';

class LangeageDataSource {
  final LocalDataBaseService localDataBaseService;

  LangeageDataSource(this.localDataBaseService);

  Future<void> setLangauge(String langauge) async {
    await localDataBaseService.addData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.langauge,
      value: langauge,
    );
  }

  Future<bool> isLanguageSelected() async {
    final langauge = await localDataBaseService.getData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.langauge,
    );
    return langauge != null;
  }

  Future<String?> getLangauge() async {
    final langauge = await localDataBaseService.getData(
      boxName: HiveBoxes.settingsBox,
      key: HiveBoxes.langauge,
    );
    return langauge;
  } 
}