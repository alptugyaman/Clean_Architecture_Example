import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token_details/contract_address.dart';

import 'platform_model.dart';

part 'contract_address_model.g.dart';

@JsonSerializable()
class ContractAddressModel extends Equatable {
  @JsonKey(name: 'contract_address')
  final String? contractAddress;
  final PlatformModel? platform;

  const ContractAddressModel({this.contractAddress, this.platform});

  factory ContractAddressModel.fromJson(Map<String, dynamic> json) {
    return _$ContractAddressModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContractAddressModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [contractAddress, platform];

  ContractAddress toEntity() => ContractAddress(
        contractAddress: contractAddress,
        platform: platform?.toEntity(),
      );
}
