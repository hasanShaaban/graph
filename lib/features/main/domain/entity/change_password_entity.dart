class ChangePasswordEntity {
  final String oldPassword;
  final String newPassword;
  final String confirmNewPassword;

  ChangePasswordEntity({required this.oldPassword, required this.newPassword, required this.confirmNewPassword});
  
}
