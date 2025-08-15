import 'package:graph/features/auth/domain/Entity/user_entity.dart';
import 'package:graph/features/auth/presentation/views/widgets/signup_text_form_fields.dart';

class CredintialsModel extends UserEntity {
  CredintialsModel({
    required super.email,
    required super.passWord,
    required super.confirmPassword,
  });
  factory CredintialsModel.fromJson(Map<String, dynamic> json) {
    return CredintialsModel(
      email: json['email'],
      passWord: json['password'],
      confirmPassword: json['confirm_password'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'confirm_password': confirmPassword,
    };
  }
}
