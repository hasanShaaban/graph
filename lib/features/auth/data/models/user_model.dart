import '../../domain/Entity/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    required super.firstName,
    required super.lastName,

    super.dateOfBirht,
    super.gender,
    // required super.studentOrNOt,
    // required super.role,
    super.studyYear,
    super.spacialization,
    required super.image,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      firstName: json['first_name'],
      lastName: json['last_name'],

      dateOfBirht: json['birth_date'],
      gender: json['gender'],

      studyYear: json['year_id'],
      spacialization: json['major_id'],
      image: json['profile_image'],
      // image: null,
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
      'profile_image': image,
    };
  }
}
