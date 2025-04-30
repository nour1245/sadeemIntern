import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:sadeem_tech_intern/core/constants/api_const.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/login_request_body.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';

part 'api_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiServics {
  factory ApiServics(Dio dio, {String baseUrl}) = _ApiServics;

  @POST(ApiConstants.login)
  Future<UserLoginResponseModel> userLogin(
    @Body() LoginRequestBody loginRequestBody,
  );
}
