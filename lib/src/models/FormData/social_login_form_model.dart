class SocialLoginFormData {
  final String? email;
  final String? fcm;
  SocialLoginFormData(
      {required this.email, required this.fcm});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'fcm': fcm ?? "123",
    };
  }
}
