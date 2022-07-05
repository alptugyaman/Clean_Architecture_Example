// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    SplashRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const SplashView());
    },
    TokenRoute.name: (routeData) {
      return CustomPage<dynamic>(
          routeData: routeData,
          child: const TokenView(),
          transitionsBuilder: TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    TokenDetailRoute.name: (routeData) {
      final args = routeData.argsAs<TokenDetailRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: TokenDetailView(key: args.key, token: args.token));
    },
    AlertRoute.name: (routeData) {
      final args = routeData.argsAs<AlertRouteArgs>();
      return AdaptivePage<dynamic>(
          routeData: routeData,
          child: AlertView(key: args.key, token: args.token));
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(SplashRoute.name, path: '/'),
        RouteConfig(TokenRoute.name, path: '/token'),
        RouteConfig(TokenDetailRoute.name, path: '/token-detail'),
        RouteConfig(AlertRoute.name, path: '/alert')
      ];
}

/// generated route for
/// [SplashView]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute() : super(SplashRoute.name, path: '/');

  static const String name = 'SplashRoute';
}

/// generated route for
/// [TokenView]
class TokenRoute extends PageRouteInfo<void> {
  const TokenRoute() : super(TokenRoute.name, path: '/token');

  static const String name = 'TokenRoute';
}

/// generated route for
/// [TokenDetailView]
class TokenDetailRoute extends PageRouteInfo<TokenDetailRouteArgs> {
  TokenDetailRoute({Key? key, required Token token})
      : super(TokenDetailRoute.name,
            path: '/token-detail',
            args: TokenDetailRouteArgs(key: key, token: token));

  static const String name = 'TokenDetailRoute';
}

class TokenDetailRouteArgs {
  const TokenDetailRouteArgs({this.key, required this.token});

  final Key? key;

  final Token token;

  @override
  String toString() {
    return 'TokenDetailRouteArgs{key: $key, token: $token}';
  }
}

/// generated route for
/// [AlertView]
class AlertRoute extends PageRouteInfo<AlertRouteArgs> {
  AlertRoute({Key? key, required List<Token> token})
      : super(AlertRoute.name,
            path: '/alert', args: AlertRouteArgs(key: key, token: token));

  static const String name = 'AlertRoute';
}

class AlertRouteArgs {
  const AlertRouteArgs({this.key, required this.token});

  final Key? key;

  final List<Token> token;

  @override
  String toString() {
    return 'AlertRouteArgs{key: $key, token: $token}';
  }
}
