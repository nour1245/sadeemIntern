import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sadeem_tech_intern/features/cart_page/data/models/user_cart_response_model.dart';
part 'cart_state.freezed.dart';

@freezed
class CartState<T> with _$CartState<T> {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = Loading;
  const factory CartState.success() = Success;
  const factory CartState.error(String error) = Error;

  const factory CartState.userCartloading() = UserCartLoading;
  const factory CartState.userCartsuccess(UserCartResponse cart) = UserCartSuccess;
  const factory CartState.userCarterror(String error) = UserCartError;
}
