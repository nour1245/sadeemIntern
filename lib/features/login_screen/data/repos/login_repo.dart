import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/login_request_body.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_profile_model.dart';

class LoginRepo {
  final ApiServics _apiServics;

  LoginRepo(this._apiServics);
  Future<ApiResult<UserLoginResponseModel>> userLogin(
    LoginRequestBody loginRequestBody,
  ) async {
    try {
      final result = await _apiServics.userLogin(loginRequestBody);
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UserLoginResponseModel>> getUserById(int id) async {
    try {
      final response = await _apiServics.getUserById(id);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UserLoginResponseModel>> refreshToken(
    String refreshToken,
  ) async {
    try {
      final result = await _apiServics.refreshToken({
        'refreshToken': refreshToken,
        'expiresInMins': 30,
      });
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }

  Future<ApiResult<UserProfile>> getCurrentUser() async {
    try {
      final result = await _apiServics.getCurrentUser();
      return ApiResult.success(result);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
