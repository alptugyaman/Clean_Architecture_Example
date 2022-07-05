// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contract_address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContractAddressModel _$ContractAddressModelFromJson(
        Map<String, dynamic> json) =>
    ContractAddressModel(
      contractAddress: json['contract_address'] as String?,
      platform: json['platform'] == null
          ? null
          : PlatformModel.fromJson(json['platform'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ContractAddressModelToJson(
        ContractAddressModel instance) =>
    <String, dynamic>{
      'contract_address': instance.contractAddress,
      'platform': instance.platform,
    };
