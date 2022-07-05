import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token_details/coin.dart';

part 'coin_model.g.dart';

@JsonSerializable()
class CoinModel extends Equatable {
  final String? id;
  final String? name;
  final String? symbol;
  final String? slug;

  const CoinModel({this.id, this.name, this.symbol, this.slug});

  factory CoinModel.fromJson(Map<String, dynamic> json) =>
      _$CoinModelFromJson(json);

  Map<String, dynamic> toJson() => _$CoinModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [id, name, symbol, slug];

  Coin toEntity() => Coin(id: id, name: name, slug: slug, symbol: symbol);
}
