import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:tokens/src/domain/entities/token/token.dart';
import 'package:tokens/src/presentation/view/alert_view.dart';

import 'package:tokens/src/presentation/view/splash_view.dart';
import 'package:tokens/src/presentation/view/token_detail_view.dart';
import 'package:tokens/src/presentation/view/token_view.dart';

part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  // * for names
  replaceInRouteName: 'View,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: SplashView,
      path: '/',
      initial: true,
    ),
    CustomRoute(
      path: '/token',
      page: TokenView,
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    AutoRoute(
      path: '/token-detail',
      page: TokenDetailView,
    ),
    AutoRoute(
      path: '/alert',
      page: AlertView,
    ),
  ],
)

/// `AppRouter` is a class that extends `_` and is used to generate a `Router` object
class AppRouter extends _$AppRouter {}
