// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CategoriesFetchModelAdapter extends TypeAdapter<CategoriesFetchModel> {
  @override
  final int typeId = 0;

  @override
  CategoriesFetchModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoriesFetchModel(
      slug: fields[0] as String,
      name: fields[1] as String,
      url: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CategoriesFetchModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.slug)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoriesFetchModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoriesFetchModel _$CategoriesFetchModelFromJson(
        Map<String, dynamic> json) =>
    CategoriesFetchModel(
      slug: json['slug'] as String,
      name: json['name'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$CategoriesFetchModelToJson(
        CategoriesFetchModel instance) =>
    <String, dynamic>{
      'slug': instance.slug,
      'name': instance.name,
      'url': instance.url,
    };
