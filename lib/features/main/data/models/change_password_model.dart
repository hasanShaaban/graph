import 'package:graph/features/main/domain/entity/change_password_entity.dart';

class ChangePasswordModel extends ChangePasswordEntity {
  ChangePasswordModel({
    required super.oldPassword,
    required super.newPassword,
    required super.confirmNewPassword,
  });

  factory ChangePasswordModel.fromJson(Map<String, dynamic> json) {
    return ChangePasswordModel(
      oldPassword: json['current_password'] ?? '',
      newPassword: json['new_password'] ?? '',
      confirmNewPassword: json['confirm_password'] ?? '',
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "current_password": oldPassword,
      "new_password": newPassword,
      "confirm_password": confirmNewPassword,
    };
  }
}
