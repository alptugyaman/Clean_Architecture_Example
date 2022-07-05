// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenModel _$TokenModelFromJson(Map<String, dynamic> json) => TokenModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      slug: json['slug'] as String?,
      numMarketPairs: json['num_market_pairs'] as int?,
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      maxSupply: json['max_supply'] as int?,
      circulatingSupply: (json['circulating_supply'] as num?)?.toDouble(),
      totalSupply: (json['total_supply'] as num?)?.toDouble(),
      platform: json['platform'],
      cmcRank: json['cmc_rank'] as int?,
      selfReportedCirculatingSupply: json['self_reported_circulating_supply'],
      selfReportedMarketCap: json['self_reported_market_cap'],
      tvlRatio: json['tvl_ratio'],
      lastUpdated: json['last_updated'] == null
          ? null
          : DateTime.parse(json['last_updated'] as String),
      quoteModel: json['quote'] == null
          ? null
          : QuoteModel.fromJson(json['quote'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TokenModelToJson(TokenModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'slug': instance.slug,
      'num_market_pairs': instance.numMarketPairs,
      'date_added': instance.dateAdded?.toIso8601String(),
      'tags': instance.tags,
      'max_supply': instance.maxSupply,
      'circulating_supply': instance.circulatingSupply,
      'total_supply': instance.totalSupply,
      'platform': instance.platform,
      'cmc_rank': instance.cmcRank,
      'self_reported_circulating_supply':
          instance.selfReportedCirculatingSupply,
      'self_reported_market_cap': instance.selfReportedMarketCap,
      'tvl_ratio': instance.tvlRatio,
      'last_updated': instance.lastUpdated?.toIso8601String(),
      'quote': instance.quoteModel,
    };
