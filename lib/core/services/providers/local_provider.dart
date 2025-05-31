import 'package:flutter/material.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/services/sources/langeage_data_source.dart';

class LocalProvider extends ChangeNotifier {
  final LangeageDataSource langeageDataSource =
      getIt<LangeageDataSource>();

  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  Future<void> loadLocale() async {
    final langauge = await langeageDataSource.getLangauge();
    _locale = langauge != null ? Locale(langauge) : const Locale('en');
    notifyListeners();
  }

  Future<void> setLocal(String langauge) async {
    await langeageDataSource.setLangauge(langauge);
    _locale = Locale(langauge);
    notifyListeners();
  }
}
