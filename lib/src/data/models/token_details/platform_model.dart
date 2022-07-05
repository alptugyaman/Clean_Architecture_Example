import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token_details/platform.dart';

import 'coin_model.dart';

part 'platform_model.g.dart';

@JsonSerializable()
class PlatformModel extends Equatable {
  final String? name;
  final CoinModel? coin;

  const PlatformModel({this.name, this.coin});

  factory PlatformModel.fromJson(Map<String, dynamic> json) {
    return _$PlatformModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$PlatformModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, coin];

  Platform toEntity() => Platform(
        name: name,
        coin: coin?.toEntity(),
      );
}
