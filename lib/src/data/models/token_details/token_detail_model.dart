import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tokens/src/domain/entities/token_details/token_detail.dart';

import 'contract_address_model.dart';
import 'urls_model.dart';

part 'token_detail_model.g.dart';

@JsonSerializable()
class TokenDetailModel extends Equatable {
  final int? id;
  final String? name;
  final String? symbol;
  final String? category;
  final String? description;
  final String? slug;
  final String? logo;
  final String? subreddit;
  final String? notice;
  final List<String>? tags;
  @JsonKey(name: 'tag-names')
  final List<String>? tagNames;
  @JsonKey(name: 'tag-groups')
  final List<String>? tagGroups;
  final UrlsModel? urls;
  final dynamic platform;
  @JsonKey(name: 'date_added')
  final DateTime? dateAdded;
  @JsonKey(name: 'twitter_username')
  final String? twitterUsername;
  @JsonKey(name: 'is_hidden')
  final int? isHidden;
  @JsonKey(name: 'date_launched')
  final dynamic dateLaunched;
  @JsonKey(name: 'contract_address')
  final List<ContractAddressModel>? contractAddress;
  @JsonKey(name: 'self_reported_circulating_supply')
  final dynamic selfReportedCirculatingSupply;
  @JsonKey(name: 'self_reported_tags')
  final dynamic selfReportedTags;
  @JsonKey(name: 'self_reported_market_cap')
  final dynamic selfReportedMarketCap;

  const TokenDetailModel({
    this.id,
    this.name,
    this.symbol,
    this.category,
    this.description,
    this.slug,
    this.logo,
    this.subreddit,
    this.notice,
    this.tags,
    this.tagNames,
    this.tagGroups,
    this.urls,
    this.platform,
    this.dateAdded,
    this.twitterUsername,
    this.isHidden,
    this.dateLaunched,
    this.contractAddress,
    this.selfReportedCirculatingSupply,
    this.selfReportedTags,
    this.selfReportedMarketCap,
  });

  factory TokenDetailModel.fromJson(Map<String, dynamic> json) =>
      _$TokenDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokenDetailModelToJson(this);

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      name,
      symbol,
      category,
      description,
      slug,
      logo,
      subreddit,
      notice,
      tags,
      tagNames,
      tagGroups,
      urls,
      platform,
      dateAdded,
      twitterUsername,
      isHidden,
      dateLaunched,
      contractAddress,
      selfReportedCirculatingSupply,
      selfReportedTags,
      selfReportedMarketCap,
    ];
  }

  TokenDetail toEntity() => TokenDetail(
        id: id,
        name: name,
        symbol: symbol,
        category: category,
        description: description,
        slug: slug,
        logo: logo,
        subreddit: subreddit,
        notice: notice,
        tags: tags,
        tagNames: tagNames,
        tagGroups: tagGroups,
        urls: urls?.toEntity(),
        platform: platform,
        dateAdded: dateAdded,
        twitterUsername: twitterUsername,
        isHidden: isHidden,
        dateLaunched: dateLaunched,
        contractAddress: contractAddress?.map((e) => e.toEntity()).toList(),
        selfReportedCirculatingSupply: selfReportedCirculatingSupply,
        selfReportedTags: selfReportedTags,
        selfReportedMarketCap: selfReportedMarketCap,
      );
}
