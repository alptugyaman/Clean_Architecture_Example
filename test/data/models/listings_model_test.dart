import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tokens/src/data/models/token/listings_model.dart';
import 'package:tokens/src/data/models/token/quote_model.dart';
import 'package:tokens/src/data/models/token/status_model.dart';
import 'package:tokens/src/data/models/token/token_model.dart';
import 'package:tokens/src/data/models/token/usd_model.dart';
import 'package:tokens/src/domain/entities/token/listings.dart';
import 'package:tokens/src/domain/entities/token/quote.dart';
import 'package:tokens/src/domain/entities/token/status.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/domain/entities/token/usd.dart';

import '../../helpers/json_reader.dart';

void main() {
  final tUsdModel = UsdModel(
    price: 19118.055414939194,
    volume24h: 15011268256.705032,
    volumeChange24h: -23.9168,
    percentChange1h: -0.02159026,
    percentChange24h: -0.97511757,
    percentChange7d: -9.79769059,
    percentChange30d: -35.26125248,
    percentChange60d: -50.88253257,
    percentChange90d: -58.12633285,
    marketCap: 364851837247.01184,
    marketCapDominance: 42.2144,
    fullyDilutedMarketCap: 401479163713.72,
    tvl: null,
    lastUpdated: DateTime(2022, 06, 06),
  );

  final tUsd = Usd(
    price: 19118.055414939194,
    volume24h: 15011268256.705032,
    volumeChange24h: -23.9168,
    percentChange1h: -0.02159026,
    percentChange24h: -0.97511757,
    percentChange7d: -9.79769059,
    percentChange30d: -35.26125248,
    percentChange60d: -50.88253257,
    percentChange90d: -58.12633285,
    marketCap: 364851837247.01184,
    marketCapDominance: 42.2144,
    fullyDilutedMarketCap: 401479163713.72,
    tvl: null,
    lastUpdated: DateTime(2022, 06, 06),
  );

  final tQuoteModel = QuoteModel(usd: tUsdModel);
  final tQuote = Quote(usd: tUsd);

  final tStatusModel = StatusModel(
    timestamp: DateTime(2022, 06, 06),
    errorCode: 0,
    errorMessage: null,
    elapsed: 18,
    creditCount: 1,
    notice: null,
    totalCount: 9977,
  );

  final tStatus = Status(
    timestamp: DateTime(2022, 06, 06),
    errorCode: 0,
    errorMessage: null,
    elapsed: 18,
    creditCount: 1,
    notice: null,
    totalCount: 9977,
  );

  final tTokenModel = TokenModel(
    id: 1,
    name: 'Bitcoin',
    symbol: 'BTC',
    slug: 'bitcoin',
    numMarketPairs: 9598,
    dateAdded: DateTime(2022, 06, 06),
    tags: const [
      "mineable",
      "pow",
      "sha-256",
      "store-of-value",
      "state-channel",
      "coinbase-ventures-portfolio",
      "three-arrows-capital-portfolio",
      "polychain-capital-portfolio",
      "binance-labs-portfolio",
      "blockchain-capital-portfolio",
      "boostvc-portfolio",
      "cms-holdings-portfolio",
      "dcg-portfolio",
      "dragonfly-capital-portfolio",
      "electric-capital-portfolio",
      "fabric-ventures-portfolio",
      "framework-ventures-portfolio",
      "galaxy-digital-portfolio",
      "huobi-capital-portfolio",
      "alameda-research-portfolio",
      "a16z-portfolio",
      "1confirmation-portfolio",
      "winklevoss-capital-portfolio",
      "usv-portfolio",
      "placeholder-ventures-portfolio",
      "pantera-capital-portfolio",
      "multicoin-capital-portfolio",
      "paradigm-portfolio"
    ],
    maxSupply: 21000000,
    circulatingSupply: 19084150,
    totalSupply: 19084150,
    platform: null,
    cmcRank: 1,
    selfReportedCirculatingSupply: null,
    selfReportedMarketCap: null,
    tvlRatio: null,
    lastUpdated: DateTime(2022, 06, 06),
    quoteModel: tQuoteModel,
  );

  final tToken = Token(
    id: 1,
    name: 'Bitcoin',
    symbol: 'BTC',
    slug: 'bitcoin',
    numMarketPairs: 9598,
    dateAdded: DateTime(2022, 06, 06),
    tags: const [
      "mineable",
      "pow",
      "sha-256",
      "store-of-value",
      "state-channel",
      "coinbase-ventures-portfolio",
      "three-arrows-capital-portfolio",
      "polychain-capital-portfolio",
      "binance-labs-portfolio",
      "blockchain-capital-portfolio",
      "boostvc-portfolio",
      "cms-holdings-portfolio",
      "dcg-portfolio",
      "dragonfly-capital-portfolio",
      "electric-capital-portfolio",
      "fabric-ventures-portfolio",
      "framework-ventures-portfolio",
      "galaxy-digital-portfolio",
      "huobi-capital-portfolio",
      "alameda-research-portfolio",
      "a16z-portfolio",
      "1confirmation-portfolio",
      "winklevoss-capital-portfolio",
      "usv-portfolio",
      "placeholder-ventures-portfolio",
      "pantera-capital-portfolio",
      "multicoin-capital-portfolio",
      "paradigm-portfolio"
    ],
    maxSupply: 21000000,
    circulatingSupply: 19084150,
    totalSupply: 19084150,
    platform: null,
    cmcRank: 1,
    selfReportedCirculatingSupply: null,
    selfReportedMarketCap: null,
    tvlRatio: null,
    lastUpdated: DateTime(2022, 06, 06),
    quote: tQuote,
  );

  final tListingsModel = ListingsModel(
    status: tStatusModel,
    token: [tTokenModel],
  );
  final tListings = Listings(
    status: tStatus,
    token: [tToken],
  );

  group('to entity', () {
    test(
      'should be a subclass of Listings entity',
      () async {
        final result = tListingsModel.toEntity();
        expect(result, equals(tListings));
      },
    );
  });

  group('from json', () {
    test(
      'should return a valid model from json',
      () async {
        final Map<String, dynamic> jsonMap = json.decode(
            readJson('helpers/dummy_data/dummy_listings_response.json'));

        final result = ListingsModel.fromJson(jsonMap);

        expect(result, equals(tListingsModel));
      },
    );
  });

  group('to json', () {
    test(
      'should return a json map containing proper data',
      () async {
        final tUsdModelResult = tUsdModel.toJson();

        final expectedJsonMap = {
          'price': 19118.055414939194,
          'volume_24h': 15011268256.705032,
          'volume_change_24h': -23.9168,
          'percent_change_1h': -0.02159026,
          'percent_change_24h': -0.97511757,
          'percent_change_7d': -9.79769059,
          'percent_change_30d': -35.26125248,
          'percent_change_60d': -50.88253257,
          'percent_change_90d': -58.12633285,
          'market_cap': 364851837247.01184,
          'market_cap_dominance': 42.2144,
          'fully_diluted_market_cap': 401479163713.72,
          'tvl': null,
          'last_updated': '2022-06-06T00:00:00.000',
        };
        expect(tUsdModelResult, equals(expectedJsonMap));
      },
    );
  });
}
