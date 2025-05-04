import 'package:sadeem_tech_intern/core/networking/api_error_handler.dart';
import 'package:sadeem_tech_intern/core/networking/api_result.dart';
import 'package:sadeem_tech_intern/core/networking/api_services.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_info_model.dart';

class UserInfoRepo {
  final ApiServics _apiServics;

  UserInfoRepo(this._apiServics);

  Future<ApiResult<UserInfo>> getUserInfo() async {
    try {
      final response = await _apiServics.getUserInfo();
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ApiErrorHandler.handle(e));
    }
  }
}
