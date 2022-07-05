import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:tokens/src/domain/entities/token/listings.dart';

import 'token_model.dart';
import 'status_model.dart';

part 'listings_model.g.dart';

@JsonSerializable()
class ListingsModel extends Equatable {
  final StatusModel? status;
  @JsonKey(name: 'data')
  final List<TokenModel>? token;

  const ListingsModel({this.status, this.token});

  factory ListingsModel.fromJson(Map<String, dynamic> json) {
    return _$ListingsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ListingsModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [status, token];

  Listings toEntity() => Listings(
        status: status?.toEntity(),
        token: token?.map((e) => e.toEntity()).toList(),
      );
}
