// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokenDetailModel _$TokenDetailModelFromJson(Map<String, dynamic> json) =>
    TokenDetailModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      symbol: json['symbol'] as String?,
      category: json['category'] as String?,
      description: json['description'] as String?,
      slug: json['slug'] as String?,
      logo: json['logo'] as String?,
      subreddit: json['subreddit'] as String?,
      notice: json['notice'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      tagNames: (json['tag-names'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      tagGroups: (json['tag-groups'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      urls: json['urls'] == null
          ? null
          : UrlsModel.fromJson(json['urls'] as Map<String, dynamic>),
      platform: json['platform'],
      dateAdded: json['date_added'] == null
          ? null
          : DateTime.parse(json['date_added'] as String),
      twitterUsername: json['twitter_username'] as String?,
      isHidden: json['is_hidden'] as int?,
      dateLaunched: json['date_launched'],
      contractAddress: (json['contract_address'] as List<dynamic>?)
          ?.map((e) => ContractAddressModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      selfReportedCirculatingSupply: json['self_reported_circulating_supply'],
      selfReportedTags: json['self_reported_tags'],
      selfReportedMarketCap: json['self_reported_market_cap'],
    );

Map<String, dynamic> _$TokenDetailModelToJson(TokenDetailModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'symbol': instance.symbol,
      'category': instance.category,
      'description': instance.description,
      'slug': instance.slug,
      'logo': instance.logo,
      'subreddit': instance.subreddit,
      'notice': instance.notice,
      'tags': instance.tags,
      'tag-names': instance.tagNames,
      'tag-groups': instance.tagGroups,
      'urls': instance.urls,
      'platform': instance.platform,
      'date_added': instance.dateAdded?.toIso8601String(),
      'twitter_username': instance.twitterUsername,
      'is_hidden': instance.isHidden,
      'date_launched': instance.dateLaunched,
      'contract_address': instance.contractAddress,
      'self_reported_circulating_supply':
          instance.selfReportedCirculatingSupply,
      'self_reported_tags': instance.selfReportedTags,
      'self_reported_market_cap': instance.selfReportedMarketCap,
    };
