import 'package:json_annotation/json_annotation.dart';
import 'cart_response_model.dart'; // for CartResponseModel

part 'user_cart_response_model.g.dart';

@JsonSerializable()
class UserCartResponse {
  @JsonKey(name: 'carts')
  List<CartResponseModel> carts;
  @JsonKey(name: 'total')
  int total;
  @JsonKey(name: 'skip')
  int skip;
  @JsonKey(name: 'limit')
  int limit;

  UserCartResponse({
    required this.carts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory UserCartResponse.fromJson(Map<String, dynamic> json) =>
      _$UserCartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserCartResponseToJson(this);
}
