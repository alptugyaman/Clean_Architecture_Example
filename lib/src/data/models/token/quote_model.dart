import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:tokens/src/domain/entities/token/quote.dart';

import 'usd_model.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel extends Equatable {
  @JsonKey(name: 'USD')
  final UsdModel? usd;

  const QuoteModel({this.usd});

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [usd];

  Quote toEntity() => Quote(usd: usd?.toEntity());
}
