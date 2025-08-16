import 'dart:io';

class UserEntity {
  String? firstName;
   String? lastName;
 String? email;
  String? passWord;
   String? confirmPassword;
   String? dateOfBirht;
 String? gender;
  // final String studentOrNOt;
  // final String role;
 int? studyYear;
  int? spacialization;
  File? image;

  UserEntity({
this.firstName,
    this.lastName,
     this.email,
 this.passWord,
     this.confirmPassword,
     this.dateOfBirht,
     this.gender,
   // required this.studentOrNOt,
   // required this.role,
     this.studyYear,
     this.spacialization,
     this.image,
  });
}
