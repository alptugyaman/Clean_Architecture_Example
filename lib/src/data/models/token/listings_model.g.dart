// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ListingsModel _$ListingsModelFromJson(Map<String, dynamic> json) =>
    ListingsModel(
      status: json['status'] == null
          ? null
          : StatusModel.fromJson(json['status'] as Map<String, dynamic>),
      token: (json['data'] as List<dynamic>?)
          ?.map((e) => TokenModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ListingsModelToJson(ListingsModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.token,
    };
