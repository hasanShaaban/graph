import 'package:dartz/dartz.dart';
import 'package:graph/features/auth/domain/Entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.firstName,
    required super.lastName,
    required super.email,
    required super.passWord,
    required super.confirmPassword,
    required super.dateOfBirht,
    required super.gender,
    // required super.studentOrNOt,
    // required super.role,
    required super.studyYear,
    required super.spacialization,
   // required super.image,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      passWord: json['password'],
      confirmPassword: json['confirm_password'],
      dateOfBirht: json['birth_date'],
      gender: json['gender'],

      studyYear: json['year_id'],
      spacialization: json['major_id'],
   //   image: json[''],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'password': passWord,
      'confirm_password': confirmPassword,
      'birth_date': dateOfBirht,
      'gender': gender,
      'year_id': studyYear,
      'major_id': spacialization,
     // '': image,
    };
  }
}
