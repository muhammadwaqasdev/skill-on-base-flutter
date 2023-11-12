import 'dart:io';

import 'package:dio/dio.dart';

class RegisterFormData {
  String? fullName;
  String? email;
  String? phone;
  String? password;
  String? fcm;

  RegisterFormData({
    this.fullName,
    this.email,
    this.phone,
    this.password,
    this.fcm,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'email': email,
      'phone': phone,
      'password': password,
      'fcm': fcm ?? "123",
    };
  }
}
