import 'package:flutter/material.dart';

class GroupProvider extends ChangeNotifier {
  int? _projectId;
  int? _skillId;

  int? get projectId => _projectId;
  int? get skillId => _skillId;

  void setProjectId(int id) {
    _projectId = id;
    notifyListeners();
  }

  void setSkillId(int id) {
    _skillId = id;
    notifyListeners();
  }

  void clear() {
    _projectId = null;
    _skillId = null;
    notifyListeners();
  }
}
