import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:skill_on_base/src/base/utils/constants.dart';
import 'package:skill_on_base/src/base/utils/utils.dart';
import 'package:skill_on_base/src/models/FormData/login_form_model.dart';
import 'package:skill_on_base/src/models/FormData/register_form_data.dart';
import 'package:skill_on_base/src/models/FormData/social_login_form_model.dart';
import 'package:skill_on_base/src/models/user.dart';
import 'package:skill_on_base/src/services/remote/api_client.dart';
import 'package:skill_on_base/src/services/remote/api_result.dart';
import 'package:skill_on_base/src/services/remote/interseptor/main_interceptor.dart';
import 'package:skill_on_base/src/services/remote/network_exceptions.dart';

class ApiService {
  ApiClient? _apiClient;
  ApiClient? _apiMainClient;

  ApiService() {
    _apiClient = ApiClient(Dio());
    _apiMainClient = ApiClient(Dio(), interceptors: [MainApiInterceptor()]);
  }

  Future<ApiResult<UserModel>?> userLogin(LoginFormData data, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "user/login",
        data: data.toJson(),
      );
      if (response!.statusCode != 200) {
        context.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      context.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
  Future<ApiResult<UserModel>?> userSocialLogin(SocialLoginFormData data, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "user/socialLogin",
        data: data.toJson(),
      );
      if (response!.statusCode != 200) {
        context.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      context.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
  Future<ApiResult<UserModel>?> userRegister(RegisterFormData data, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "user/register",
        data: data.toJson(),
      );
      if (response!.statusCode != 200) {
        context.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      context.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
  Future<ApiResult<UserModel>?> userForgotPassword(String email, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "user/forgotPassword",
        data: {
          "email": email,
        },
      );
      if (response!.statusCode != 200) {
        context.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      context.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
  Future<ApiResult<UserModel>?> userResendOTP(dynamic data, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "user/resendOtp",
        data: data,
      );
      if (response!.statusCode != 200) {
        context.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      context.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }
  Future<ApiResult<UserModel>?> userChangePassword(dynamic data, BuildContext context) async {
    try {
      var response = await _apiClient?.postReq(
        "user/changePassword",
        data: data,
      );
      if (response!.statusCode != 200) {
        context.customWarningSnack(response.message.toString());
        return null;
      }
      return ApiResult.success(data: UserModel.fromJson(response.data));
    } catch (e) {
      context.customWarningSnack(
          NetworkExceptions.getDioExceptionMessage(e).toString());
      return ApiResult.failure(error: NetworkExceptions.getDioException(e)!);
    }
  }

}
