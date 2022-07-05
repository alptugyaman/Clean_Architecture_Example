import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tokens/src/domain/entities/token/listings.dart';
import 'package:tokens/src/domain/entities/token/quote.dart';
import 'package:tokens/src/domain/entities/token/status.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/domain/entities/token/usd.dart';
import 'package:tokens/src/presentation/bloc/token/token_bloc.dart';
import 'package:tokens/src/presentation/view/token_view.dart';
import 'package:tokens/src/presentation/widgets/token/token_list_widget.dart';

class MockTokenBloc extends MockBloc<TokenEvent, TokenState>
    implements TokenBloc {}

class FakeTokenState extends Fake implements TokenState {}

class FakeTokenEvent extends Fake implements TokenEvent {}

void main() {
  late MockTokenBloc mockTokenBloc;

  setUpAll(() async {
    HttpOverrides.global = null;
    registerFallbackValue(FakeTokenState());
    registerFallbackValue(FakeTokenEvent());

    final di = GetIt.instance;
    di.registerFactory(() => mockTokenBloc);
  });

  setUp(() {
    mockTokenBloc = MockTokenBloc();
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

  Widget _makeTestableWidget(Widget body) {
    return BlocProvider<TokenBloc>(
      create: (context) => mockTokenBloc,
      child: ScreenUtilInit(builder: (context, _) {
        return MaterialApp(
          title: 'Widget Test',
          home: body,
        );
      }),
    );
  }

  testWidgets(
    'should show progress indicator when state is loading',
    (WidgetTester tester) async {
      when(() => mockTokenBloc.state).thenReturn(TokenLoading());

      await tester.pumpWidget(_makeTestableWidget(const TokenView()));

      expect(find.byType(CircularProgressIndicator), equals(findsOneWidget));
    },
  );

  testWidgets(
    'should show widget contain token list widget when state is has data',
    (WidgetTester tester) async {
      when(() => mockTokenBloc.state).thenReturn(TokenHasData(tListings));

      await tester.pumpWidget(_makeTestableWidget(const TokenView()));

      expect(find.byType(TokenList), equals(findsOneWidget));
    },
  );
}
