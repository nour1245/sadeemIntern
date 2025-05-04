// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cart_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserCartResponse _$UserCartResponseFromJson(Map<String, dynamic> json) =>
    UserCartResponse(
      carts: (json['carts'] as List<dynamic>)
          .map((e) => CartResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: (json['total'] as num).toInt(),
      skip: (json['skip'] as num).toInt(),
      limit: (json['limit'] as num).toInt(),
    );

Map<String, dynamic> _$UserCartResponseToJson(UserCartResponse instance) =>
    <String, dynamic>{
      'carts': instance.carts,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };
