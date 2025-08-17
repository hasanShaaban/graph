import '../../domain/Entity/user_entity.dart';

class CompanyModel extends UserEntity {
  CompanyModel({
    required super.firstName,
    required super.image,
  });
  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      firstName: json['company_name'],
      image: json['profile_image'],

    );
  }
  Map<String, dynamic> toJson() {
    return {
      'company_name': firstName,
      'profile_image': image,
  
    };
  }
}
