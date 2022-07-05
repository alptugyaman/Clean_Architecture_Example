import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:tokens/src/core/contants/url_contants.dart';
import 'package:tokens/src/core/network/network_exception.dart';
import 'package:tokens/src/domain/entities/token/listings.dart';
import 'package:tokens/src/domain/entities/token/quote.dart';
import 'package:tokens/src/domain/entities/token/status.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/domain/entities/token/usd.dart';
import 'package:tokens/src/domain/usecases/get_all_tokens.dart';
import 'package:tokens/src/presentation/bloc/token/token_bloc.dart';

import 'listings_bloc_test.mocks.dart';

@GenerateMocks([GetAllTokens])
void main() {
  late MockGetAllTokens mockGetAllTokens;
  late TokenBloc weatherBloc;

  setUp(() {
    mockGetAllTokens = MockGetAllTokens();
    weatherBloc = TokenBloc(mockGetAllTokens);
  });

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

  final tQuote = Quote(usd: tUsd);

  final tStatus = Status(
    timestamp: DateTime(2022, 06, 06),
    errorCode: 0,
    errorMessage: null,
    elapsed: 18,
    creditCount: 1,
    notice: null,
    totalCount: 9977,
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

  final tListings = Listings(
    status: tStatus,
    token: [tToken],
  );

  test(
    'initial state should be empty',
    () {
      expect(weatherBloc.state, TokenInitial());
    },
  );

  blocTest<TokenBloc, TokenState>(
    'should emit [loading, has data] when data is gotten successfully',
    build: () {
      when(mockGetAllTokens.execute(1, 50))
          .thenAnswer((_) async => Right(tListings));
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnTokensFetched()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TokenLoading(),
      TokenHasData(tListings),
    ],
    verify: (bloc) {
      verify(mockGetAllTokens.execute(1, 50));
    },
  );

  blocTest<TokenBloc, TokenState>(
    'should emit [loading, error] when get data is unsuccessful',
    build: () {
      when(mockGetAllTokens.execute(1, 50)).thenAnswer(
        (_) async => Left(
          NetworkExceptions.fromDioError(
            DioError(
              requestOptions: RequestOptions(
                path: UrlContants.listings,
              ),
            ),
          ),
        ),
      );
      return weatherBloc;
    },
    act: (bloc) => bloc.add(const OnTokensFetched()),
    wait: const Duration(milliseconds: 500),
    expect: () => [
      TokenLoading(),
      const TokenError('Unexpected error occurred'),
    ],
    verify: (bloc) {
      verify(mockGetAllTokens.execute(1, 50));
    },
  );
}
