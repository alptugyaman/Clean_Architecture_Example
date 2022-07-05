import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tokens/src/config/router/app_router.dart';
import 'package:tokens/src/core/theme/app_theme.dart';
import 'package:tokens/src/injector.dart' as di;
import 'package:tokens/src/presentation/bloc/alerts/alerts_bloc.dart';
import 'package:tokens/src/presentation/bloc/token/token_bloc.dart';
import 'package:tokens/src/presentation/bloc/token_detail/token_detail_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await dotenv.load(fileName: ".env");
  runApp(const MyApp());
}

final router = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.injector<TokenBloc>()),
        BlocProvider(create: (_) => di.injector<TokenDetailBloc>()),
        BlocProvider(create: (_) => di.injector<AlertsBloc>()),
      ],
      child: ScreenUtilInit(
        builder: (context, _) {
          return MaterialApp.router(
            title: 'Tracker',
            theme: AppTheme.theme,
            routerDelegate: router.delegate(),
            routeInformationParser: router.defaultRouteParser(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
