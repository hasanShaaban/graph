import 'package:flutter/foundation.dart';

class PersonalDataProvider extends ChangeNotifier {
  String _username = ""; // default empty (can be "Guest")
  String? _userImage;

  // Getters
  String get username => _username;
  String? get userImage => _userImage;

  // Update username
  set username(String value) {
    if (value != _username) {
      _username = value;
      notifyListeners();
    }
  }

  // Update user image
  set userImage(String? value) {
    if (value != _userImage) {
      _userImage = value;
      notifyListeners();
    }
  }

  // Optionally: update both together
  void setUserData({required String username, String? userImage}) {
    _username = username;
    _userImage = userImage;
    notifyListeners();
  }
}
