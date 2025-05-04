import 'package:freezed_annotation/freezed_annotation.dart';
part 'search_product_state.freezed.dart';
@freezed
class SearchProductState<T> with _$SearchProductState<T> {
  const factory SearchProductState.initial() = _Initial;
  const factory SearchProductState.loading() = Loading;
  const factory SearchProductState.success(T data) = Success;
  const factory SearchProductState.failure(String error) = Failure;
}
