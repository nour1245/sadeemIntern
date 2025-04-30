import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sadeem_tech_intern/core/networking/api_error_model.dart';
part 'api_result.freezed.dart';

@Freezed()
sealed class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success(T data) = Success<T>;
  const factory ApiResult.failure(ApiErrorModel apiErrorModel) = Failure<T>;
}
