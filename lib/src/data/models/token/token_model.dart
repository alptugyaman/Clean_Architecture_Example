import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token/token.dart';

import 'quote_model.dart';

part 'token_model.g.dart';

@JsonSerializable()
class TokenModel extends Equatable {
  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  @JsonKey(name: 'num_market_pairs')
  final int? numMarketPairs;
  @JsonKey(name: 'date_added')
  final DateTime? dateAdded;
  final List<String>? tags;
  @JsonKey(name: 'max_supply')
  final int? maxSupply;
  @JsonKey(name: 'circulating_supply')
  final double? circulatingSupply;
  @JsonKey(name: 'total_supply')
  final double? totalSupply;
  final dynamic platform;
  @JsonKey(name: 'cmc_rank')
  final int? cmcRank;
  @JsonKey(name: 'self_reported_circulating_supply')
  final dynamic selfReportedCirculatingSupply;
  @JsonKey(name: 'self_reported_market_cap')
  final dynamic selfReportedMarketCap;
  @JsonKey(name: 'tvl_ratio')
  final dynamic tvlRatio;
  @JsonKey(name: 'last_updated')
  final DateTime? lastUpdated;
  @JsonKey(name: 'quote')
  final QuoteModel? quoteModel;

  const TokenModel({
    this.id,
    this.name,
    this.symbol,
    this.slug,
    this.numMarketPairs,
    this.dateAdded,
    this.tags,
    this.maxSupply,
    this.circulatingSupply,
    this.totalSupply,
    this.platform,
    this.cmcRank,
    this.selfReportedCirculatingSupply,
    this.selfReportedMarketCap,
    this.tvlRatio,
    this.lastUpdated,
    this.quoteModel,
  });

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      symbol,
      slug,
      numMarketPairs,
      dateAdded,
      tags,
      maxSupply,
      circulatingSupply,
      totalSupply,
      platform,
      cmcRank,
      selfReportedCirculatingSupply,
      selfReportedMarketCap,
      tvlRatio,
      lastUpdated,
      quoteModel,
    ];
  }

  Token toEntity() => Token(
        id: id,
        name: name,
        symbol: symbol,
        slug: slug,
        numMarketPairs: numMarketPairs,
        dateAdded: dateAdded,
        tags: tags,
        maxSupply: maxSupply,
        circulatingSupply: circulatingSupply,
        totalSupply: totalSupply,
        platform: platform,
        cmcRank: cmcRank,
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedMarketCap: selfReportedMarketCap,
        tvlRatio: tvlRatio,
        lastUpdated: lastUpdated,
        quote: quoteModel?.toEntity(),
      );
}
