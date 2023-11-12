class ForgotPassFormModel {
  String? email;
  String? code;
  String? newPassword;
  String? confirmNewPass;
  ForgotPassFormModel(
      {this.email, this.code, this.newPassword, this.confirmNewPass});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': newPassword,
      'cpassword': confirmNewPass,
    };
  }
}
