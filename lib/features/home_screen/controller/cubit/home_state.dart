import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sadeem_tech_intern/core/networking/api_error_model.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState<T> with _$HomeState<T> {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = Loading;
  const factory HomeState.success(T categories, T bestSeller) = Success<T>;
  const factory HomeState.failure(ApiErrorModel apiErrorModel) = Failure;
}
