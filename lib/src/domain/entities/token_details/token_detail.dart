import 'package:equatable/equatable.dart';

import 'contract_address.dart';
import 'urls.dart';

class TokenDetail extends Equatable {
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
  final List<String>? tagNames;
  final List<String>? tagGroups;
  final Urls? urls;
  final dynamic platform;
  final DateTime? dateAdded;
  final String? twitterUsername;
  final int? isHidden;
  final dynamic dateLaunched;
  final List<ContractAddress>? contractAddress;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedTags;
  final dynamic selfReportedMarketCap;

  const TokenDetail({
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
}
