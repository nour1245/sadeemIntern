import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'categories_model.g.dart';

@HiveType(typeId: 0) // <-- Unique ID for this model
@JsonSerializable()
class CategoriesFetchModel extends HiveObject {
  @HiveField(0)
  @JsonKey(name: "slug")
  String slug;

  @HiveField(1)
  @JsonKey(name: "name")
  String name;

  @HiveField(2)
  @JsonKey(name: "url")
  String url;

  CategoriesFetchModel({
    required this.slug,
    required this.name,
    required this.url,
  });

  factory CategoriesFetchModel.fromJson(Map<String, dynamic> json) =>
      _$CategoriesFetchModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoriesFetchModelToJson(this);
}
