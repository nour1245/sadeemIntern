import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sadeem_tech_intern/features/user_info/data/models/user_info_model.dart';
part 'user_info_state.freezed.dart';

@freezed
class UserInfoState<T> with _$UserInfoState<T> {
  const factory UserInfoState.initial() = _Initial;
  const factory UserInfoState.loading() = Loading;
  const factory UserInfoState.success(UserInfo userData) = Success;
  const factory UserInfoState.failure(String error) = Failure;
}
