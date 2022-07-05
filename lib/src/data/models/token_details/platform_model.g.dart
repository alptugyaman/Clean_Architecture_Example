// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'platform_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlatformModel _$PlatformModelFromJson(Map<String, dynamic> json) =>
    PlatformModel(
      name: json['name'] as String?,
      coin: json['coin'] == null
          ? null
          : CoinModel.fromJson(json['coin'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PlatformModelToJson(PlatformModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'coin': instance.coin,
    };
