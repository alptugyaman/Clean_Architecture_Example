import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tokens/main.dart';
import 'package:tokens/src/config/router/app_router.dart';
import 'package:tokens/src/core/contants/app_contants.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () => router.replace(const TokenRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Center(child: Image.asset(ApplicationConstants.logo)),
    );
  }
}
