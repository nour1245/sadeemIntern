import 'package:json_annotation/json_annotation.dart';
part 'cart_response_model.g.dart';

@JsonSerializable()
class CartResponseModel {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "products")
  List<CartProduct> products;
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "discountedTotal")
  int discountedTotal;
  @JsonKey(name: "userId")
  int userId;
  @JsonKey(name: "totalProducts")
  int totalProducts;
  @JsonKey(name: "totalQuantity")
  int totalQuantity;

  CartResponseModel({
    required this.id,
    required this.products,
    required this.total,
    required this.discountedTotal,
    required this.userId,
    required this.totalProducts,
    required this.totalQuantity,
  });

  factory CartResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CartResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CartResponseModelToJson(this);
}

@JsonSerializable()
class CartProduct {
  @JsonKey(name: "id")
  int id;
  @JsonKey(name: "title")
  String title;
  @JsonKey(name: "price")
  double price;
  @JsonKey(name: "quantity")
  int quantity;
  @JsonKey(name: "total")
  double total;
  @JsonKey(name: "discountPercentage")
  double discountPercentage;
  @JsonKey(name: "discountedTotal")
  int discountedTotal;
  @JsonKey(name: "thumbnail")
  String thumbnail;

  CartProduct({
    required this.id,
    required this.title,
    required this.price,
    required this.quantity,
    required this.total,
    required this.discountPercentage,
    required this.discountedTotal,
    required this.thumbnail,
  });

  factory CartProduct.fromJson(Map<String, dynamic> json) =>
      _$CartProductFromJson(json);

  Map<String, dynamic> toJson() => _$CartProductToJson(this);
}
