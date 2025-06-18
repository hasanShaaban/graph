import 'package:flutter/material.dart';

class UserInfoProvider extends ChangeNotifier {
  String? firstName;
  String? lastName;
  String? email;
  String? passWord;
  String? confirmPassword;
  String? dateOfBirth;
  String? gender;
  bool? isStudent;
  String? role;
  String? studyYear;
  String? spacialization;
  String? image;
  UserInfoProvider();
  void setFirstName({required String newFirstName}) async {
    firstName = newFirstName;
    notifyListeners();
  }
   void setLasttName({required String newLastName}) async {
     lastName = newLastName;
    notifyListeners();
  }
   void setEmail({required String newEmail}) async {
    email = newEmail;
    notifyListeners();
  }
   void setPassword({required String newPassword}) async {
    passWord = newPassword;
    notifyListeners();
  }
   void setConfirmPassword({required String newConfirmPassword}) async {
    confirmPassword = newConfirmPassword;
    notifyListeners();
  }
   void setDateOfBirth({required String newDateOfBirth}) async {
    dateOfBirth = newDateOfBirth;
    notifyListeners();
  }
   void setGender({required String newGender}) async {
    gender = newGender;
    notifyListeners();
  }
   void setIsStudent({required bool value}) async {
    isStudent = value ;
    notifyListeners();
  }
   void setRole({required String newRole}) async {
    role = newRole;
    notifyListeners();
  }
   void setStudyYear({required String newStudyYear}) async {
    studyYear = newStudyYear ;
    notifyListeners();
  }
   void setSpacialization({required String newSpacialization}) async {
    spacialization = newSpacialization;
    notifyListeners();
  }
   void setImage({required String newImage}) async {
    image = newImage;
    notifyListeners();
  }
}
