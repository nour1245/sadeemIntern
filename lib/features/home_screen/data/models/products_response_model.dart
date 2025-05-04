import 'package:json_annotation/json_annotation.dart';
part 'products_response_model.g.dart';
@JsonSerializable()
class ProductsResponseModel {
    @JsonKey(name: "products")
    List<Product> products;
    @JsonKey(name: "total")
    int total;
    @JsonKey(name: "skip")
    int skip;
    @JsonKey(name: "limit")
    int limit;

    ProductsResponseModel({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductsResponseModel.fromJson(Map<String, dynamic> json) => _$ProductsResponseModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProductsResponseModelToJson(this);
}

@JsonSerializable()
class Product {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "title")
    String title;
    @JsonKey(name: "description")
    String description;
    @JsonKey(name: "category")
    String category;
    @JsonKey(name: "price")
    double price;
    @JsonKey(name: "discountPercentage")
    double discountPercentage;
    @JsonKey(name: "rating")
    double rating;
    @JsonKey(name: "stock")
    int stock;
    @JsonKey(name: "tags")
    List<String> tags;
    @JsonKey(name: "brand")
    String? brand;
    @JsonKey(name: "warrantyInformation")
    String warrantyInformation;
    @JsonKey(name: "shippingInformation")
    String shippingInformation;
    @JsonKey(name: "availabilityStatus")
    String availabilityStatus;
    @JsonKey(name: "reviews")
    List<Review> reviews;
    @JsonKey(name: "returnPolicy")
    String returnPolicy;
    @JsonKey(name: "minimumOrderQuantity")
    int minimumOrderQuantity;

    @JsonKey(name: "images")
    List<String> images;
    @JsonKey(name: "thumbnail")
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.tags,
        this.brand,
        required this.warrantyInformation,
        required this.shippingInformation,
        required this.availabilityStatus,
        required this.reviews,
        required this.returnPolicy,
        required this.minimumOrderQuantity,
        required this.images,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

    Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Review {
    @JsonKey(name: "rating")
    int rating;
    @JsonKey(name: "comment")
    String comment;
    @JsonKey(name: "date")
    DateTime date;
    @JsonKey(name: "reviewerName")
    String reviewerName;
    @JsonKey(name: "reviewerEmail")
    String reviewerEmail;

    Review({
        required this.rating,
        required this.comment,
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail,
    });

    factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

    Map<String, dynamic> toJson() => _$ReviewToJson(this);
}
