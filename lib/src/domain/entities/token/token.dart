import 'package:equatable/equatable.dart';

import 'quote.dart';

class Token extends Equatable {
  final int? id;
  final String? name;
  final String? symbol;
  final String? slug;
  final int? numMarketPairs;
  final DateTime? dateAdded;
  final List<String>? tags;
  final int? maxSupply;
  final double? circulatingSupply;
  final double? totalSupply;
  final dynamic platform;
  final int? cmcRank;
  final dynamic selfReportedCirculatingSupply;
  final dynamic selfReportedMarketCap;
  final dynamic tvlRatio;
  final DateTime? lastUpdated;
  final Quote? quote;

  const Token({
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
    this.quote,
  });

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
      quote,
    ];
  }
}
