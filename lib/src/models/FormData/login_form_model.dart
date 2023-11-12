class LoginFormData {
  final String? email;
  final String? password;
  final String? fcm;
  LoginFormData(
      {required this.email, required this.password, required this.fcm});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'fcm': fcm ?? "",
    };
  }
}
