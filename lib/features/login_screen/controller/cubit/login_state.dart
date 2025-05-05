import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sadeem_tech_intern/core/networking/api_error_model.dart';
import 'package:sadeem_tech_intern/features/login_screen/data/models/user_login_response_model.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_profile_model.dart';
part 'login_state.freezed.dart';

@freezed
sealed class LoginState<T> with _$LoginState<T> {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = Loading;
  const factory LoginState.success(UserLoginResponseModel data) = Success;
  const factory LoginState.failure(ApiErrorModel apiErrorModel) = Failure;
}
