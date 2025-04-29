import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ApiErrorModel {
  final String? message;

  ApiErrorModel({this.message});

  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);


}
